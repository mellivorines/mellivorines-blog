package io.github.mellivorines.blog.service

import io.github.mellivorines.blog.constant.CommonConstant.USER_CODE_KEY
import io.github.mellivorines.blog.constant.FilePathEnum
import io.github.mellivorines.blog.constant.LoginTypeEnum
import io.github.mellivorines.blog.exception.BizException
import io.github.mellivorines.blog.model.entity.*
import io.github.mellivorines.blog.model.entity.dto.UserAuthInput
import io.github.mellivorines.blog.model.vo.UserInfoVO
import io.github.mellivorines.blog.model.vo.UserRoleVO
import io.github.mellivorines.blog.repository.UserAuthRepository
import io.github.mellivorines.blog.repository.UserInfoRepository
import io.github.mellivorines.blog.utils.UserUtil
import org.babyfish.jimmer.kt.new
import org.babyfish.jimmer.sql.kt.ast.expression.eq
import org.dromara.x.file.storage.core.FileStorageService
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
import org.springframework.stereotype.Service
import org.springframework.web.multipart.MultipartFile
import java.util.*


/**
 * @Description:
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/9/3
 */
@Service
class UserInfoService(
    private val userInfoRepository: UserInfoRepository,
    private val userAuthRepository: UserAuthRepository,
    private val fileStorageService: FileStorageService,
    private val redisService: RedisService
) {
    fun updateUserInfo(userInfoVO: UserInfoVO): Any {
        return userInfoRepository.sql.update(userInfoVO).totalAffectedRowCount > 0
    }

    fun updateUserAvatar(file: MultipartFile): String? {
        val findById = userInfoRepository.findById(UserUtil.getUserDetailsDTO().id).get()

        val avatarForFile = fileStorageService.of(file).setPath(FilePathEnum.AVATAR.path).upload().url
        println(avatarForFile)
        val user = new(UserInfo::class).by {
            id = findById.id
            avatar = avatarForFile
            nickname = findById.nickname
            isDisable = findById.isDisable
        }
        userInfoRepository.sql.update(user).totalAffectedRowCount
        return avatarForFile
    }

    fun updateUserInfoBySub(subscribeVO: UserInfoVO): Any {
        if (subscribeVO.code != null) {
            if (Objects.isNull(redisService.get(USER_CODE_KEY + subscribeVO.email))) {
                throw BizException("验证码错误")
            }
            if (subscribeVO.code != redisService.get(USER_CODE_KEY + subscribeVO.email).toString()) {
                throw BizException("验证码错误！")
            }
        }
        val findById = userInfoRepository.findById(UserUtil.getUserDetailsDTO().id).get()

        val user = new(UserInfo::class).by {
            id = findById.id
            avatar = findById.avatar
            nickname = subscribeVO.nickname ?: findById.nickname
            isDisable = subscribeVO.isDisable ?: findById.isDisable
            if (subscribeVO.isSubscribe != null) {
                isSubscribe = subscribeVO.isSubscribe
            }
            if (subscribeVO.email != null) {
                email = subscribeVO.email
            }
        }
        return userInfoRepository.sql.update(user).totalAffectedRowCount > 0
    }

    fun getUserInfoById(userInfoId: Int): UserInfo? {
        return userInfoRepository.findById(userInfoId).get()
    }

    fun updateUserRole(userRoleVO: UserRoleVO): Any {
        updateUserInfoBySub(UserInfoVO(id = userRoleVO.userInfoId, nickname = userRoleVO.nickname))

        val fetchOneOrNull = userAuthRepository.sql.createQuery(UserAuth::class) {
            where(table.userInfo.id eq userRoleVO.userInfoId)
            select(table.fetch(UserAuthInput::class))
        }.fetchOneOrNull()
        val userAuth = new(UserAuth::class).by {
            if (fetchOneOrNull != null) {
                username = fetchOneOrNull.username
                password = BCryptPasswordEncoder().encode(fetchOneOrNull.password)
                loginType = LoginTypeEnum.EMAIL.type
                userInfo().apply {
                    id = userRoleVO.userInfoId
                }

                userRoleVO.roleIds.forEach {
                    roles().addBy { id = it }
                }

            } else {
                throw BizException("用户不存在!")
            }
        }
        return userAuthRepository.sql.save(userAuth).totalAffectedRowCount > 0

    }

//    fun listOnlineUsers(conditionVO: ConditionVO): Page<UserOnlineDTO> {
//        val userMaps: Map<String?, Any?> = redisService.hGetAll("login_user")
//        val values = userMaps.values
//        val userDetailsDTOs: ArrayList<UserDetailsDTO> = ArrayList<UserDetailsDTO>()
//        for (value in values) {
//            userDetailsDTOs.add(value as UserDetailsDTO)
//        }
//        val userOnlineDTOs: List<UserOnlineDTO> = BeanCopyUtil.copyList(
//            userDetailsDTOs,
//            UserOnlineDTO::class.java
//        )
//        val onlineUsers: List<UserOnlineDTO> = userOnlineDTOs.stream()
//            .filter { item: UserOnlineDTO ->
//                StringUtils.isBlank(
//                    conditionVO.getKeywords()
//                ) || item.getNickname().contains(conditionVO.getKeywords())
//            }
//            .sorted(Comparator.comparing<Any, Any>(UserOnlineDTO::getLastLoginTime).reversed())
//            .collect(Collectors.toList<Any>())
//        val fromIndex: Int = getLimitCurrent().intValue()
//        val size: Int = getSize().intValue()
//        val toIndex = if (onlineUsers.size - fromIndex > size) fromIndex + size else onlineUsers.size
//        val userOnlineList = onlineUsers.subList(fromIndex, toIndex)
//        return PageResultDTO(userOnlineList, onlineUsers.size)
//    }


}