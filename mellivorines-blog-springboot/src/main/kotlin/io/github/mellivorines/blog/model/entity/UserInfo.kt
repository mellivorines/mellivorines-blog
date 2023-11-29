package io.github.mellivorines.blog.model.entity

import org.babyfish.jimmer.sql.*

/**
 * <p>
 * 用户-信息

 * </p>
 *
 * @author lilinxi
 * @date 2023-08-17
 */
@Entity
@Table(name = "mellivorines_blog_user_info")
interface UserInfo : BaseEntity {

    /**
     *  用户ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Int

    /**
     *  邮箱号
     */
    val email: String?

    /**
     *  用户昵称
     */
    val nickname: String

    /**
     *  用户头像
     */
    val avatar: String

    /**
     *  用户简介
     */
    val intro: String?

    /**
     *  个人网站
     */
    val website: String?

    /**
     *  是否订阅
     */
    @Column(name = "is_subscribe")
    val isSubscribe: Int?

    /**
     *  是否禁用
     */
    @Column(name = "is_disable")
    val isDisable: Int

}
