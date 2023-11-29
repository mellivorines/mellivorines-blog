package io.github.mellivorines.blog.controller

import io.github.mellivorines.blog.model.ResultVO
import io.github.mellivorines.blog.model.entity.About
import io.github.mellivorines.blog.repository.AboutRepository
import io.swagger.v3.oas.annotations.tags.Tag
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController


/**
 * @Description:
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/9/19
 */
@Tag(name = "关于模块")
@RestController
@RequestMapping("/api")
class AboutController(private val aboutRepository: AboutRepository) {


    @GetMapping("/about")
    @Throws(Exception::class)
    fun about(): ResultVO<About> {
        return ResultVO.success(aboutRepository.findAll()[0])
    }

}