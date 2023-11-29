package io.github.mellivorines.blog.config.rabbitmq

import com.alibaba.fastjson2.JSON
import io.github.mellivorines.blog.constant.CommonConstant.MAXWELL_QUEUE
import io.github.mellivorines.blog.config.elasticsearch.ElasticsearchMapper
import io.github.mellivorines.blog.config.elasticsearch.modle.ArticleSearchDTO
import io.github.mellivorines.blog.config.elasticsearch.modle.MaxwellDataDTO
import io.github.mellivorines.blog.model.entity.Article
import org.springframework.amqp.rabbit.annotation.RabbitHandler
import org.springframework.amqp.rabbit.annotation.RabbitListener
import org.springframework.stereotype.Component


/**
 * @Description:
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/8/21
 */
@Component
@RabbitListener(queues = [MAXWELL_QUEUE])
class MaxWellConsumer(private val elasticsearchMapper: ElasticsearchMapper) {

    @RabbitHandler
    fun process(data: ByteArray?) {
        val maxwellDataDTO: MaxwellDataDTO = JSON.parseObject(String(data!!), MaxwellDataDTO::class.java)
        val article: Article = JSON.parseObject(JSON.toJSONString(maxwellDataDTO.data), Article::class.java)
        when (maxwellDataDTO.type) {
            "insert", "update" -> elasticsearchMapper.save(
                ArticleSearchDTO(
                    article.id,
                    article.articleTitle,
                    article.articleContent,
                    article.isDelete,
                    article.status
                )
            )
            "delete" -> elasticsearchMapper.deleteById(article.id)
            else -> {}
        }
    }
}