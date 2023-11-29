package io.github.mellivorines.blog.model.entity

import org.babyfish.jimmer.sql.*


/**
 * <p>
 * 站点配置

 * </p>
 *
 * @author lilinxi
 * @date 2023-08-17
 */
@Entity
@Table(name = "mellivorines_blog_website_config")
interface WebsiteConfig : BaseEntity {

    /**
     *  id
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Int

    /**
     *  配置信息
     */
    val config: String

}
