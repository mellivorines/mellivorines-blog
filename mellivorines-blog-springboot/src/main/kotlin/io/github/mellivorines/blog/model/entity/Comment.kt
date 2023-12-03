package io.github.mellivorines.blog.model.entity

import org.babyfish.jimmer.sql.*


/**
 * <p>
 * 内容

 * </p>
 *
 * @author lilinxi
 * @date 2023-08-17
 */
@Entity
@Table(name = "mellivorines_blog_comment")
interface Comment : BaseEntity {

    /**
     *  主键
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Int

//    /**
//     *  评论用户Id
//     */
//    @Column(name = "user_id")
//    val userId: Int

    @ManyToOne
    @JoinColumn(name = "user_id")
    val user: UserInfo

    @IdView()
    val userId: Int

    /**
     *  评论主题id
     */
    @Column(name = "topic_id")
    val topicId: Int?

    /**
     *  评论内容
     */
    @Column(name = "comment_content")
    val commentContent: String

    /**
     *  回复用户id
     */
    @Column(name = "reply_user_id")
    val replyUserId: Int?

    /**
     *  评论类型 1.文章 2.留言 3.关于我 4.友链 5.说说
     */
    val type: Int

    /**
     *  是否删除  0否 1是
     */
    @Column(name = "is_delete")
    val isDelete: Int

    /**
     *  是否审核
     */
    @Column(name = "is_review")
    val isReview: Int

    @Key
    @ManyToOne
    @OnDissociate(DissociateAction.DELETE)
    val parent: Comment?


    @OneToMany(mappedBy = "parent")
    val childComment: List<Comment>
}
