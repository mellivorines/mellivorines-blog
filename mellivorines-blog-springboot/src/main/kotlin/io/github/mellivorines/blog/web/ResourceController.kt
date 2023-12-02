package io.github.mellivorines.blog.web

import io.github.mellivorines.blog.model.ResultVO
import io.github.mellivorines.blog.model.entity.dto.ResourceAdminDTO
import io.github.mellivorines.blog.model.entity.dto.ResourceDTO
import io.github.mellivorines.blog.model.entity.dto.ResourceInputForSave
import io.github.mellivorines.blog.model.entity.dto.ResourceInputForUpdate
import io.github.mellivorines.blog.service.ResourceService
import io.github.mellivorines.salamanderblog.out.ConditionVO
import io.swagger.v3.oas.annotations.Operation
import io.swagger.v3.oas.annotations.tags.Tag
import org.springframework.data.domain.Page
import org.springframework.web.bind.annotation.*


/**
 * @Description:资源模块
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/9/9
 */
@Tag(name = "资源模块")
@RestController
@RequestMapping("/api")
class ResourceController(
    private val resourceService: ResourceService
) {

    @Operation(summary = "查看资源列表")
    @GetMapping("/admin/resources")
    fun listResources(conditionVO: ConditionVO): ResultVO<Page<ResourceDTO>> {
        return ResultVO.success(resourceService.listResources(conditionVO))
    }

    @Operation(summary = "删除资源")
    @DeleteMapping("/admin/resources/{resourceId}")
    fun deleteResource(@PathVariable("resourceId") resourceId: Int): ResultVO<Any> {
        return ResultVO.success(resourceService.deleteResource(resourceId))
    }

    @Operation(summary = "新增资源")
    @PostMapping("/admin/resources/save")
    fun saveResource(@RequestBody resourceInputForSave: ResourceInputForSave): ResultVO<Any> {
        return ResultVO.success(resourceService.saveResource(resourceInputForSave))
    }

    @Operation(summary = "修改资源")
    @PostMapping("/admin/resources/update")
    fun updateResource(@RequestBody resourceInputForUpdate: ResourceInputForUpdate): ResultVO<Any> {
        return ResultVO.success(resourceService.updateResource(resourceInputForUpdate))
    }

    @Operation(summary = "查看角色资源选项")
    @GetMapping("/admin/role/resources")
    fun listResourceOption(): ResultVO<List<ResourceAdminDTO>> {
        return ResultVO.success(resourceService.listResourceOption())
    }
}

