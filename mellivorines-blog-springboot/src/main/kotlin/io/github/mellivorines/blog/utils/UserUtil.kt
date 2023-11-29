package io.github.mellivorines.blog.utils

import io.github.mellivorines.blog.model.dto.UserDetailsDTO
import org.springframework.security.core.Authentication
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.stereotype.Component


/**
 * @Description:
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/9/3
 */
@Component
class UserUtil {

    companion object {
        fun getUserDetailsDTO(): UserDetailsDTO {
            return SecurityContextHolder.getContext().authentication.principal as UserDetailsDTO
        }

        fun getAuthentication(): Authentication {
            return SecurityContextHolder.getContext().authentication
        }
    }

}