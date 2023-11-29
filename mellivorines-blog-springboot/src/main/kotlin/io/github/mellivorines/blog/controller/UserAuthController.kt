package io.github.mellivorines.blog.controller

import io.github.mellivorines.blog.model.ResultVO
import io.github.mellivorines.blog.model.entity.dto.UserAuthAdmin
import io.github.mellivorines.blog.model.vo.PasswordVO
import io.github.mellivorines.blog.model.vo.UserVO
import io.github.mellivorines.blog.service.UserAuthService
import io.github.mellivorines.salamanderblog.out.ConditionVO
import io.github.mellivorines.salamanderblog.out.dto.UserAreaDTO
import io.swagger.v3.oas.annotations.Operation
import io.swagger.v3.oas.annotations.tags.Tag
import org.springframework.data.domain.Page
import org.springframework.web.bind.annotation.*


/**
 * @Description:
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/8/19
 */

@Tag(name = "用户账号模块")
@RestController
@RequestMapping("/api")
class UserAuthController(private val userAuthService: UserAuthService) {

    @Operation(summary = "发送邮箱验证码")
    @GetMapping("users/code")
    fun sendCode(username: String): ResultVO<Boolean> {
        return ResultVO.success(userAuthService.sendCode(username))
    }

    @Operation(summary = "获取用户区域分布")
    @GetMapping("admin/users/area")
    fun listUserAreas(conditionVO: ConditionVO): ResultVO<List<UserAreaDTO>> {
        return ResultVO.success(userAuthService.listUserAreas(conditionVO))
    }


    @Operation(summary = "查询后台用户列表")
    @PostMapping("/admin/users")
    fun listUsers(@RequestBody conditionVo: ConditionVO): ResultVO<Page<UserAuthAdmin>> {
        return ResultVO.success(userAuthService.listUsers(conditionVo))
    }


    @Operation(summary = "用户注册")
    @PostMapping("/users/register")
    fun register(@RequestBody userVO: UserVO): ResultVO<Any> {
        return ResultVO.success(userAuthService.register(userVO))
    }

    @Operation(summary = "修改密码")
    @PutMapping("/users/password")
    fun updatePassword(@RequestBody user: UserVO): ResultVO<Any> {
        return ResultVO.success(userAuthService.updatePassword(user))
    }

    @Operation(summary = "修改管理员密码")
    @PutMapping("/admin/users/password")
    fun updateAdminPassword(@RequestBody passwordVO: PasswordVO): ResultVO<Any> {
        return ResultVO.success(userAuthService.updateAdminPassword(passwordVO))
    }

}