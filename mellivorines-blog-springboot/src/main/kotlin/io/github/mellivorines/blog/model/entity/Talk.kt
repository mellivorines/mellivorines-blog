package io.github.mellivorines.blog.model.entity

import org.babyfish.jimmer.sql.*


/**
 * <p>
 * 说说

 * </p>
 *
 * @author lilinxi
 * @date 2023-08-17
 */
@Entity
@Table(name = "mellivorines_blog_talk")
interface Talk : BaseEntity {

    /**
     *  说说id
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Int

    @ManyToOne
    @JoinColumn(name = "user_id")
    val user: UserInfo

    /**
     *  说说内容
     */
    val content: String

    /**
     *  图片
     */
    val images: String?

    /**
     *  是否置顶
     */
    @Column(name = "is_top")
    val isTop: Int

    /**
     *  状态 1.公开 2.私密
     */
    val status: Int

}
