package io.github.mellivorines.blog.config.filter

import com.auth0.jwt.interfaces.DecodedJWT
import io.github.mellivorines.blog.constant.CommonConstant
import io.github.mellivorines.blog.utils.JwtUtils
import jakarta.servlet.FilterChain
import jakarta.servlet.ServletException
import jakarta.servlet.http.HttpServletRequest
import jakarta.servlet.http.HttpServletResponse
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.security.core.userdetails.UserDetails
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource
import org.springframework.stereotype.Component
import org.springframework.web.filter.OncePerRequestFilter
import java.io.IOException


/**
 * @Description:用于对请求头中Jwt令牌进行校验的工具
 * 为当前请求添加用户验证信息
 * 并将用户的ID存放在请求对象属性中，方便后续使用
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/8/28
 */
@Component
class JwtAuthenticationFilter(private val utils: JwtUtils) : OncePerRequestFilter() {

    @Throws(ServletException::class, IOException::class)
    override fun doFilterInternal(
        request: HttpServletRequest,
        response: HttpServletResponse,
        filterChain: FilterChain
    ) {
        val authorization = request.getHeader("Authorization")
        val jwt: DecodedJWT? = utils.resolveJwt(authorization)
        if (jwt != null) {
            val user: UserDetails = utils.toUser(jwt)
            val authentication = UsernamePasswordAuthenticationToken(user, null, user.authorities)
            authentication.details = WebAuthenticationDetailsSource().buildDetails(request)
            SecurityContextHolder.getContext().authentication = authentication
            request.setAttribute(CommonConstant.ATTR_USER_ID, utils.toId(jwt))
        }
        filterChain.doFilter(request, response)
    }
}
