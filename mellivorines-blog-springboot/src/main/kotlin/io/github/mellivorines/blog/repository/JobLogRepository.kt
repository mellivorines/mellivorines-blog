package io.github.mellivorines.blog.repository

import io.github.mellivorines.blog.model.entity.JobLog
import org.babyfish.jimmer.spring.repository.KRepository
import org.springframework.stereotype.Repository

/**
 * <p>
 * JobLogRepository 接口
 * </p>
 *
 * @author lilinxi
 * @date 2023-08-17
 */
@Repository
interface JobLogRepository : KRepository<JobLog, Int>

