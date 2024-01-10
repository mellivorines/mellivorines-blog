package io.github.mellivorines.blog.web

import io.github.mellivorines.blog.constant.FilePathEnum
import io.github.mellivorines.blog.model.ResultVO
import io.github.mellivorines.blog.model.entity.dto.TalkAdminView
import io.github.mellivorines.blog.model.entity.dto.TalkInputForSave
import io.github.mellivorines.blog.model.entity.dto.TalkInputForUpdate
import io.github.mellivorines.blog.model.entity.dto.TalkView
import io.github.mellivorines.blog.service.TalkService
import io.github.mellivorines.salamanderblog.out.ConditionVO
import io.swagger.v3.oas.annotations.Operation
import io.swagger.v3.oas.annotations.tags.Tag
import org.dromara.x.file.storage.core.FileStorageService
import org.springframework.data.domain.Page
import org.springframework.web.bind.annotation.*
import org.springframework.web.multipart.MultipartFile


/**
 * @Description:说说模块
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/9/9
 */
@Tag(name = "说说模块")
@RestController
@RequestMapping("/api")
class TalkController(
    private val talkService: TalkService,
    private val fileStorageService: FileStorageService
) {
    @Operation(summary = "查看说说列表")
    @GetMapping("/talks")
    fun listTalks(): ResultVO<List<TalkView>> {
        return ResultVO.success(talkService.listTalks())
    }

    @Operation(summary = "根据id查看说说")
    @GetMapping("/talks/{talkId}")
    fun getTalkById(@PathVariable("talkId") talkId: Int): ResultVO<TalkView?> {
        return ResultVO.success(talkService.getTalkById(talkId))
    }

    @Operation(summary = "上传说说图片")
    @PostMapping("/admin/talks/images")
    fun saveTalkImages(file: MultipartFile): ResultVO<String> {
        return ResultVO.success(fileStorageService.of(file).setPath(FilePathEnum.TALK.path).upload().url)
    }

    @Operation(summary = "修改说说")
    @PostMapping("/admin/talks/update")
    fun updateTalk(@RequestBody talkInput: TalkInputForUpdate): ResultVO<Any> {
        return ResultVO.success(talkService.updateTalk(talkInput))
    }

    @Operation(summary = "保存说说")
    @PostMapping("/admin/talks/save")
    fun saveTalk(@RequestBody talkInput: TalkInputForSave): ResultVO<Any> {
        return ResultVO.success(talkService.saveTalk(talkInput))
    }

    @Operation(summary = "删除说说")
    @DeleteMapping("/admin/talks")
    fun deleteTalks(@RequestBody talkIds: List<Int>): ResultVO<Any> {
        return ResultVO.success(talkService.deleteTalks(talkIds))
    }

    @Operation(summary = "查看后台说说")
    @GetMapping("/admin/talks")
    fun listBackTalks(conditionVO: ConditionVO): ResultVO<Page<TalkAdminView>> {
        return ResultVO.success(talkService.listBackTalks(conditionVO))
    }

    @Operation(summary = "根据id查看后台说说")
    @GetMapping("/admin/talks/{talkId}")
    fun getBackTalkById(@PathVariable("talkId") talkId: Int): ResultVO<TalkAdminView> {
        return ResultVO.success(talkService.getBackTalkById(talkId))
    }

}