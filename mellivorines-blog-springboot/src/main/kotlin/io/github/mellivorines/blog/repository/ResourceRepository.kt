package io.github.mellivorines.blog.repository

import io.github.mellivorines.blog.model.entity.Resource
import org.babyfish.jimmer.spring.repository.KRepository
import org.springframework.stereotype.Repository

/**
 * <p>
 * ResourceRepository 接口
 * </p>
 *
 * @author lilinxi
 * @date 2023-08-17
 */
@Repository
interface ResourceRepository : KRepository<Resource, Int>

