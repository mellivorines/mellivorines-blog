package io.github.mellivorines.blog.model.vo


/**
 * @Description:
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/9/3
 */
data class UserRoleVO(
    val userInfoId: Int,
    val nickname: String,
    val roleIds: List<Int>
)
