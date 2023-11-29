package io.github.mellivorines.blog.constant


/**
 * @Description:
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/9/2
 */
enum class RoleEnum(val roleId: Int, val roleName: String, val label: String) {
    ADMIN(1, "管理员", "admin"),
    USER(2, "用户", "user"),
    TEST(3, "测试", "test");
}
