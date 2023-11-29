package io.github.mellivorines.blog.repository

import io.github.mellivorines.blog.model.entity.Role
import io.github.mellivorines.blog.model.entity.fetchBy
import io.github.mellivorines.blog.model.entity.id
import io.github.mellivorines.blog.model.entity.roleName
import io.github.mellivorines.salamanderblog.out.ConditionVO
import org.babyfish.jimmer.spring.repository.KRepository
import org.babyfish.jimmer.spring.repository.fetchPage
import org.springframework.data.domain.Page
import org.springframework.stereotype.Repository

/**
 * <p>
 * RoleRepository 接口
 * </p>
 *
 * @author lilinxi
 * @date 2023-08-17
 */
@Repository
interface RoleRepository : KRepository<Role, Int> {
    fun listUserRoles(): List<Role> = sql.createQuery(Role::class) {
        select(table.fetchBy {
            table.id
            table.roleName
        })
    }.execute()

     fun listRoles(conditionVO: ConditionVO): Page<Role> = sql.createQuery(Role::class){
         select(table.fetchBy {
             allScalarFields()
             resources {
                 allScalarFields()
             }
             menus { allScalarFields() }
         })
     }.fetchPage(pageIndex = conditionVO.current, pageSize = conditionVO.size)

    fun findByRoleName(roleName: String):Role?

}

