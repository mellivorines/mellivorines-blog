package io.github.mellivorines.blog.model.dto

import java.time.LocalDateTime


/**
 * @Description:
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/9/3
 */
data class UserOnlineDTO(

    var userInfoId: Int,


    val nickname: String,


    val avatar: String,


    val ipAddress: String,


    val ipSource: String,


    val browser: String,


    val os: String,


    val lastLoginTime: LocalDateTime?
)