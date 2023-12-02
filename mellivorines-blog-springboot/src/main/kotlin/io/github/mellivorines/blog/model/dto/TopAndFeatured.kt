package io.github.mellivorines.blog.model.dto

import io.github.mellivorines.blog.model.entity.dto.ArticleInput


/**
 * @Description:
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/12/2
 */
data class TopAndFeatured(
    val featuredArticles: List<ArticleInput>,
    val topArticle: ArticleInput,
)
