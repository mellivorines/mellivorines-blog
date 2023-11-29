package io.github.mellivorines.blog.model.entity

import org.babyfish.jimmer.sql.*


/**
 * <p>
 * 文章

 * </p>
 *
 * @author lilinxi
 * @date 2023-08-17
 */
@Entity
@Table(name = "mellivorines_blog_article")
interface Article : BaseEntity {

    /**
     *  id
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Int


    /**
     *  文章缩略图
     */
    @Column(name = "article_cover")
    val articleCover: String?

    /**
     *  标题
     */
    @Column(name = "article_title")
    val articleTitle: String

    /**
     *  内容
     */
    @Column(name = "article_content")
    val articleContent: String

    /**
     *  是否置顶 0否 1是
     */
    @Column(name = "is_top")
    val isTop: Int

    /**
     *  是否推荐 0否 1是
     */
    @Column(name = "is_featured")
    val isFeatured: Int

    /**
     *  是否删除  0否 1是
     */
    @Column(name = "is_delete")
    val isDelete: Int

    /**
     *  状态值 1公开 2私密 3草稿
     */
    val status: Int

    /**
     *  文章类型 1原创 2转载 3翻译
     */
    val type: Int

    /**
     *  访问密码
     */
    val password: String?

    /**
     *  原文链接
     */
    @Column(name = "original_url")
    val originalUrl: String?


    @ManyToOne
    @JoinColumn(name = "user_id")
    val user: UserInfo

    @IdView()
    val userId: Int

    @ManyToOne
    val category: Category

    @IdView()
    val categoryId: Int

    @ManyToMany
    @JoinTable(
        name = "mellivorines_blog_article_tag",
        joinColumnName = "article_id",
        inverseJoinColumnName = "tag_id"
    )
    val myTags: List<MyTag>
}
