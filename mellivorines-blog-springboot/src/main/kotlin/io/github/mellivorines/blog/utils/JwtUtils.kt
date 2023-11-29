package io.github.mellivorines.blog.utils

import com.auth0.jwt.JWT
import com.auth0.jwt.algorithms.Algorithm
import com.auth0.jwt.exceptions.JWTVerificationException
import com.auth0.jwt.interfaces.DecodedJWT
import io.github.mellivorines.blog.constant.CommonConstant
import org.springframework.beans.factory.annotation.Value
import org.springframework.data.redis.core.RedisTemplate
import org.springframework.security.core.GrantedAuthority
import org.springframework.security.core.userdetails.User
import org.springframework.security.core.userdetails.UserDetails
import org.springframework.stereotype.Component
import java.util.*
import java.util.concurrent.TimeUnit
import kotlin.math.max


/**
 * @Description:用于处理Jwt令牌的工具类
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/8/28
 */
@Component
class JwtUtils(
    private val utils: FlowUtils,
    private val template: RedisTemplate<String, String>
) {
    //用于给Jwt令牌签名校验的秘钥
    @Value("\${spring.security.jwt.key}")
    private lateinit var  key: String

    //令牌的过期时间，以小时为单位
    @Value("\${spring.security.jwt.expire}")
    private val expire = 0

    //为用户生成Jwt令牌的冷却时间，防止刷接口频繁登录生成令牌，以秒为单位
    @Value("\${spring.security.jwt.limit.base}")
    private val limitBase = 0

    //用户如果继续恶意刷令牌，更严厉的封禁时间
    @Value("\${spring.security.jwt.limit.upgrade}")
    private val limitUpgrade = 0

    //判定用户在冷却时间内，继续恶意刷令牌的次数
    @Value("\${spring.security.jwt.limit.frequency}")
    private val limitFrequency = 0

    /**
     * 让指定Jwt令牌失效
     * @param headerToken 请求头中携带的令牌
     * @return 是否操作成功
     */
    fun invalidateJwt(headerToken: String): Boolean {
        val token = convertToken(headerToken)
        val algorithm = Algorithm.HMAC256(key)
        val jwtVerifier = JWT.require(algorithm).build()
        return try {
            val verify = jwtVerifier.verify(token)
            deleteToken(verify.id, verify.expiresAt)
        } catch (e: JWTVerificationException) {
            false
        }
    }

    /**
     * 根据配置快速计算过期时间
     * @return 过期时间
     */
    fun expireTime(): Date {
        val calendar = Calendar.getInstance()
        calendar.add(Calendar.HOUR, expire)
        return calendar.time
    }

    /**
     * 根据UserDetails生成对应的Jwt令牌
     * @param user 用户信息
     * @return 令牌
     */
    fun createJwt(user: UserDetails, username: String?, userId: Int): String? {
        return if (frequencyCheck(userId)) {
            val algorithm = Algorithm.HMAC256(key)
            val expire = expireTime()
            JWT.create()
                .withJWTId(UUID.randomUUID().toString())
                .withClaim("id", userId)
                .withClaim("name", username)
                .withClaim(
                    "authorities", user.authorities
                        .stream()
                        .map { obj: GrantedAuthority -> obj.authority }.toList()
                )
                .withExpiresAt(expire)
                .withIssuedAt(Date())
                .sign(algorithm)
        } else {
            null
        }
    }

    /**
     * 解析Jwt令牌
     * @param headerToken 请求头中携带的令牌
     * @return DecodedJWT
     */
    fun resolveJwt(headerToken: String?): DecodedJWT? {
        val token = convertToken(headerToken) ?: return null
        val algorithm = Algorithm.HMAC256(key)
        val jwtVerifier = JWT.require(algorithm).build()
        return try {
            val verify = jwtVerifier.verify(token)
            if (isInvalidToken(verify.id)) return null
            val claims = verify.claims
            if (Date().after(claims["exp"]!!.asDate())) null else verify
        } catch (e: JWTVerificationException) {
            null
        }
    }

    /**
     * 将jwt对象中的内容封装为UserDetails
     * @param jwt 已解析的Jwt对象
     * @return UserDetails
     */
    fun toUser(jwt: DecodedJWT): UserDetails {
        val claims = jwt.claims
        return User
            .withUsername(claims["name"]!!.asString())
            .password("******")
            .authorities(*claims["authorities"]!!.asArray(String::class.java))
            .build()
    }

    /**
     * 将jwt对象中的用户ID提取出来
     * @param jwt 已解析的Jwt对象
     * @return 用户ID
     */
    fun toId(jwt: DecodedJWT): Int {
        val claims = jwt.claims
        return claims["id"]!!.asInt()
    }

    /**
     * 频率检测，防止用户高频申请Jwt令牌，并且采用阶段封禁机制
     * 如果已经提示无法登录的情况下用户还在刷，那么就封禁更长时间
     * @param userId 用户ID
     * @return 是否通过频率检测
     */
    private fun frequencyCheck(userId: Int): Boolean {
        val key: String = CommonConstant.JWT_FREQUENCY + userId
        return utils.limitOnceUpgradeCheck(key, limitFrequency, limitBase, limitUpgrade)
    }

    /**
     * 校验并转换请求头中的Token令牌
     * @param headerToken 请求头中的Token
     * @return 转换后的令牌
     */
    private fun convertToken(headerToken: String?): String? {
        return if (headerToken == null || !headerToken.startsWith("Bearer ")) null else headerToken.substring(7)
    }

    /**
     * 将Token列入Redis黑名单中
     * @param uuid 令牌ID
     * @param time 过期时间
     * @return 是否操作成功
     */
    private fun deleteToken(uuid: String, time: Date): Boolean {
        if (isInvalidToken(uuid)) return false
        val now = Date()
        val expire = max((time.time - now.time).toDouble(), 0.0).toLong()
        template.opsForValue()[CommonConstant.JWT_BLACK_LIST + uuid, "", expire] = TimeUnit.MILLISECONDS
        return true
    }

    /**
     * 验证Token是否被列入Redis黑名单
     * @param uuid 令牌ID
     * @return 是否操作成功
     */
    private fun isInvalidToken(uuid: String): Boolean {
        return java.lang.Boolean.TRUE == template.hasKey(CommonConstant.JWT_BLACK_LIST + uuid)
    }
}

