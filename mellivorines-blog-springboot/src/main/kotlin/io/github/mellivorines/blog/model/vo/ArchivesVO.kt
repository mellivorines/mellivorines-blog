package io.github.mellivorines.blog.model.vo

import io.github.mellivorines.blog.model.entity.dto.ArticleInput


/**
 * @Description:
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/12/3
 */
data class ArchivesVO(
    val time: String,
    val articles: List<ArticleInput>
)
