package io.github.mellivorines.blog.controller

import cn.xuyanwu.spring.file.storage.FileStorageService
import io.github.mellivorines.blog.constant.FilePathEnum
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController
import org.springframework.web.multipart.MultipartFile


/**
 * @Description:
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/9/3
 */
@RestController
@RequestMapping("/api")
class FileController(private val fileStorageService: FileStorageService) {

    @PostMapping("/file/upload")
    @Throws(Exception::class)
    fun upload(file: MultipartFile): String {
        return fileStorageService.of(file).setPath(FilePathEnum.MD.path).upload().url
    }
}

