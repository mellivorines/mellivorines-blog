package io.github.mellivorines.blog.web

import io.github.mellivorines.blog.model.ResultVO
import io.github.mellivorines.blog.model.entity.Role
import io.github.mellivorines.blog.model.vo.RoleVO
import io.github.mellivorines.blog.service.RoleService
import io.github.mellivorines.salamanderblog.out.ConditionVO
import io.swagger.v3.oas.annotations.Operation
import io.swagger.v3.oas.annotations.tags.Tag
import org.springframework.data.domain.Page
import org.springframework.web.bind.annotation.*


/**
 * @Description:角色模块
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/9/9
 */
@Tag(name = "角色模块")
@RestController
@RequestMapping("/api/auth/")
class RoleController(private val roleService: RoleService) {
    @Operation(summary = "查询用户角色选项")
    @GetMapping("/admin/users/role")
    fun listUserRoles(): ResultVO<List<Role>?> {
        return ResultVO.success(roleService.listUserRoles())
    }

    @Operation(summary = "查询角色列表")
    @GetMapping("/admin/roles")
    fun listRoles(conditionVO: ConditionVO): ResultVO<Page<Role>> {
        return ResultVO.success(roleService.listRoles(conditionVO))
    }

    @Operation(summary = "保存或更新角色")
    @PostMapping("/admin/role")
    fun saveOrUpdateRole(@RequestBody roleVO: RoleVO): ResultVO<Any> {
        return ResultVO.success(roleService.saveOrUpdateRole(roleVO))
    }

    @Operation(summary = "删除角色")
    @DeleteMapping("/admin/roles")
    fun deleteRoles(@RequestBody roleIdList: List<Int>): ResultVO<Any> {
        return ResultVO.success(roleService.deleteRoles(roleIdList))
    }

}
