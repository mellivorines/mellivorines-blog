package io.github.mellivorines.blog.model.entity

import org.babyfish.jimmer.sql.*
import java.time.LocalDateTime


/**
 * <p>
 *  定时任务调度日志表

 * </p>
 *
 * @author lilinxi
 * @date 2023-08-17
 */
@Entity
@Table(name = "mellivorines_blog_job_log")
interface JobLog {

    /**
     *  任务日志ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Int

    /**
     *  任务ID
     */
    @Column(name = "job_id")
    val jobId: Int

    /**
     *  任务名称
     */
    @Column(name = "job_name")
    val jobName: String

    /**
     *  任务组名
     */
    @Column(name = "job_group")
    val jobGroup: String

    /**
     *  调用目标字符串
     */
    @Column(name = "invoke_target")
    val invokeTarget: String

    /**
     *  日志信息
     */
    @Column(name = "job_message")
    val jobMessage: String?

    /**
     *  执行状态（0正常 1失败）
     */
    val status: Int?

    /**
     *  异常信息
     */
    @Column(name = "exception_info")
    val exceptionInfo: String?

    /**
     *  创建时间
     */
    @Column(name = "create_time")
    val createTime: LocalDateTime?

    /**
     *  开始时间
     */
    @Column(name = "start_time")
    val startTime: LocalDateTime?

    /**
     *  结束时间
     */
    @Column(name = "end_time")
    val endTime: LocalDateTime?

}
