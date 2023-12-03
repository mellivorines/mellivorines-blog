package io.github.mellivorines.blog.web

import io.github.mellivorines.blog.model.ResultVO
import io.github.mellivorines.blog.model.entity.Comment
import io.github.mellivorines.blog.model.entity.createTime
import io.github.mellivorines.blog.model.entity.dto.CommentInput
import io.github.mellivorines.blog.model.entity.type
import io.github.mellivorines.blog.repository.CommentRepository
import io.github.mellivorines.salamanderblog.out.ConditionVO
import io.swagger.v3.oas.annotations.Operation
import io.swagger.v3.oas.annotations.tags.Tag
import org.babyfish.jimmer.spring.repository.fetchPage
import org.babyfish.jimmer.sql.kt.ast.expression.desc
import org.babyfish.jimmer.sql.kt.ast.expression.eq
import org.springframework.data.domain.Page
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController


/**
 * @Description:评论模块
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/9/9
 */

@Tag(name = "评论模块")
@RestController
@RequestMapping("/api")
class CommentController(
    private val commentRepository: CommentRepository
) {


    @Operation(summary = "分页获取评论")
    @GetMapping("/comments")
    fun listComments(conditionVO: ConditionVO): ResultVO<Page<CommentInput>> {
        val fetchPage = commentRepository.sql.createQuery(Comment::class) {
            conditionVO.type?.let { where(table.type eq it) }
            select(table.fetch(CommentInput::class))
        }.fetchPage(pageSize = conditionVO.size, pageIndex = conditionVO.current - 1)
        return ResultVO.success(fetchPage)
    }


    @Operation(summary = "分页获取评论")
    @GetMapping("/comments/topSix")
    fun topSixComments(): ResultVO<List<CommentInput>> {
        val list = commentRepository.sql.createQuery(Comment::class) {
            orderBy(table.createTime.desc())
            select(table.fetch(CommentInput::class))
        }.execute()
        return ResultVO.success(if (list.size > 6) list.subList(0, 6) else list)
    }
}