package io.github.mellivorines.blog.model.entity

import org.babyfish.jimmer.sql.*


/**
 * <p>
 * 菜单

 * </p>
 *
 * @author lilinxi
 * @date 2023-08-17
 */
@Entity
@Table(name = "mellivorines_blog_menu")
interface Menu : BaseEntity {

    /**
     *  主键
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Int

    /**
     *  菜单名
     */
    val name: String

    /**
     *  菜单路径
     */
    val path: String

    /**
     *  组件
     */
    val component: String

    /**
     *  菜单icon
     */
    val icon: String

    /**
     *  排序
     */
    @Column(name = "order_num")
    val orderNum: Int

    /**
     *  是否隐藏  0否1是
     */
    @Column(name = "is_hidden")
    val isHidden: Int

    @Key
    @ManyToOne
    @OnDissociate(DissociateAction.DELETE)
    val parent: Menu?


    @OneToMany(mappedBy = "parent")
    val childMenu: List<Menu>

    @ManyToMany(mappedBy = "menus")
    val roles: List<Role>
}
