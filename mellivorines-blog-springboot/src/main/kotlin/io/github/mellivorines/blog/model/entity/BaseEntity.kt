package io.github.mellivorines.blog.model.entity

import com.fasterxml.jackson.annotation.JsonFormat
import org.babyfish.jimmer.sql.Column
import org.babyfish.jimmer.sql.MappedSuperclass
import java.time.LocalDateTime


/**
 * @Description:
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/9/2
 */
@MappedSuperclass
interface BaseEntity {


    /**
     *  创建时间
     */
    @Column(name = "create_time")
    @get:JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    val createTime: LocalDateTime


    /**
     *  更新时间
     */
    @Column(name = "update_time")
    @get:JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    val updateTime: LocalDateTime?
}