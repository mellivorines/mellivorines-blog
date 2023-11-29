package io.github.mellivorines.blog.utils

import io.github.mellivorines.salamanderblog.out.dto.EmailDTO
import jakarta.mail.MessagingException
import jakarta.mail.internet.MimeMessage
import org.springframework.beans.factory.annotation.Value
import org.springframework.mail.javamail.JavaMailSender
import org.springframework.mail.javamail.MimeMessageHelper
import org.springframework.stereotype.Component
import org.thymeleaf.TemplateEngine
import org.thymeleaf.context.Context


/**
 * @Description:
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/8/28
 */
@Component
class EmailUtil(
    @Value("\${spring.mail.username}")
    private val email:String,
    private val javaMailSender: JavaMailSender,
    private val templateEngine: TemplateEngine
) {

    fun sendHtmlMail(emailDTO: EmailDTO) {
        try {
            val mimeMessage: MimeMessage = javaMailSender.createMimeMessage()
            val mimeMessageHelper = MimeMessageHelper(mimeMessage)
            val context = Context()
            context.setVariables(emailDTO.commentMap)
            val process: String = templateEngine.process(emailDTO.template, context)
            mimeMessageHelper.setFrom(email)
            mimeMessageHelper.setTo(emailDTO.email)
            mimeMessageHelper.setSubject(emailDTO.subject)
            mimeMessageHelper.setText(process, true)
            javaMailSender.send(mimeMessage)
        } catch (e: MessagingException) {
            e.printStackTrace()
        }
    }
}