package io.github.mellivorines.blog.model.entity

import org.babyfish.jimmer.sql.*
import java.time.LocalDateTime


/**
 * <p>
 * 异常日志

 * </p>
 *
 * @author lilinxi
 * @date 2023-08-17
 */
@Entity
@Table(name = "mellivorines_blog_exception_log")
interface ExceptionLog {

    /**
     *  id
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Int

    /**
     *  请求接口
     */
    @Column(name = "opt_uri")
    val optUri: String

    /**
     *  请求方式
     */
    @Column(name = "opt_method")
    val optMethod: String

    /**
     *  请求方式
     */
    @Column(name = "request_method")
    val requestMethod: String?

    /**
     *  请求参数
     */
    @Column(name = "request_param")
    val requestParam: String?

    /**
     *  操作描述
     */
    @Column(name = "opt_desc")
    val optDesc: String?

    /**
     *  异常信息
     */
    @Column(name = "exception_info")
    val exceptionInfo: String?

    /**
     *  ip
     */
    @Column(name = "ip_address")
    val ipAddress: String?

    /**
     *  ip来源
     */
    @Column(name = "ip_source")
    val ipSource: String?

    /**
     *  操作时间
     */
    @Column(name = "create_time")
    val createTime: LocalDateTime

}
