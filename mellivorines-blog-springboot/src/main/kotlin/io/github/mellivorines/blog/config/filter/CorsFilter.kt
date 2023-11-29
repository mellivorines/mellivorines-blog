//package io.github.mellivorines.blog.config.filter
//
//import io.github.mellivorines.blog.constant.CommonConstant
//import jakarta.servlet.FilterChain
//import jakarta.servlet.ServletException
//import jakarta.servlet.http.HttpFilter
//import jakarta.servlet.http.HttpServletRequest
//import jakarta.servlet.http.HttpServletResponse
//import org.springframework.beans.factory.annotation.Value
//import org.springframework.core.annotation.Order
//import org.springframework.stereotype.Component
//import java.io.IOException
//
//
///**
// * @Description:跨域配置过滤器，仅处理跨域，添加跨域响应头
// *
// * @author lilinxi
// * @version 1.0.0
// * @since 2023/8/28
// */
//@Component
//@Order(CommonConstant.ORDER_CORS)
//class CorsFilter : HttpFilter() {
//    @Value("\${spring.web.cors.origin}")
//    var origin: String? = null
//
//    @Value("\${spring.web.cors.credentials}")
//    var credentials = false
//
//    @Value("\${spring.web.cors.methods}")
//    var methods: String? = null
//
//    @Throws(IOException::class, ServletException::class)
//    override fun doFilter(request: HttpServletRequest, response: HttpServletResponse, chain: FilterChain) {
//        addCorsHeader(request, response)
//        chain.doFilter(request, response)
//    }
//
//    /**
//     * 添加所有跨域相关响应头
//     * @param request 请求
//     * @param response 响应
//     */
//    private fun addCorsHeader(request: HttpServletRequest, response: HttpServletResponse) {
//        response.addHeader("Access-Control-Allow-Origin", resolveOrigin(request))
//        response.addHeader("Access-Control-Allow-Methods", resolveMethod())
//        response.addHeader("Access-Control-Allow-Headers", "Authorization, Content-Type")
//        if (credentials) {
//            response.addHeader("Access-Control-Allow-Credentials", "true")
//        }
//    }
//
//    /**
//     * 解析配置文件中的请求方法
//     * @return 解析得到的请求头值
//     */
//    private fun resolveMethod(): String {
//        return if (methods == "*") "GET, HEAD, POST, PUT, DELETE, OPTIONS, TRACE, PATCH" else methods!!
//    }
//
//    /**
//     * 解析配置文件中的请求原始站点
//     * @param request 请求
//     * @return 解析得到的请求头值
//     */
//    private fun resolveOrigin(request: HttpServletRequest): String {
//        return if (origin == "*") request.getHeader("Origin") else origin!!
//    }
//}
//
