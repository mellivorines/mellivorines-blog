package io.github.mellivorines.blog.model.entity

import org.babyfish.jimmer.sql.*


/**
 * <p>
 * 关于

 * </p>
 *
 * @author lilinxi
 * @date 2023-08-17
 */
@Entity
@Table(name = "mellivorines_blog_about")
interface About : BaseEntity {

    /**
     *  id
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Int

    /**
     *  内容
     */
    val content: String?

}
