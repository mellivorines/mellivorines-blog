package io.github.mellivorines.blog.config.elasticsearch.modle

import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import org.springframework.data.annotation.Id
import org.springframework.data.elasticsearch.annotations.Document
import org.springframework.data.elasticsearch.annotations.Field
import org.springframework.data.elasticsearch.annotations.FieldType


/**
 * @Description:
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/8/21
 */
@JsonIgnoreProperties(ignoreUnknown = true)
@Document(indexName = "article" ,createIndex = false)
data class ArticleSearchDTO(
    @Id
    private val id: Int,

    @Field(type = FieldType.Text, analyzer = "ik_max_word")
    private val articleTitle: String,

    @Field(type = FieldType.Text, analyzer = "ik_max_word")
    private val articleContent: String,

    @Field(type = FieldType.Integer)
    private val isDelete: Int,

    @Field(type = FieldType.Integer)
    private val status: Int
)

