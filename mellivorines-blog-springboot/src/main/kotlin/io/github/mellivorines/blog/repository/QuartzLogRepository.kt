package io.github.mellivorines.blog.repository

import io.github.mellivorines.blog.model.entity.QuartzLog
import org.babyfish.jimmer.spring.repository.KRepository
import org.springframework.stereotype.Repository

/**
 * <p>
 * QuartzLogRepository 接口
 * </p>
 *
 * @author lilinxi
 * @date 2023-08-26
 */
@Repository
interface QuartzLogRepository : KRepository<QuartzLog, Long>

