//package io.github.mellivorines.blog.config.filter
//
//import org.springframework.boot.web.servlet.FilterRegistrationBean
//import org.springframework.context.annotation.Bean
//import org.springframework.context.annotation.Configuration
//import org.springframework.core.Ordered
//import org.springframework.web.cors.CorsConfiguration
//import org.springframework.web.cors.UrlBasedCorsConfigurationSource
//import org.springframework.web.filter.CorsFilter
//import org.springframework.web.servlet.config.annotation.CorsRegistry
//import org.springframework.web.servlet.config.annotation.WebMvcConfigurer
//
//
///**
// * @Description:
// *
// * @author lilinxi
// * @version 1.0.0
// * @since 2023/9/17
// */
//
//
//@Configuration
//class CorsConfig : WebMvcConfigurer {
//    override fun addCorsMappings(registry: CorsRegistry) {
//        registry.addMapping("/**")
//            .allowedOriginPatterns("*")
//            .allowedMethods("GET", "POST", "PUT", "DELETE")
//            .allowedHeaders("*")
//            .allowCredentials(true)
//            .maxAge(3600)
//            .exposedHeaders("Authorization")
//    }
//
//    @Bean
//    fun corsFilter(): FilterRegistrationBean<CorsFilter> {
//        val source = UrlBasedCorsConfigurationSource()
//        val config = CorsConfiguration()
//        config.addAllowedOriginPattern("*")
//        config.addAllowedHeader("*")
//        config.addAllowedMethod("*")
//        config.allowCredentials = true
//        config.maxAge = 3600L
//        source.registerCorsConfiguration("/**", config)
//        val bean: FilterRegistrationBean<CorsFilter> = FilterRegistrationBean<CorsFilter>(CorsFilter(source))
//        bean.order = Ordered.HIGHEST_PRECEDENCE
//        return bean
//    }
//}