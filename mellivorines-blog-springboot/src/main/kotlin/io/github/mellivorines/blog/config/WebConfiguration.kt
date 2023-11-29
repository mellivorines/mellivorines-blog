package io.github.mellivorines.blog.config

import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
import org.springframework.security.crypto.password.PasswordEncoder
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer


/**
 * @Description:一般Web服务相关配置
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/8/28
 */
@Configuration
class WebConfiguration : WebMvcConfigurer {
    @Bean
    fun passwordEncoder(): PasswordEncoder {
        return BCryptPasswordEncoder()
    }
}
