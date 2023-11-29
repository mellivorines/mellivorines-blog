package io.github.mellivorines.blog.constant


/**
 * @Description:
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/9/2
 */
enum class LoginTypeEnum(
    val type: Int,
    val desc: String,
    val strategy: String
) {
    EMAIL(1, "邮箱登录", ""),
    QQ(2, "QQ登录", "qqLoginStrategyImpl");
}
