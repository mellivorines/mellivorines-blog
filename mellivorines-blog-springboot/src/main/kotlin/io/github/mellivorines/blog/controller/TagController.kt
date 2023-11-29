package io.github.mellivorines.blog.controller

import io.github.mellivorines.blog.service.TagService
import io.github.mellivorines.blog.model.ResultVO
import io.github.mellivorines.blog.model.entity.MyTag
import io.github.mellivorines.blog.model.entity.dto.MyTagInput
import io.github.mellivorines.salamanderblog.out.ConditionVO
import io.swagger.v3.oas.annotations.Operation
import io.swagger.v3.oas.annotations.tags.Tag
import org.springframework.data.domain.Page
import org.springframework.web.bind.annotation.*

@Tag(name = "标签模块")
@RestController
@RequestMapping("/api")
class TagController(private val tagService: TagService) {


    @Operation(summary = "获取所有标签")
    @GetMapping("/tags/all")
    fun getAllTags(): ResultVO<List<MyTag>> {
        return ResultVO.success(tagService.listTags())
    }

    @Operation(summary = "获取前十个标签")
    @GetMapping("/tags/topTen")
    fun getTopTenTags(): ResultVO<List<MyTag>> {
        return ResultVO.success(tagService.listTopTenTags())
    }

    @Operation(summary = "查询后台标签列表")
    @GetMapping("/admin/tags")
    fun listTagsAdmin(conditionVO: ConditionVO): ResultVO<Page<MyTag>> {
        return ResultVO.success(tagService.listTagsAdmin(conditionVO))
    }

    @Operation(summary = "搜索文章标签")
    @GetMapping("/admin/tags/search")
    fun listTagsAdminBySearch(condition: ConditionVO): ResultVO<List<MyTag>> {
        return ResultVO.success(tagService.listTagsAdminBySearch(condition))
    }

    @Operation(summary = "添加或修改标签")
    @PostMapping("/admin/tags")
    fun saveOrUpdateTag(@RequestBody tagVO: MyTagInput): ResultVO<Any> {

        return ResultVO.success(tagService.saveOrUpdateTag(tagVO))
    }

    @Operation(summary = "删除标签")
    @DeleteMapping("/admin/tags")
    fun deleteTag(@RequestBody tagIdList: List<Int>): ResultVO<Any> {

        return ResultVO.success(tagService.deleteTag(tagIdList))
    }
}
