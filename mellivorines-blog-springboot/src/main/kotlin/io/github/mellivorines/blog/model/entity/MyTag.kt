package io.github.mellivorines.blog.model.entity

import io.swagger.v3.oas.annotations.media.Schema
import org.babyfish.jimmer.sql.*


/**
 * <p>
 * 标签

 * </p>
 *
 * @author lilinxi
 * @date 2023-08-17
 */
@Entity
@Table(name = "mellivorines_blog_tag")
@Schema(description = "标签", title = "标签")
interface MyTag : BaseEntity {

    /**
     *  id
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @get:Schema(description = " id")
    val id: Int

    /**
     *  标签名
     */
    @Column(name = "tag_name")
    @get:Schema(description = " 标签名 ")
    val tagName: String


    @ManyToMany(mappedBy = "myTags")
    val articles: List<Article>


}
