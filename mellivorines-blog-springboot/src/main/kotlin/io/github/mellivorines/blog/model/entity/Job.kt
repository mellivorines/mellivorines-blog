package io.github.mellivorines.blog.model.entity

import org.babyfish.jimmer.sql.*
import java.time.LocalDateTime


/**
 * <p>
 *  定时任务调度表
 * </p>
 *
 * @author lilinxi
 * @date 2023-08-17
 */
@Entity
@Table(name = "mellivorines_blog_job")
interface Job {

    /**
     *  任务ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Int

    /**
     *  任务名称
     */
    @Key
    @Column(name = "job_name")
    val jobName: String

    /**
     *  任务组名
     */
    @Key
    @Column(name = "job_group")
    val jobGroup: String

    /**
     *  调用目标字符串
     */
    @Column(name = "invoke_target")
    val invokeTarget: String

    /**
     *  cron执行表达式
     */
    @Column(name = "cron_expression")
    val cronExpression: String?

    /**
     *  计划执行错误策略（1立即执行 2执行一次 3放弃执行）
     */
    @Column(name = "misfire_policy")
    val misfirePolicy: Int?

    /**
     *  是否并发执行（0禁止 1允许）
     */
    val concurrent: Int?

    /**
     *  状态（0暂停 1正常）
     */
    val status: Int?

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

    /**
     *  备注信息
     */
    val remark: String?

}
