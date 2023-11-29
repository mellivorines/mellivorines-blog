package io.github.mellivorines.blog.model.dto


/**
 * @Description:
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/10/14
 */
data class MellivorinesHomeInfoDTO(
    var articleCount: Int,

    val talkCount: Int,

    val categoryCount: Int,

    val tagCount: Int,

    val websiteConfig: WebsiteConfigDTO,

    val viewCount: Int
)