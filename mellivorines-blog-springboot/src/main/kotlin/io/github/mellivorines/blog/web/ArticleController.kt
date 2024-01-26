package io.github.mellivorines.blog.web

//import io.github.mellivorines.blog.config.elasticsearch.ElasticsearchMapper
import io.github.mellivorines.blog.model.ResultVO
import io.github.mellivorines.blog.model.dto.ArticleOutput
import io.github.mellivorines.blog.model.dto.TopAndFeatured
import io.github.mellivorines.blog.model.entity.*
import io.github.mellivorines.blog.model.entity.dto.ArticleInput
import io.github.mellivorines.blog.model.vo.ArchivesVO
import io.github.mellivorines.blog.repository.ArticleRepository
import io.github.mellivorines.salamanderblog.out.ConditionVO
import io.swagger.v3.oas.annotations.tags.Tag
import org.babyfish.jimmer.spring.repository.fetchPage
import org.babyfish.jimmer.sql.kt.ast.expression.eq
import org.babyfish.jimmer.sql.kt.ast.expression.ilike
import org.babyfish.jimmer.sql.kt.ast.expression.or
import org.springframework.data.domain.Page
import org.springframework.web.bind.annotation.*
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
    private val articleRepository: ArticleRepository,
    private val esMapper: ElasticsearchMapper
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
                where(table.asTableEx().categories.id eq it)
            }
            select(table.fetch(ArticleInput::class))
        }.fetchPage(pageSize = conditionVO.size, pageIndex = conditionVO.current - 1)


        return ResultVO.success(all)
    }

    @GetMapping("/articles/{articleId}")
    fun articlesById(@PathVariable articleId: Int): ResultVO<ArticleOutput> {
        val all = articleRepository.sql.createQuery(Article::class) {
            orderBy(table.id)
            select(table.fetch(ArticleInput::class))
        }.execute()
        val article = all.find { it.id == articleId }

        val indexOf = all.indexOf(article)
        var preArticleCard: ArticleInput? = null
        var nextArticleCard: ArticleInput? = null
        if (indexOf - 1 >= 0) {
            preArticleCard = all[indexOf - 1]
        }
        if (indexOf + 1 <= all.size - 1) {
            nextArticleCard = all[indexOf + 1]
        }
        return ResultVO.success(article?.let { ArticleOutput(it, preArticleCard, nextArticleCard) })
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

    @GetMapping("/articles/search")
    fun listArticlesBySearch(@RequestParam(value = "keywords") keywords: String): ResultVO<List<ArticleInput>> {
        val execute = articleRepository.sql.createQuery(Article::class) {
            where(
                or(
                    table.articleTitle ilike keywords,
                    table.articleContent ilike keywords
                )
            )
            select(table.fetch(ArticleInput::class))
        }.execute()
        return ResultVO.success(execute)
    }

//    @GetMapping("/es/test")
//    fun test(): ResultVO<MutableIterable<ArticleSearchDTO>> {
//        val findAll = articleRepository.findAll()
//        val list = mutableListOf<ArticleSearchDTO>()
//        findAll.forEach {
//            list.add(ArticleSearchDTO(it.id, it.articleTitle, it.articleContent, it.isDelete, it.status))
//        }
//        esMapper.deleteAll()
//        return ResultVO.success(esMapper.saveAll(list))
//    }


}