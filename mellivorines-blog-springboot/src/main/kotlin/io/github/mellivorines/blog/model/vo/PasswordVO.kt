package io.github.mellivorines.blog.model.vo


/**
 * @Description:
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/9/2
 */
data class PasswordVO(
    val username: String,
    val oldPassword: String,
    val newPassword: String
)