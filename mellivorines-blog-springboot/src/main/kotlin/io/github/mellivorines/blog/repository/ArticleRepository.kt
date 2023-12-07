package io.github.mellivorines.blog.repository

import io.github.mellivorines.blog.model.entity.Article
import io.github.mellivorines.blog.model.entity.*
import io.github.mellivorines.blog.model.entity.dto.ArticleInput
import org.babyfish.jimmer.spring.repository.KRepository
import org.babyfish.jimmer.spring.repository.fetchPage
import org.babyfish.jimmer.spring.repository.orderBy
import org.babyfish.jimmer.sql.kt.ast.expression.eq
import org.springframework.data.domain.Page
import org.springframework.data.domain.PageRequest
import org.springframework.stereotype.Repository

/**
 * <p>
 * ArticleRepository 接口
 * </p>
 *
 * @author lilinxi
 * @date 2023-08-17
 */
@Repository
interface ArticleRepository : KRepository<Article, Int> {
    fun list(): List<Article> = sql.createQuery(Article::class) {
        select(
            table.fetchBy {
                allScalarFields()
                user { allScalarFields() }
                categories { allScalarFields() }
                myTags { allScalarFields() }
                orderBy<Article> {
                    table.isTop
                    table.isFeatured
                }
            },
        )
    }.execute()

    fun listArticles(pageRequest: PageRequest): Page<ArticleInput> {

        val fetchPage = sql.createQuery(Article::class) {
            select(
                table.fetchBy {
                    where(table.isDelete eq 0)
                    where(table.status eq 1)
                    allScalarFields()
                    user { allScalarFields() }
                    categories { allScalarFields() }
                    myTags { allScalarFields() }
                    orderBy<Article> {
                        table.isTop
                        table.isFeatured
                    }
                },
            )
        }.fetchPage(pageRequest.pageNumber, pageRequest.pageSize)
        return fetchPage.map { ArticleInput(base = it) }
    }

     fun listArticlesByCategoryId(pageRequest: PageRequest, categoryId: Int): Page<ArticleInput>{

         val fetchPage = sql.createQuery(Article::class) {
             select(
                 table.fetchBy {
                     where(table.asTableEx().categories.id eq categoryId)
                     allScalarFields()
                     user { allScalarFields() }
                     categories { allScalarFields() }
                     myTags { allScalarFields() }
                     orderBy<Article> {
                         table.isTop
                         table.isFeatured
                     }
                 },
             )
         }.fetchPage(pageRequest.pageNumber, pageRequest.pageSize)
         return fetchPage.map { ArticleInput(base = it) }
     }

}

