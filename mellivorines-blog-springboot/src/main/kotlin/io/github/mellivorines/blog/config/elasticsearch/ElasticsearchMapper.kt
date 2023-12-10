package io.github.mellivorines.blog.config.elasticsearch

import io.github.mellivorines.blog.config.elasticsearch.modle.ArticleSearchDTO
import org.springframework.data.domain.Pageable
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository


/**
 * @Description:
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/8/21
 */
interface ElasticsearchMapper : ElasticsearchRepository<ArticleSearchDTO, Int> {
    /**
     * 根据标题查询
     * @param [title]
     * @return [List<ArticleSearchDTO>]
     */
    fun findByArticleTitle(title: String): List<ArticleSearchDTO>

    /**
     * 根据标题或内容查询
     * @param [title]
     * @param [context]
     * @return [List<ArticleSearchDTO>]
     */
    fun findByArticleTitleOrArticleContent(title: String, context: String): List<ArticleSearchDTO>

    /**
     * 根据标题或内容查询（含分页）
     * @param [title]
     * @param [context]
     * @param [pageable]
     * @return [List<ArticleSearchDTO>]
     */
    fun findByArticleTitleOrArticleContent(title: String, context: String, pageable: Pageable): List<ArticleSearchDTO>
}
