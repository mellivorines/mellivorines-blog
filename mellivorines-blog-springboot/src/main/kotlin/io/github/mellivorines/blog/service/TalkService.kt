package io.github.mellivorines.blog.service

import io.github.mellivorines.blog.model.entity.Talk
import io.github.mellivorines.blog.model.entity.dto.TalkAdminView
import io.github.mellivorines.blog.model.entity.dto.TalkInputForSave
import io.github.mellivorines.blog.model.entity.dto.TalkInputForUpdate
import io.github.mellivorines.blog.model.entity.dto.TalkView
import io.github.mellivorines.blog.model.entity.id
import io.github.mellivorines.blog.model.entity.status
import io.github.mellivorines.blog.repository.CommentRepository
import io.github.mellivorines.blog.repository.TalkRepository
import io.github.mellivorines.salamanderblog.out.ConditionVO
import org.babyfish.jimmer.spring.repository.fetchPage
import org.babyfish.jimmer.sql.kt.ast.expression.eq
import org.springframework.data.domain.Page
import org.springframework.stereotype.Service


/**
 * @Description:
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/9/9
 */
@Service
class TalkService(
    private val talkRepository: TalkRepository,
    private val commentRepository: CommentRepository
) {
    fun listTalks(): List<TalkView>? {
        return talkRepository.sql.createQuery(Talk::class) {
            select(table.fetch(TalkView::class))
        }.execute()
    }

    fun getTalkById(talkId: Int): TalkView? {
        return talkRepository.sql.createQuery(Talk::class) {
            where(table.id eq talkId)
            select(table.fetch(TalkView::class))
        }.fetchOneOrNull()
    }

    fun deleteTalks(talkIds: List<Int>): Any {
        talkRepository.deleteByIds(talkIds)
        return true
    }

    fun listBackTalks(conditionVO: ConditionVO): Page<TalkAdminView>? {
        return talkRepository.sql.createQuery(Talk::class) {
            conditionVO.status?.let {
                where(table.status eq conditionVO.status)
            }
            select(table.fetch(TalkAdminView::class))
        }.fetchPage(pageSize = conditionVO.size, pageIndex = conditionVO.current)
    }

    fun getBackTalkById(talkId: Int): TalkAdminView? {
        return talkRepository.sql.createQuery(Talk::class) {
            where(table.id eq talkId)
            select(table.fetch(TalkAdminView::class))
        }.fetchOneOrNull()
    }

    fun saveTalk(talkInput: TalkInputForSave): Any {
        return talkRepository.save(talkInput)
    }

    fun updateTalk(talkInput: TalkInputForUpdate): Any? {
        return talkRepository.update(talkInput)
    }

}