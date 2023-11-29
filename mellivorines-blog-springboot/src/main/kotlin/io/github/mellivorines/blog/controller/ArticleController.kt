package io.github.mellivorines.blog.controller

import cn.xuyanwu.spring.file.storage.FileStorageService
import io.swagger.v3.oas.annotations.tags.Tag
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController


/**
 * @Description:
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/10/21
 */
@Tag(name = "关于模块")
@RestController
@RequestMapping("/api")
class ArticleController(
    private val fileStorageService: FileStorageService,

) {
}