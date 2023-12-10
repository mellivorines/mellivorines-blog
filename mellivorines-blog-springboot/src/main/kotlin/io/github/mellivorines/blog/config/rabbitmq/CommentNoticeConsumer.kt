package io.github.mellivorines.blog.config.rabbitmq

import com.alibaba.fastjson2.JSON
import io.github.mellivorines.blog.constant.CommonConstant.EMAIL_QUEUE
import io.github.mellivorines.blog.utils.EmailUtil
import io.github.mellivorines.salamanderblog.out.dto.EmailDTO
import org.springframework.amqp.rabbit.annotation.RabbitHandler
import org.springframework.amqp.rabbit.annotation.RabbitListener
import org.springframework.stereotype.Component


/**
 * @Description:邮件通知队列
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/8/19
 */
@Component
@RabbitListener(queues = [EMAIL_QUEUE])
class CommentNoticeConsumer(private val emailUtil: EmailUtil) {

    @RabbitHandler
    fun process(data: ByteArray) {
        val emailDTO: EmailDTO = JSON.parseObject(String(data), EmailDTO::class.java)
        emailUtil.sendHtmlMail(emailDTO)
    }

}