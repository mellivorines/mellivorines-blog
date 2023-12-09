package io.github.mellivorines.blog.model.dto

import io.github.mellivorines.blog.model.entity.dto.ArticleInput


/**
 * @Description:
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/12/9
 */
 data class ArticleOutput(
     val base:ArticleInput,
     val preArticleCard:ArticleInput?,
     val nextArticleCard:ArticleInput?
 )