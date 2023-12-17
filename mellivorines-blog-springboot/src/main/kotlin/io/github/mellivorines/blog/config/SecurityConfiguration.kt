package io.github.mellivorines.blog.config

import io.github.mellivorines.blog.constant.CommonConstant
import io.github.mellivorines.blog.config.filter.JwtAuthenticationFilter
import io.github.mellivorines.blog.model.ResultVO
import io.github.mellivorines.blog.model.vo.AuthorizeVO
import io.github.mellivorines.blog.utils.JwtUtils
import io.github.mellivorines.blog.model.entity.UserAuth
import io.github.mellivorines.blog.model.vo.UserInfoVO
import io.github.mellivorines.blog.service.UserAuthService
import jakarta.servlet.http.HttpServletRequest
import jakarta.servlet.http.HttpServletResponse
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.security.access.AccessDeniedException
import org.springframework.security.config.annotation.web.builders.HttpSecurity
import org.springframework.security.config.annotation.web.configurers.*
import org.springframework.security.config.http.SessionCreationPolicy
import org.springframework.security.core.Authentication
import org.springframework.security.core.AuthenticationException
import org.springframework.security.core.userdetails.User
import org.springframework.security.web.SecurityFilterChain
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter
import java.io.IOException


/**
 * @Description:
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/8/28
 */
@Configuration
class SecurityConfiguration(
    private var jwtAuthenticationFilter: JwtAuthenticationFilter,
    private var utils: JwtUtils,
    private var userAuthService: UserAuthService
) {


    /**
     * 针对于 SpringSecurity 6 的新版配置方法
     * @param http 配置器
     * @return 自动构建的内置过滤器链
     * @throws Exception 可能的异常
     */
    @Bean
    @Throws(Exception::class)
    fun filterChain(http: HttpSecurity): SecurityFilterChain {
        return http
            .authorizeHttpRequests { conf ->
                conf
                    .requestMatchers("/local-plus/**", "/api/**", "/admin/auth/login","/error").permitAll()
                    .requestMatchers("/swagger-ui/**", "/webjars/**", "/v3/api-docs/**").permitAll() // 放行开发文档资源目录
                    .requestMatchers("/doc.html").permitAll() // 放行开发文档资源目录
                    .requestMatchers("/static/**", "/resources/**").permitAll() // 其余的都需要权限校验
                    .anyRequest().hasAnyRole(CommonConstant.ROLE_DEFAULT)
            }
            .formLogin { conf: FormLoginConfigurer<HttpSecurity> ->
                conf
                    .loginProcessingUrl("/admin/auth/login")
                    .failureHandler { request: HttpServletRequest, response: HttpServletResponse, exceptionOrAuthentication: AuthenticationException ->
                        handleProcess(
                            request,
                            response,
                            exceptionOrAuthentication
                        )
                    }
                    .successHandler { request: HttpServletRequest, response: HttpServletResponse, exceptionOrAuthentication: Authentication ->
                        handleProcess(
                            request,
                            response,
                            exceptionOrAuthentication
                        )
                    }
                    .permitAll()
            }
            .logout { conf: LogoutConfigurer<HttpSecurity> ->
                conf
                    .logoutUrl("/admin/auth/logout")
                    .logoutSuccessHandler {
                        request: HttpServletRequest, response: HttpServletResponse, authentication: Authentication ->
                        onLogoutSuccess(
                            request,
                            response,
                            authentication
                        )
                    }
            }
            .exceptionHandling { conf: ExceptionHandlingConfigurer<HttpSecurity> ->
                conf
                    .accessDeniedHandler { request: HttpServletRequest, response: HttpServletResponse, exceptionOrAuthentication: AccessDeniedException ->
                        handleProcess(
                            request,
                            response,
                            exceptionOrAuthentication
                        )
                    }
                    .authenticationEntryPoint { request: HttpServletRequest, response: HttpServletResponse, exceptionOrAuthentication: AuthenticationException ->
                        handleProcess(
                            request,
                            response,
                            exceptionOrAuthentication
                        )
                    }
            }
            .csrf { obj: CsrfConfigurer<HttpSecurity> -> obj.disable() }
            .sessionManagement { conf: SessionManagementConfigurer<HttpSecurity> ->
                conf
                    .sessionCreationPolicy(SessionCreationPolicy.STATELESS)
            }
            .addFilterBefore(jwtAuthenticationFilter, UsernamePasswordAuthenticationFilter::class.java)
            .build()
    }

    /**
     * 将多种类型的Handler整合到同一个方法中，包含：
     * - 登录成功
     * - 登录失败
     * - 未登录拦截/无权限拦截
     * @param request 请求
     * @param response 响应
     * @param exceptionOrAuthentication 异常或是验证实体
     * @throws IOException 可能的异常
     */
    @Throws(IOException::class)
    private fun handleProcess(
        request: HttpServletRequest,
        response: HttpServletResponse,
        exceptionOrAuthentication: Any
    ) {
        response.contentType = "application/json;charset=utf-8"
        val writer = response.writer
        if (exceptionOrAuthentication is AccessDeniedException) {
            exceptionOrAuthentication.message?.let {
                ResultVO
                    .forbidden<String>(it).asJsonString()
            }?.let {
                writer.write(
                    it
                )
            }
        } else if (exceptionOrAuthentication is Exception) {
            exceptionOrAuthentication.message?.let {
                ResultVO
                    .unauthorized<String>(it).asJsonString()
            }?.let {
                writer.write(
                    it
                )
            }
        } else if (exceptionOrAuthentication is Authentication) {
            val user = exceptionOrAuthentication.principal as User
            val account: UserAuth? = userAuthService.findAccountByNameOrEmail(user.username)
            val jwt: String? = account?.let { utils.createJwt(user, account.username, it.userInfoId) }
            if (jwt == null) {
                writer.write(ResultVO.forbidden<String>("登录验证频繁，请稍后再试").asJsonString())
            } else {
                val authorizeVO = AuthorizeVO(
                    user = UserInfoVO(
                        account.userInfo.id,
                        account.userInfo.email,
                        account.userInfo.nickname,
                        account.userInfo.avatar,
                        account.userInfo.intro,
                        account.userInfo.website,
                        account.userInfo.isSubscribe,
                        account.userInfo.isDisable
                    ),
                    role = account.roles.stream().map { it.roleName }.toList(),
                    token = jwt,
                    expire = utils.expireTime()
                )
                writer.write(ResultVO.success(authorizeVO).asJsonString())
            }
        }
    }

    /**
     * 退出登录处理，将对应的Jwt令牌列入黑名单不再使用
     * @param request 请求
     * @param response 响应
     * @param authentication 验证实体
     * @throws IOException 可能的异常
     */
    @Throws(IOException::class)
    private fun onLogoutSuccess(
        request: HttpServletRequest,
        response: HttpServletResponse,
        authentication: Authentication
    ) {
        response.contentType = "application/json;charset=utf-8"
        val writer = response.writer
        val authorization = request.getHeader("Authorization")
        if (utils.invalidateJwt(authorization)) {
            writer.write(ResultVO.success("退出登录成功").asJsonString())
            return
        }
        writer.write(ResultVO.failure<String>(400, "退出登录失败").asJsonString())
    }
}

