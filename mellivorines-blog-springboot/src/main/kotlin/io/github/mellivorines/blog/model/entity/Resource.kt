package io.github.mellivorines.blog.model.entity

import org.babyfish.jimmer.sql.*


/**
 * <p>
 * 资源

 * </p>
 *
 * @author lilinxi
 * @date 2023-08-17
 */
@Entity
@Table(name = "mellivorines_blog_resource")
interface Resource : BaseEntity {

    /**
     *  主键
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Int

    /**
     *  资源名
     */
    @Column(name = "resource_name")
    val resourceName: String

    /**
     *  权限路径
     */
    val url: String?

    /**
     *  请求方式
     */
    @Column(name = "request_method")
    val requestMethod: String?


    /**
     *  是否匿名访问 0否 1是
     */
    @Column(name = "is_anonymous")
    val isAnonymous: Int


    @ManyToMany(mappedBy = "resources")
    val roles: List<Role>

    @Key
    @ManyToOne
    @OnDissociate(DissociateAction.DELETE)
    val parent: Resource?


    @OneToMany(mappedBy = "parent")
    val childResource: List<Resource>

}
