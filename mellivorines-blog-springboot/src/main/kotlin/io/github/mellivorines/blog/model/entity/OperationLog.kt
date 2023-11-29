package io.github.mellivorines.blog.model.entity

import org.babyfish.jimmer.sql.*
import java.time.LocalDateTime


/**
 * <p>
 * 操作日志

 * </p>
 *
 * @author lilinxi
 * @date 2023-08-17
 */
@Entity
@Table(name = "mellivorines_blog_operation_log")
interface OperationLog {

    /**
     *  主键id
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Int

    /**
     *  操作模块
     */
    @Column(name = "opt_module")
    val optModule: String

    /**
     *  操作类型
     */
    @Column(name = "opt_type")
    val optType: String

    /**
     *  操作url
     */
    @Column(name = "opt_uri")
    val optUri: String

    /**
     *  操作方法
     */
    @Column(name = "opt_method")
    val optMethod: String

    /**
     *  操作描述
     */
    @Column(name = "opt_desc")
    val optDesc: String

    /**
     *  请求参数
     */
    @Column(name = "request_param")
    val requestParam: String

    /**
     *  请求方式
     */
    @Column(name = "request_method")
    val requestMethod: String

    /**
     *  返回数据
     */
    @Column(name = "response_data")
    val responseData: String

    /**
     *  用户id
     */
    @Column(name = "user_id")
    val userId: Int

    /**
     *  用户昵称
     */
    val nickname: String

    /**
     *  操作ip
     */
    @Column(name = "ip_address")
    val ipAddress: String

    /**
     *  操作地址
     */
    @Column(name = "ip_source")
    val ipSource: String

    /**
     *  创建时间
     */
    @Column(name = "create_time")
    val createTime: LocalDateTime

    /**
     *  更新时间
     */
    @Column(name = "update_time")
    val updateTime: LocalDateTime?

}
