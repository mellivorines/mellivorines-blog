package io.github.mellivorines.blog.repository

import io.github.mellivorines.blog.model.entity.*
import io.github.mellivorines.blog.model.entity.dto.UserAuthAdmin
import io.github.mellivorines.salamanderblog.out.ConditionVO
import org.babyfish.jimmer.spring.repository.KRepository
import org.babyfish.jimmer.spring.repository.fetchPage
import org.babyfish.jimmer.sql.kt.ast.expression.eq
import org.babyfish.jimmer.sql.kt.ast.expression.ilike
import org.babyfish.jimmer.sql.kt.ast.expression.or
import org.springframework.data.domain.Page
import org.springframework.stereotype.Repository

/**
 * <p>
 * UserAuthRepository 接口
 * </p>
 *
 * @author lilinxi
 * @date 2023-08-17
 */
@Repository
interface UserAuthRepository : KRepository<UserAuth, Int> {
    fun findByUsernameOrEmail(text: String): UserAuth? = sql.createQuery(UserAuth::class) {
        where(table.username eq text)
        or(table.userInfo.email eq text)
        select(table.fetchBy {
            allScalarFields()
            userInfo {
                allScalarFields()
            }
            roles { allScalarFields() }
        })
    }.fetchOneOrNull()


    fun listAdminUser(conditionVo: ConditionVO): Page<UserAuthAdmin> =
        sql.createQuery(UserAuth::class) {
            conditionVo.loginType?.let {
                where(table.loginType eq conditionVo.loginType)
            }
            conditionVo.keywords?.let {
                where(table.userInfo.nickname ilike conditionVo.keywords)
            }
            select(table.fetch(UserAuthAdmin::class))
        }.fetchPage(pageIndex = conditionVo.current, pageSize = conditionVo.size)

}

