package io.github.mellivorines.blog.model.vo

data class RoleVO(
    val id: Int,
    val roleName: String,
    val resourceIds: List<Int>,
    val menuIds: List<Int>
)
