package io.github.mellivorines.blog.model.vo


/**
 * @Description:
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/9/3
 */
data class UserInfoVO(
    val id: Int,

    /**
     *  邮箱号
     */
    val email: String? = null,

    /**
     *  用户昵称
     */
    val nickname: String? = null,

    /**
     *  用户头像
     */
    val avatar: String? = null,

    /**
     *  用户简介
     */
    val intro: String? = null,

    /**
     *  个人网站
     */
    val website: String? = null,

    /**
     *  是否订阅
     */
    val isSubscribe: Int? = null,

    /**
     *  是否禁用
     */
    val isDisable: Int? = null,

    /**
     * 验证码
     */
    val code: String? = null
)
