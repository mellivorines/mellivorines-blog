package io.github.mellivorines.salamanderblog.out

import lombok.AllArgsConstructor
import lombok.Builder
import lombok.Data
import lombok.NoArgsConstructor
import java.time.LocalDateTime


/**
 * @Description:
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/8/20
 */

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
data class ConditionVO(
    val current: Int,

    val size: Int,

    val keywords: String?,

    val categoryId: Int?,

    val tagId: Int?,

    val albumId: Int?,

    val loginType: Int?,

    val type: Int?,

    val status: Int?,

    val startTime: LocalDateTime?,

    val endTime: LocalDateTime?,

    val isDelete: Int?,

    val isReview: Int?,

    val isTop: Int?,

    val isFeatured: Int?,
)
