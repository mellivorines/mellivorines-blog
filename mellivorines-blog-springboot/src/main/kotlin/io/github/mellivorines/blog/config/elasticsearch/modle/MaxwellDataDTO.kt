package io.github.mellivorines.blog.config.elasticsearch.modle


/**
 * @Description:
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/8/21
 */
data class MaxwellDataDTO(
    var database: String,
    val xid: Int,
    val data: Map<String, Any>,
    val commit: Boolean,
    val type: String,
    val table: String,
    val ts: Int
)