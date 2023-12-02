package io.github.mellivorines.blog.web

import io.github.mellivorines.blog.model.ResultVO
import io.github.mellivorines.blog.model.entity.UserInfo
import io.github.mellivorines.blog.model.vo.UserInfoVO
import io.github.mellivorines.blog.model.vo.UserRoleVO
import io.github.mellivorines.blog.service.UserInfoService
import io.swagger.v3.oas.annotations.Operation
import io.swagger.v3.oas.annotations.tags.Tag
import org.springframework.web.bind.annotation.*
import org.springframework.web.multipart.MultipartFile


/**
 * @Description:用户信息模块
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/9/3
 */
@Tag(name = "用户信息模块")
@RestController
@RequestMapping("/api")
class UserInfoController(private val userInfoService: UserInfoService) {
    @Operation(summary = "更新用户信息")
    @PutMapping("/users/info")
    fun updateUserInfo(@RequestBody userInfoVO: UserInfoVO): ResultVO<Any> {
        return ResultVO.success(userInfoService.updateUserInfo(userInfoVO))
    }

    @Operation(summary = "更新用户头像")
    @PostMapping("/users/avatar")
    fun updateUserAvatar(file: MultipartFile): ResultVO<String> {
        return ResultVO.success(userInfoService.updateUserAvatar(file))
    }

    @Operation(summary = "绑定用户邮箱")
    @PutMapping("/users/email")
    fun saveUserEmail(@RequestBody emailVO: UserInfoVO): ResultVO<Any> {
        return ResultVO.success(userInfoService.updateUserInfoBySub(emailVO))
    }

    @Operation(summary = "修改用户的订阅状态")
    @PutMapping("/users/subscribe")
    fun updateUserSubscribe(@RequestBody subscribeVO: UserInfoVO): ResultVO<Any> {
        return ResultVO.success(userInfoService.updateUserInfoBySub(subscribeVO))
    }

    @Operation(summary = "修改用户禁用状态")
    @PutMapping("/admin/users/disable")
    fun updateUserDisable(@RequestBody userDisableVO: UserInfoVO): ResultVO<Any> {
        return ResultVO.success(userInfoService.updateUserInfoBySub(userDisableVO))
    }

//    @Operation(summary = "查看在线用户")
//    @GetMapping("/admin/users/online")
//    fun listOnlineUsers(conditionVO: ConditionVO): ResultVO<Page<UserOnlineDTO>> {
//        return ResultVO.success(userInfoService.listOnlineUsers(conditionVO))
//    }

//    @Operation(summary = "下线用户")
//    @DeleteMapping("/admin/users/{userInfoId}/online")
//    fun removeOnlineUser(@PathVariable("userInfoId") userInfoId: Int?): ResultVO<*> {
//        return ResultVO.success(userInfoService.removeOnlineUser(userInfoId))
//    }

    @Operation(summary = "根据id获取用户信息")
    @GetMapping("/users/info/{userInfoId}")
    fun getUserInfoById(@PathVariable("userInfoId") userInfoId: Int): ResultVO<UserInfo> {
        return ResultVO.success(userInfoService.getUserInfoById(userInfoId))
    }

    @Operation(summary = "修改用户角色")
    @PutMapping("/admin/users/role")
    fun updateUserRole(@RequestBody userRoleVO: UserRoleVO): ResultVO<Any> {

        return ResultVO.success(userInfoService.updateUserRole(userRoleVO))
    }
}
