package io.github.mellivorines.blog.model.entity

import org.babyfish.jimmer.sql.*
import java.time.LocalDateTime


/**
 * <p>
 * 用户-登陆

 * </p>
 *
 * @author lilinxi
 * @date 2023-08-17
 */
@Entity

@Table(name = "mellivorines_blog_user_auth")
interface UserAuth : BaseEntity {

    /**
     *  id
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Int


    /**
     *  用户名
     */
    @Key
    val username: String

    /**
     *  密码
     */
    val password: String

    /**
     *  登录类型
     */
    @Column(name = "login_type")
    val loginType: Int

    /**
     *  用户登录ip
     */
    @Column(name = "ip_address")
    val ipAddress: String?

    /**
     *  ip来源
     */
    @Column(name = "ip_source")
    val ipSource: String?


    /**
     *  上次登录时间
     */
    @Column(name = "last_login_time")
    val lastLoginTime: LocalDateTime?

    @ManyToOne
    @JoinColumn(name = "user_info_id")
    val userInfo: UserInfo

    @IdView()
    val userInfoId: Int

    @ManyToMany
    @JoinTable(
        name = "mellivorines_blog_user_role",
        joinColumnName = "user_id",
        inverseJoinColumnName = "role_id"
    )
    val roles: List<Role>

}
