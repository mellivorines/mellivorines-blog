package io.github.mellivorines.blog.model.vo

import java.util.*


/**
 * @Description:登录验证成功的用户信息响应
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/8/28
 */
data class AuthorizeVO(
    var user: UserInfoVO,
    var role: List<String>,
    var token: String,
    var expire: Date
)