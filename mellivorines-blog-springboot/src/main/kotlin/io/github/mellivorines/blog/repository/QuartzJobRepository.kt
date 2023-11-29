package io.github.mellivorines.blog.repository

import io.github.mellivorines.blog.model.entity.QuartzJob
import io.github.mellivorines.blog.model.entity.fetchBy
import io.github.mellivorines.blog.model.entity.state
import org.babyfish.jimmer.spring.repository.KRepository
import org.babyfish.jimmer.sql.kt.ast.expression.valueIn
import org.springframework.stereotype.Repository

/**
 * <p>
 * QuartzJobRepository 接口
 * </p>
 *
 * @author lilinxi
 * @date 2023-08-26
 */
@Repository
interface QuartzJobRepository : KRepository<QuartzJob, Int> {
    fun findAllByState(listOf: List<Int>): List<QuartzJob> = sql.createQuery(QuartzJob::class) {
        where(table.state valueIn listOf)
        select(table.fetchBy { allScalarFields() })
    }.execute()


}

