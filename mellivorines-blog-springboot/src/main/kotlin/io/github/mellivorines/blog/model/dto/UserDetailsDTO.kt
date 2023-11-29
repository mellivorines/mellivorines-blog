package io.github.mellivorines.blog.model.dto

import com.fasterxml.jackson.databind.annotation.JsonDeserialize
import com.fasterxml.jackson.databind.annotation.JsonSerialize
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer
import io.github.mellivorines.blog.constant.CommonConstant
import org.springframework.security.core.GrantedAuthority
import org.springframework.security.core.authority.SimpleGrantedAuthority
import org.springframework.security.core.userdetails.UserDetails
import java.beans.Transient
import java.time.LocalDateTime
import java.util.stream.Collectors


/**
 * @Description:
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/8/27
 */

data class UserDetailsDTO(

    val id: Int,
    val userInfoId: Int,
    val email: String,
    val loginType: Int,
    val roles: List<String>,
    val nickname: String,
    val avatar: String?,
    val intro: String,
    val website: String,
    val isSubscribe: Int,
    val ipAddress: String,
    val ipSource: String,
    val isDisable: Int,
    val browser: String?,
    val os: String?,
    @JsonDeserialize(using = LocalDateTimeDeserializer::class)
    @JsonSerialize(using = LocalDateTimeSerializer::class)
    var expireTime: LocalDateTime,

    @JsonDeserialize(using = LocalDateTimeDeserializer::class)
    @JsonSerialize(using = LocalDateTimeSerializer::class)
    val lastLoginTime: LocalDateTime
) : UserDetails {

    @Transient
    override fun getAuthorities(): Collection<GrantedAuthority?> {
        return roles.stream()
            .map { role: String? ->
                SimpleGrantedAuthority(
                    role
                )
            }
            .collect(Collectors.toSet())
    }

    override fun getUsername(): String {
        return this.username
    }

    override fun getPassword(): String {
        return this.password
    }

    @Transient
    override fun isAccountNonExpired(): Boolean {
        return true
    }

    @Transient
    override fun isAccountNonLocked(): Boolean {
        return isDisable == CommonConstant.FALSE
    }

    @Transient
    override fun isCredentialsNonExpired(): Boolean {
        return true
    }

    @Transient
    override fun isEnabled(): Boolean {
        return true
    }
}

