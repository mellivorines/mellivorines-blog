package io.github.mellivorines.blog.service

import io.github.mellivorines.blog.exception.BizException
import io.github.mellivorines.blog.model.entity.Role
import io.github.mellivorines.blog.model.entity.addBy
import io.github.mellivorines.blog.model.entity.by
import io.github.mellivorines.blog.model.vo.RoleVO
import io.github.mellivorines.salamanderblog.out.ConditionVO
import io.github.mellivorines.blog.repository.RoleRepository
import org.babyfish.jimmer.kt.new
import org.springframework.data.domain.Page
import org.springframework.stereotype.Service

@Service
class RoleService(
        private val roleRepository: RoleRepository
) {
    fun listUserRoles(): List<Role>? = roleRepository.listUserRoles()

    fun listRoles(conditionVO: ConditionVO): Page<Role> = roleRepository.listRoles(conditionVO)

    fun saveOrUpdateRole(roleVO: RoleVO): Any? {
        val findByRoleName = roleRepository.findByRoleName(roleVO.roleName)
        if (findByRoleName != null) {
            if (findByRoleName.id == roleVO.id) {
                throw BizException("该角色存在")
            }
        }
        val role = new(Role::class).by {
            id = roleVO.id
            roleName = roleVO.roleName
            roleVO.menuIds.forEach {
                menus().addBy {
                    id = it
                }
            }
            roleVO.resourceIds.forEach {
                resources().addBy {
                    id = it
                }
            }
        }
        return roleRepository.sql.save(role).totalAffectedRowCount > 0
    }

    fun deleteRoles(roleIdList: List<Int>): Any = roleRepository.deleteAllById(roleIdList)

}
