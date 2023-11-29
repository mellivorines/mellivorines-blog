package io.github.mellivorines.blog.model.entity

import io.swagger.v3.oas.annotations.media.Schema
import org.babyfish.jimmer.sql.*


/**
 * <p>
 * 访问量

 * </p>
 *
 * @author lilinxi
 * @date 2023-08-17
 */
@Entity
@Table(name = "mellivorines_blog_unique_view")
@Schema(description = "访问量", title = "访问量")
interface UniqueView : BaseEntity {

    /**
     *  id
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @get:Schema(description = " id")
    val id: Int

    /**
     *  访问量
     */
    @Column(name = "views_count")
    @get:Schema(description = " 访问量 ")
    val viewsCount: Int
}
