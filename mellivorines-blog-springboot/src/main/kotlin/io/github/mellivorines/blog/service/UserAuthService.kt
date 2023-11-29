package io.github.mellivorines.blog.service

import com.alibaba.fastjson2.JSON
import io.github.mellivorines.blog.constant.CommonConstant
import io.github.mellivorines.blog.constant.CommonConstant.CODE_EXPIRE_TIME
import io.github.mellivorines.blog.constant.CommonConstant.EMAIL_EXCHANGE
import io.github.mellivorines.blog.constant.CommonConstant.USER_AREA
import io.github.mellivorines.blog.constant.CommonConstant.USER_CODE_KEY
import io.github.mellivorines.blog.constant.CommonConstant.VISITOR_AREA
import io.github.mellivorines.blog.constant.LoginTypeEnum
import io.github.mellivorines.blog.exception.BizException
import io.github.mellivorines.blog.model.entity.UserAuth
import io.github.mellivorines.blog.model.entity.UserInfo
import io.github.mellivorines.blog.model.entity.addBy
import io.github.mellivorines.blog.model.entity.by
import io.github.mellivorines.blog.model.entity.dto.UserAuthAdmin
import io.github.mellivorines.blog.model.vo.PasswordVO
import io.github.mellivorines.blog.model.vo.UserVO
import io.github.mellivorines.blog.repository.UserAuthRepository
import io.github.mellivorines.blog.repository.UserInfoRepository
import io.github.mellivorines.blog.utils.CommonUtil.checkEmail
import io.github.mellivorines.blog.utils.CommonUtil.getRandomCode
import io.github.mellivorines.blog.constant.UserAreaTypeEnum
import io.github.mellivorines.salamanderblog.out.ConditionVO
import io.github.mellivorines.salamanderblog.out.dto.EmailDTO
import io.github.mellivorines.salamanderblog.out.dto.UserAreaDTO
import io.github.oshai.kotlinlogging.KotlinLogging
import org.babyfish.jimmer.kt.new
import org.springframework.amqp.core.Message
import org.springframework.amqp.core.MessageProperties
import org.springframework.amqp.rabbit.core.RabbitTemplate
import org.springframework.data.domain.Page
import org.springframework.security.core.userdetails.User
import org.springframework.security.core.userdetails.UserDetails
import org.springframework.security.core.userdetails.UserDetailsService
import org.springframework.security.core.userdetails.UsernameNotFoundException
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
import org.springframework.stereotype.Service
import java.util.*


/**
 * @Description:
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/8/28
 */
@Service
class UserAuthService(
    private val userAuthRepository: UserAuthRepository,
    private val userInfoRepository: UserInfoRepository,
    private val rabbitTemplate: RabbitTemplate,
    private val redisService: RedisService
) : UserDetailsService {

    private val logger = KotlinLogging.logger {}

    override fun loadUserByUsername(username: String): UserDetails {
        val userAuth = findAccountByNameOrEmail(username)
        if (userAuth == null) {
            logger.error { "用户名或密码错误" }
            throw UsernameNotFoundException("用户名或密码错误")
        } else {
            return User
                .withUsername(username)
                .password(userAuth.password)
                .roles(userAuth.roles.stream().map { it.roleName }.toList().toString())
                .build()
        }
    }

    /**
     * 通过用户名或邮件地址查找用户
     * @param text 用户名或邮件
     * @return 账户实体
     */
    fun findAccountByNameOrEmail(text: String): UserAuth? {
        return userAuthRepository.findByUsernameOrEmail(text)
    }

    fun sendCode(username: String): Boolean {
        if (!checkEmail(username)) {
            logger.error { "请输入正确邮箱" }
            throw BizException("请输入正确邮箱")
        }
        val code: String = getRandomCode()
        val map: MutableMap<String, Any> = HashMap()
        map["content"] = "您的验证码为 $code 有效期15分钟，请不要告诉他人哦！"
        val emailDTO = EmailDTO(
            username,
            CommonConstant.CAPTCHA,
            map,
            "common.html"
        )
        rabbitTemplate.convertAndSend(
            EMAIL_EXCHANGE, "*",
            Message(JSON.toJSONBytes(emailDTO), MessageProperties())
        )
        redisService.set(USER_CODE_KEY + username, code, CODE_EXPIRE_TIME)
        return true
    }

    fun listUserAreas(conditionVO: ConditionVO): List<UserAreaDTO> {

        var userAreaDTOList: List<UserAreaDTO> = ArrayList()
        when (conditionVO.type) {
            UserAreaTypeEnum.USER.type -> {
                val userArea = redisService.get(USER_AREA)
                if (Objects.nonNull(userArea)) {
                    userAreaDTOList = JSON.parseArray(userArea.toString(), UserAreaDTO::class.java)
                }
                return userAreaDTOList
            }

            UserAreaTypeEnum.VISITOR.type -> {
                val visitorArea: Map<*, *> = redisService.hGetAll(VISITOR_AREA)
                if (Objects.nonNull(visitorArea)) {
                    visitorArea.map { (k, v) -> UserAreaDTO(name = k.toString(), value = v.toString().toLong()) }
                        .toList()
                }
                return userAreaDTOList
            }

            else -> {}
        }
        return userAreaDTOList
    }

    fun listUsers(conditionVo: ConditionVO): Page<UserAuthAdmin> = userAuthRepository.listAdminUser(conditionVo)


    fun register(userVO: UserVO): Any {

        if (!checkEmail(userVO.username)) {
            throw BizException("邮箱格式不对!")
        }
        if (checkUser(userVO)) {
            throw BizException("邮箱已被注册！")
        }

        val userInfo = new(UserInfo::class).by {
            email = userVO.username
            nickname = CommonConstant.DEFAULT_NICKNAME
//            avatar = auroraInfoService.getWebsiteConfig().getUserAvatar()
            avatar = "https://static.linhaojun.top/avatar/2af2e2db20740e712f0a011a6f8c9af5.jpg"
        }
        val save = userInfoRepository.save(userInfo)

        val userAuth = new(UserAuth::class).by {
            username = userVO.username
            password = BCryptPasswordEncoder().encode(userVO.password)
            loginType = LoginTypeEnum.EMAIL.type
            userInfo().apply {
                id = save.id
            }
            roles().addBy {
                id = 2
            }

        }
        return userAuthRepository.sql.save(userAuth).totalAffectedRowCount > 0
    }


    fun updatePassword(userVo: UserVO): Any {
        if (!checkUser(userVo)) {
            throw BizException("邮箱尚未注册！")
        }

        val findUserAuth: UserAuth? = userAuthRepository.findByUsernameOrEmail(userVo.username)
        val userAuth = new(UserAuth::class).by {
            if (findUserAuth != null) {
                id = findUserAuth.id
            }
            username = userVo.username
            password = BCryptPasswordEncoder().encode(userVo.password)
        }
        return userAuthRepository.sql.update(userAuth).totalAffectedRowCount > 0

    }


    fun updateAdminPassword(passwordVo: PasswordVO): Any {
        val findUserAuth: UserAuth? = userAuthRepository.findByUsernameOrEmail(passwordVo.username)
        if (findUserAuth != null) {
            if (BCryptPasswordEncoder().encode(passwordVo.oldPassword).equals(findUserAuth.password)) {
                val userAuthWithNewPassword = new(UserAuth::class).by {
                    id = findUserAuth.id
                    password = BCryptPasswordEncoder().encode(passwordVo.newPassword)
                }
                return userAuthRepository.sql.update(userAuthWithNewPassword).totalAffectedRowCount > 0
            } else {
                throw BizException("旧密码不正确")
            }
        } else {
            throw BizException("用户不存在！")
        }
    }


    private fun checkUser(user: UserVO): Boolean {
        if (user.code != redisService.get(USER_CODE_KEY + user.username)) {
            throw BizException("验证码错误！")
        }
        val userAuth: UserAuth? = userAuthRepository.findByUsernameOrEmail(user.username)
        return Objects.nonNull(userAuth)
    }
}
