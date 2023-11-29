package io.github.mellivorines.blog.model.entity

import org.babyfish.jimmer.sql.*
import java.time.LocalDateTime


/**
 * <p>
 *  任务列表

 * </p>
 *
 * @author lilinxi
 * @date 2023-08-26
 */
@Entity
@Table(name = "quartz_job")
interface QuartzJob {

    companion object {
        /**
         * 任务调度参数key
         */
        val JOB_PARAM_KEY = "BOOT_JOB_PARAM_KEY"

    }

    /**
     *  任务id
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Int

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
     *  cron表达式
     */
    @Column(name = "cron_expres")
    val cronExpres: String?

    /**
     *  任务状态：1正常，2暂停，3删除
     */
    val state: Int?

    /**
     *  备注
     */
    val remark: String?

    /**
     *  创建时间
     */
    @Column(name = "create_time")
    val createTime: LocalDateTime?

}
