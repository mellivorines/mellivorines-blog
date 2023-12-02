package io.github.mellivorines.blog.web

import com.alibaba.fastjson2.to
import com.alibaba.fastjson2.toJSONString
import io.github.mellivorines.blog.constant.CommonConstant.BLOG_VIEWS_COUNT
import io.github.mellivorines.blog.constant.CommonConstant.DEFAULT_CONFIG_ID
import io.github.mellivorines.blog.constant.CommonConstant.WEBSITE_CONFIG
import io.github.mellivorines.blog.model.ResultVO
import io.github.mellivorines.blog.model.dto.MellivorinesHomeInfoDTO
import io.github.mellivorines.blog.model.dto.WebsiteConfigDTO
import io.github.mellivorines.blog.model.entity.dto.WebsiteConfigInput
import io.github.mellivorines.blog.repository.*
import io.github.mellivorines.blog.service.RedisService
import io.swagger.v3.oas.annotations.Operation
import jakarta.servlet.http.HttpServletRequest
import org.springframework.web.bind.annotation.*
import java.util.*


/**
 * @Description:系统相关
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/10/14
 */
@RestController
@RequestMapping("/api")
class SystemInfoController(
    private val articleRepository: ArticleRepository,
    private val categoryRepository: CategoryRepository,
    private val tagRepository: TagRepository,
    private val talkRepository: TalkRepository,
    private val websiteConfigRepository: WebsiteConfigRepository,
    private val redisService: RedisService,
    private var request: HttpServletRequest
) {
//
//    @Operation(summary = "上报访客信息")
//    @PostMapping("/report")
//    fun report(): ResultVO<Any> {
//        val ipAddress: String = IPUtil.getIpAddr(request)
//        val userAgent = IPUtil.getUserAgent(request)
//        val browser = userAgent.getBrowser()
//        val operatingSystem = userAgent.getOperatingSystem()
//        val uuid = ipAddress + browser.getName() + operatingSystem.getName()
//        val md5 = DigestUtils.md5DigestAsHex(uuid.toByteArray())
//        if (!redisService.sIsMember(UNIQUE_VISITOR, md5)!!) {
//            val ipSource: String = IPUtil.getIpSource(ipAddress)
//            if (ipSource.isBlank()) {
//                val ipProvince: String = IPUtil.getIpProvince(ipSource)
//                redisService.hIncr(VISITOR_AREA, ipProvince, 1L)
//            } else {
//                redisService.hIncr(VISITOR_AREA, UNKNOWN, 1L)
//            }
//            redisService.incr(BLOG_VIEWS_COUNT, 1)
//            redisService.sAdd(UNIQUE_VISITOR, md5)
//        }
//        return ResultVO.success(true)
//    }

    @Operation(summary = "获取系统信息")
    @GetMapping("/website/info")
    fun getBlogHomeInfo(): ResultVO<MellivorinesHomeInfoDTO> {
        val articleCount = articleRepository.findAll().size
        val categoryCount = categoryRepository.findAll().size
        val tagCount = tagRepository.findAll().size
        val talkCount = talkRepository.findAll().size
        val websiteConfig: WebsiteConfigDTO = getWebsiteConfig()
        val count = redisService.get(BLOG_VIEWS_COUNT)
        val blogViewsCount: Int = if (count == null) 0 else count as Int
        return ResultVO.success(
            MellivorinesHomeInfoDTO(
                articleCount,
                talkCount,
                categoryCount,
                tagCount,
                websiteConfig,
                blogViewsCount
            )
        )
    }
    @Operation(summary = "更新网站配置")
    @PutMapping("/admin/website/config")
    fun updateWebsiteConfig(@RequestBody websiteConfigVO:WebsiteConfigDTO): ResultVO<Any> {
        websiteConfigRepository.update(WebsiteConfigInput(DEFAULT_CONFIG_ID, websiteConfigVO.toJSONString()))
        redisService.del(WEBSITE_CONFIG)
        return ResultVO.success(true)
    }

    fun getWebsiteConfig(): WebsiteConfigDTO {
        val websiteConfigDTO: WebsiteConfigDTO
        val websiteConfig = redisService.get(WEBSITE_CONFIG)
        websiteConfigDTO = if (Objects.nonNull(websiteConfig)) {
            websiteConfig.toString().to<WebsiteConfigDTO>()
        } else {
            val config = websiteConfigRepository.findAll()[0].config
            redisService.set(WEBSITE_CONFIG, config)
            config.to<WebsiteConfigDTO>()
        }
        return websiteConfigDTO
    }
}