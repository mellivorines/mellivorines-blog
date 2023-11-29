package io.github.mellivorines.blog.model.entity

import org.babyfish.jimmer.sql.*


/**
 * <p>
 * 友链

 * </p>
 *
 * @author lilinxi
 * @date 2023-08-17
 */
@Entity
@Table(name = "mellivorines_blog_friend_link")
interface FriendLink : BaseEntity {

    /**
     *  id
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Int

    /**
     *  链接名
     */
    @Column(name = "link_name")
    val linkName: String

    /**
     *  链接头像
     */
    @Column(name = "link_avatar")
    val linkAvatar: String

    /**
     *  链接地址
     */
    @Column(name = "link_address")
    val linkAddress: String

    /**
     *  链接介绍
     */
    @Column(name = "link_intro")
    val linkIntro: String
}
