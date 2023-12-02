package io.github.mellivorines.blog.web

import io.github.mellivorines.blog.model.ResultVO
import io.github.mellivorines.blog.model.entity.FriendLink
import io.github.mellivorines.blog.model.entity.dto.FriendLinkInputForSave
import io.github.mellivorines.blog.model.entity.dto.FriendLinkInputForUpdate
import io.github.mellivorines.blog.model.entity.fetchBy
import io.github.mellivorines.blog.repository.FriendLinkRepository
import io.github.mellivorines.salamanderblog.out.ConditionVO
import io.swagger.v3.oas.annotations.Operation
import io.swagger.v3.oas.annotations.tags.Tag
import org.babyfish.jimmer.spring.repository.fetchPage
import org.springframework.data.domain.Page
import org.springframework.web.bind.annotation.*


/**
 * @Description:友链模块
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/9/9
 */

@Tag(name = "友链模块")
@RestController
@RequestMapping("/api")
class FriendLinkController(
    private val friendLinkRepository: FriendLinkRepository
) {

    @Operation(summary = "查看友链列表")
    @GetMapping("/links")
    fun listFriendLinks(): ResultVO<List<FriendLink>> {
        return ResultVO.success(friendLinkRepository.findAll())
    }

    @Operation(summary = "查看后台友链列表")
    @PostMapping("/admin/links")
    fun listFriendLinkDTO(@RequestBody conditionVO: ConditionVO): ResultVO<Page<FriendLink>> {
        return ResultVO.success(friendLinkRepository.sql.createQuery(FriendLink::class) {
            select(table.fetchBy { allScalarFields() })
        }.fetchPage(pageSize = conditionVO.size, pageIndex = conditionVO.current))
    }

    @Operation(summary = "保存友链")
    @PostMapping("/admin/links/save")
    fun saveFriendLink(@RequestBody friendLinkVO: FriendLinkInputForSave): ResultVO<Any> {
        return ResultVO.success(friendLinkRepository.save(friendLinkVO))
    }


    @Operation(summary = "修改友链")
    @PutMapping("/admin/links/update")
    fun updateFriendLink(@RequestBody friendLinkVO: FriendLinkInputForUpdate): ResultVO<Any> {
        return ResultVO.success(friendLinkRepository.update(friendLinkVO))
    }

    @Operation(summary = "删除友链")
    @DeleteMapping("/admin/links")
    fun deleteFriendLink(@RequestBody linkIdList: List<Int>): ResultVO<Any> {
        return ResultVO.success(friendLinkRepository.deleteByIds(linkIdList))
    }
}