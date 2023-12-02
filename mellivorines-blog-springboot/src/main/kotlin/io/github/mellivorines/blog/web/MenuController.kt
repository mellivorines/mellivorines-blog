package io.github.mellivorines.blog.web

import io.github.mellivorines.blog.model.ResultVO
import io.github.mellivorines.blog.model.entity.dto.*
import io.github.mellivorines.blog.service.MenuService
import io.github.mellivorines.salamanderblog.out.ConditionVO
import io.swagger.v3.oas.annotations.Operation
import io.swagger.v3.oas.annotations.tags.Tag
import org.springframework.web.bind.annotation.*


/**
 * @Description:菜单模块
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/9/9
 */
@Tag(name = "菜单模块")
@RestController
@RequestMapping("/api")
class MenuController(
    private val menuService: MenuService
) {
    @Operation(summary = "查看菜单列表")
    @GetMapping("/admin/menus")
    fun listMenus(conditionVO: ConditionVO): ResultVO<List<MenuDTO>> {
        return ResultVO.success(menuService.listMenus(conditionVO))
    }

    @Operation(summary = "新增菜单")
    @PostMapping("/admin/menus/save")
    fun saveMenu(@RequestBody menuInputForSave: MenuInputForSave): ResultVO<Any> {
        return ResultVO.success(menuService.saveMenu(menuInputForSave))
    }

    @Operation(summary = "修改菜单")
    @PostMapping("/admin/menus/update")
    fun updateMenu(@RequestBody menuInputForUpdate: MenuInputForUpdate): ResultVO<Any> {
        return ResultVO.success(menuService.updateMenu(menuInputForUpdate))
    }

    @Operation(summary = "修改目录是否隐藏")
    @PutMapping("/admin/menus/isHidden")
    fun updateMenuIsHidden(@RequestBody isHiddenInput: MenuIsHiddenInput): ResultVO<Any> {
        return ResultVO.success(menuService.updateMenuIsHidden(isHiddenInput))
    }

    @Operation(summary = "删除菜单")
    @DeleteMapping("/admin/menus/{menuId}")
    fun deleteMenu(@PathVariable("menuId") menuId: Int): ResultVO<Any> {
        return ResultVO.success(menuService.deleteMenu(menuId))
    }

    @Operation(summary = "查看角色菜单选项")
    @GetMapping("/admin/role/menus")
    fun listMenuOptions(): ResultVO<List<MenuAdminDTO>> {
        return ResultVO.success(menuService.listMenuOptions())
    }

    @Operation(summary = "查看当前用户菜单")
    @GetMapping("/admin/user/menus")
    fun listUserMenus(): ResultVO<List<UserMenuDTO>> {
        return ResultVO.success(menuService.listUserMenus())
    }
}
