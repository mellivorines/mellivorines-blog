package io.github.mellivorines.blog.config.rabbitmq

import com.alibaba.fastjson2.JSON
import io.github.mellivorines.blog.constant.CommonConstant.SUBSCRIBE_QUEUE
import io.github.mellivorines.blog.constant.CommonConstant.TRUE
import io.github.mellivorines.blog.utils.EmailUtil
import io.github.mellivorines.blog.model.entity.Article
import io.github.mellivorines.blog.model.entity.UserInfo
import io.github.mellivorines.salamanderblog.out.dto.EmailDTO
import io.github.mellivorines.blog.repository.ArticleRepository
import io.github.mellivorines.blog.repository.UserInfoRepository
import org.springframework.amqp.rabbit.annotation.RabbitHandler
import org.springframework.amqp.rabbit.annotation.RabbitListener
import org.springframework.beans.factory.annotation.Value
import org.springframework.stereotype.Component
import java.util.stream.Collectors


/**
 * @Description:
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/8/21
 */
@Component
@RabbitListener(queues = [SUBSCRIBE_QUEUE])
class SubscribeConsumer(
    private val articleRepository: ArticleRepository,

    private val userInfoRepository: UserInfoRepository,

    private val emailUtil: EmailUtil
) {

    @Value("\${website.url}")
    private lateinit var websiteUrl: String

    @RabbitHandler
    fun process(data: ByteArray) {
        val articleId: Int = JSON.parseObject(String(data), Int::class.java)
        val article: Article = articleRepository.findById(articleId).get()
        val users: List<UserInfo> =
            userInfoRepository.findAllByIsSubscribe(TRUE)
        val emails = users.stream().map<String>(UserInfo::email).collect(Collectors.toList())
        for (email in emails) {

            val map: MutableMap<String, Any> = HashMap()
            val url = "$websiteUrl/articles/$articleId"
            if (article.updateTime == null) {
                map["content"] = ("花未眠的个人博客发布了新的文章，"
                        + "<a style=\"text-decoration:none;color:#12addb\" href=\"" + url + "\">点击查看</a>")
            } else {
                map["content"] = (("花未眠的个人博客对《" + article.articleTitle) + "》进行了更新，"
                        + "<a style=\"text-decoration:none;color:#12addb\" href=\"" + url + "\">点击查看</a>")
            }
            val emailDTO = EmailDTO(
                email,
                "文章订阅",
                map,
                "CommonConstant.html"
            )
            emailUtil.sendHtmlMail(emailDTO)
        }
    }
}
