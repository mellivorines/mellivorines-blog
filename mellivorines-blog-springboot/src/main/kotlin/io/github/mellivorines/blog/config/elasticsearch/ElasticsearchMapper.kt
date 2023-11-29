package io.github.mellivorines.blog.config.elasticsearch

import io.github.mellivorines.blog.config.elasticsearch.modle.ArticleSearchDTO
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository


/**
 * @Description:
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/8/21
 */
interface ElasticsearchMapper : ElasticsearchRepository<ArticleSearchDTO, Int>
