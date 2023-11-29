package io.github.mellivorines.blog.model.entity

import org.babyfish.jimmer.sql.*
import java.time.LocalDateTime


/**
 * <p>
 *  任务日志

 * </p>
 *
 * @author lilinxi
 * @date 2023-08-26
 */
@Entity
@Table(name = "quartz_log")
interface QuartzLog {

    /**
     *  任务日志id
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Long

    /**
     *  任务id
     */
    @Column(name = "job_id")
    val jobId: Int

    /**
     *  SpringBean名称
     */
    @Column(name = "bean_name")
    val beanName: String?

    /**
     *  执行参数
     */
    val params: String?

    /**
     *  任务状态：1成功，2失败
     */
    val state: Int

    /**
     *  失败信息
     */
    val error: String?

    /**
     *  耗时(单位：毫秒)
     */
    val times: Int

    /**
     *  创建时间
     */
    @Column(name = "create_time")
    val createTime: LocalDateTime?

}
