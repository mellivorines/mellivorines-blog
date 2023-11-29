package io.github.mellivorines.salamanderblog.out.dto

import lombok.Builder


/**
 * @Description:
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/8/20
 */
@Builder
data class UserAreaDTO(
    val name: String,
    val value: Long
)