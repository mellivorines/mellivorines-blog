package io.github.mellivorines.blog.model

import com.alibaba.fastjson2.JSONObject
import com.alibaba.fastjson2.JSONWriter
import org.slf4j.MDC
import java.util.*


/**
 * @Description:响应实体类封装，Rest风格
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/8/28
 */
data class ResultVO<T>(var id: Long, var code: Int, var data: T?, var message: String) {
    /**
     * 快速将当前实体转换为JSON字符串格式
     * @return JSON字符串
     */
    fun asJsonString(): String {
        return JSONObject.toJSONString(this, JSONWriter.Feature.WriteNulls)
    }

    companion object {
        fun <T> success(data: T?): ResultVO<T> {
            return ResultVO(requestId(), 200, data, "操作成功！")
        }

        fun <T> success(): ResultVO<T> {
            return success(null)
        }

        fun <T> forbidden(message: String): ResultVO<T> {
            return failure(403, message)
        }

        fun <T> unauthorized(message: String): ResultVO<T> {
            return failure(401, message)
        }

        fun <T> failure(code: Int, message: String): ResultVO<T> {
            return ResultVO(requestId(), code, null, message)
        }

        /**
         * 获取当前请求ID方便快速定位错误
         * @return ID
         */
        private fun requestId(): Long {
            val requestId = Optional.ofNullable(MDC.get("reqId")).orElse("0")
            return requestId.toLong()
        }
    }
}


