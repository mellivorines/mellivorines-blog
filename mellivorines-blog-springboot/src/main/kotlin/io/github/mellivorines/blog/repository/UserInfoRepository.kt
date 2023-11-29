package io.github.mellivorines.blog.repository

import io.github.mellivorines.blog.model.entity.UserInfo
import org.babyfish.jimmer.spring.repository.KRepository
import org.springframework.stereotype.Repository

/**
 * <p>
 * UserInfoRepository 接口
 * </p>
 *
 * @author lilinxi
 * @date 2023-08-17
 */
@Repository
interface UserInfoRepository : KRepository<UserInfo, Int> {
    fun findAllByIsSubscribe(isSubscribe: Int): List<UserInfo>

}

