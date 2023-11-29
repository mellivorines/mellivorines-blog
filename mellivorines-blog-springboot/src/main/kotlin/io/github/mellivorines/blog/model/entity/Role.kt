package io.github.mellivorines.blog.model.entity

import org.babyfish.jimmer.sql.*


/**
 * <p>
 *  表角色

 * </p>
 *
 * @author lilinxi
 * @date 2023-08-17
 */
@Entity
@Table(name = "mellivorines_blog_role")
interface Role : BaseEntity {

    /**
     *  主键id
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Int

    /**
     *  角色名
     */
    @Column(name = "role_name")
    val roleName: String

    /**
     *  是否禁用  0否 1是
     */
    @Column(name = "is_disable")
    val isDisable: Int

    @ManyToMany
    @JoinTable(
        name = "mellivorines_blog_role_menu",
        joinColumnName = "role_id",
        inverseJoinColumnName = "menu_id"
    )
    val menus: List<Menu>

    @ManyToMany
    @JoinTable(
        name = "mellivorines_blog_role_resource",
        joinColumnName = "role_id",
        inverseJoinColumnName = "resource_id"
    )
    val resources: List<Resource>

}
