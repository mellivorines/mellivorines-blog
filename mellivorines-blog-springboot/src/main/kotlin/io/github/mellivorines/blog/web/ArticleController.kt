package io.github.mellivorines.blog.web

import io.github.mellivorines.blog.model.ResultVO
import io.github.mellivorines.blog.model.dto.TopAndFeatured
import io.github.mellivorines.blog.model.entity.*
import io.github.mellivorines.blog.model.entity.dto.ArticleInput
import io.github.mellivorines.blog.model.vo.ArchivesVO
import io.github.mellivorines.blog.repository.ArticleRepository
import io.github.mellivorines.salamanderblog.out.ConditionVO
import io.swagger.v3.oas.annotations.tags.Tag
import org.babyfish.jimmer.spring.repository.fetchPage
import org.babyfish.jimmer.sql.kt.ast.expression.eq
import org.springframework.data.domain.Page
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController
import java.time.format.DateTimeFormatter


/**
 * @Description:文章模块
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/10/21
 */
@Tag(name = "文章模块")
@RestController
@RequestMapping("/api")
class ArticleController(
    private val articleRepository: ArticleRepository
) {
    @GetMapping("/articles/topAndFeatured")
    fun topAndFeatured(): ResultVO<TopAndFeatured> {

        val top = articleRepository.sql.createQuery(Article::class) {
            where(table.isTop eq 1)
            select(table.fetch(ArticleInput::class))
        }.execute()[0]

        val featured = articleRepository.sql.createQuery(Article::class) {
            where(table.isFeatured eq 1)
            select(table.fetch(ArticleInput::class))
        }.execute()

        return ResultVO.success(TopAndFeatured(featured, top))
    }

    @GetMapping("/articles/all")
    fun all(conditionVO: ConditionVO): ResultVO<Page<ArticleInput>> {

        val all = articleRepository.sql.createQuery(Article::class) {
            select(table.fetch(ArticleInput::class))
        }.fetchPage(pageSize = conditionVO.size, pageIndex = conditionVO.current - 1)


        return ResultVO.success(all)
    }

    @GetMapping("/articles/categoryId")
    fun categoryId(conditionVO: ConditionVO): ResultVO<Page<ArticleInput>> {
        val all = articleRepository.sql.createQuery(Article::class) {
            conditionVO.categoryId?.let {
                where(table.categoryId eq it)
            }
            select(table.fetch(ArticleInput::class))
        }.fetchPage(pageSize = conditionVO.size, pageIndex = conditionVO.current - 1)


        return ResultVO.success(all)
    }

    @GetMapping("/articles/{articleId}")
    fun articlesById(@PathVariable articleId: Int): ResultVO<ArticleInput> {
        val all = articleRepository.sql.createQuery(Article::class) {
            where(table.id eq articleId)
            select(table.fetch(ArticleInput::class))
        }.execute()[0]
        return ResultVO.success(all)
    }

    @GetMapping("/articles/tagId")
    fun articlesByTagId(conditionVO: ConditionVO): ResultVO<Page<ArticleInput>> {
        val articlesByTagId = articleRepository.sql.createQuery(Article::class) {
            conditionVO.tagId?.let {
                where(table.asTableEx().myTags.id eq it)
            }
            select(table.fetch(ArticleInput::class))
        }.fetchPage(pageSize = conditionVO.size, pageIndex = conditionVO.current - 1)

        return ResultVO.success(articlesByTagId)
    }


    @GetMapping("/archives/all")
    fun archivesAll(conditionVO: ConditionVO): ResultVO<List<ArchivesVO>> {
        val archivesAll = articleRepository.sql.createQuery(Article::class) {
            orderBy(table.createTime)
            select(table.fetch(ArticleInput::class))
        }.fetchPage(pageSize = conditionVO.size, pageIndex = conditionVO.current - 1)

        val groupBy = archivesAll.toList().groupBy { it.createTime.format(DateTimeFormatter.ofPattern("yyyy-MM")) }
        val list = ArrayList<ArchivesVO>()
        groupBy.forEach { list.add(ArchivesVO(it.key, it.value)) }
        return ResultVO.success(list)
    }

}