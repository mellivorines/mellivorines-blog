package io.github.mellivorines.blog.service

import io.github.mellivorines.blog.model.entity.Resource
import io.github.mellivorines.blog.model.entity.dto.ResourceAdminDTO
import io.github.mellivorines.blog.model.entity.dto.ResourceDTO
import io.github.mellivorines.blog.model.entity.dto.ResourceInputForSave
import io.github.mellivorines.blog.model.entity.dto.ResourceInputForUpdate
import io.github.mellivorines.blog.repository.ResourceRepository
import io.github.mellivorines.salamanderblog.out.ConditionVO
import org.babyfish.jimmer.spring.repository.fetchPage
import org.springframework.data.domain.Page
import org.springframework.stereotype.Service


/**
 * @Description:
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/9/9
 */
@Service
class ResourceService(
    private val resourceRepository: ResourceRepository,
    private val redisService: RedisService
) {
    fun deleteResource(resourceId: Int): Any {
        return resourceRepository.deleteById(resourceId)
    }

    fun listResources(conditionVO: ConditionVO): Page<ResourceDTO>? {
        return resourceRepository.sql.createQuery(Resource::class) {
            select(table.fetch(ResourceDTO::class))
        }.fetchPage(pageIndex = conditionVO.current, pageSize = conditionVO.size)
    }

    fun saveResource(resourceInputForSave: ResourceInputForSave): Any {
        return resourceRepository.save(resourceInputForSave)
    }

    fun updateResource(resourceInputForUpdate: ResourceInputForUpdate): Any {
        return resourceRepository.update(resourceInputForUpdate)
    }

    fun listResourceOption(): List<ResourceAdminDTO>? {
        return resourceRepository.sql.createQuery(Resource::class){
            select(table.fetch(ResourceAdminDTO::class))
        }.execute()
    }
}