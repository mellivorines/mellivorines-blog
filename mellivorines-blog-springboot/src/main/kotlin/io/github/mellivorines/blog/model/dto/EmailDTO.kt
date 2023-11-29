package io.github.mellivorines.salamanderblog.out.dto


/**
 * @Description:
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/8/19
 */
data class EmailDTO(
    val email: String,
    val subject: String,
    val commentMap: Map<String, Any>,
    val template: String
)