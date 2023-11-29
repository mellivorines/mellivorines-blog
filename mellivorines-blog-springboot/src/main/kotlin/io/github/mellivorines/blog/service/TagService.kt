package io.github.mellivorines.blog.service

import io.github.mellivorines.blog.model.entity.MyTag
import io.github.mellivorines.blog.model.entity.dto.MyTagInput
import io.github.mellivorines.blog.model.entity.fetchBy
import io.github.mellivorines.blog.model.entity.id
import io.github.mellivorines.blog.model.entity.tagName
import io.github.mellivorines.salamanderblog.out.ConditionVO
import io.github.mellivorines.blog.repository.TagRepository
import org.babyfish.jimmer.spring.repository.fetchPage
import org.babyfish.jimmer.sql.kt.ast.expression.desc
import org.babyfish.jimmer.sql.kt.ast.expression.ilike
import org.springframework.data.domain.Page
import org.springframework.stereotype.Service


@Service
class TagService(
        private val tagRepository: TagRepository
) {
    fun listTags(): List<MyTag>? = tagRepository.findAll()

    fun listTopTenTags(): List<MyTag>? {
        val listTags = listTags()
        return if (listTags != null && listTags.size > 10) {
            listTags.subList(0, 9)
        } else {
            listTags
        }
    }

    fun listTagsAdmin(conditionVO: ConditionVO): Page<MyTag>? {
        return if (conditionVO.keywords != null) {
            tagRepository.sql.createQuery(MyTag::class) {
                where(table.tagName ilike conditionVO.keywords)
                select(table.fetchBy {
                    allScalarFields()
                    articles {
                        allScalarFields()
                    }
                })
            }.fetchPage(pageIndex = conditionVO.current, pageSize = conditionVO.size)
        } else Page.empty()
    }

    fun listTagsAdminBySearch(conditionVO: ConditionVO): List<MyTag>? {
        return if (conditionVO.keywords != null) {
            tagRepository.sql.createQuery(MyTag::class) {
                where(table.tagName ilike conditionVO.keywords)
                orderBy(table.id.desc())
                select(table.fetchBy {
                    allScalarFields()
                    articles {
                        allScalarFields()
                    }
                })
            }.execute()
        } else listOf()
    }

    fun saveOrUpdateTag(tagVO: MyTagInput): Any = tagRepository.save(tagVO)

    fun deleteTag(tagIds: List<Int>): Any = tagRepository.deleteAllById(tagIds)
}
