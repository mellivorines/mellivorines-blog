package io.github.mellivorines.blog.exception

import io.github.mellivorines.blog.constant.StatusCodeEnum


/**
 * @Description:异常类
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/8/19
 */
 class BizException() : RuntimeException() {
    private var code: Int = StatusCodeEnum.FAIL.code

    override var message: String? = null

     constructor(message: String?) : this() {
        this.message = message
    }

     constructor(statusCodeEnum: StatusCodeEnum) : this() {
        this.code = statusCodeEnum.code
        message = statusCodeEnum.desc
    }
}