package io.github.mellivorines.blog.repository

import io.github.mellivorines.blog.model.entity.Menu
import org.babyfish.jimmer.spring.repository.KRepository
import org.springframework.stereotype.Repository

/**
 * <p>
 * MenuRepository 接口
 * </p>
 *
 * @author lilinxi
 * @date 2023-08-17
 */
@Repository
interface MenuRepository : KRepository<Menu, Int>

