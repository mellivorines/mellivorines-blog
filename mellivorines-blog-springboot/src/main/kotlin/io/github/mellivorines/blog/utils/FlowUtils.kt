package io.github.mellivorines.blog.utils

import lombok.extern.slf4j.Slf4j
import org.springframework.data.redis.core.StringRedisTemplate
import org.springframework.stereotype.Component
import java.util.*
import java.util.concurrent.TimeUnit


/**
 * @Description:限流通用工具
 * 针对于不同的情况进行限流操作，支持限流升级
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/8/28
 */
@Slf4j
@Component
class FlowUtils(private val template: StringRedisTemplate) {

    /**
     * 针对于单次频率限制，请求成功后，在冷却时间内不得再次进行请求，如3秒内不能再次发起请求
     * @param key 键
     * @param blockTime 限制时间
     * @return 是否通过限流检查
     */
    fun limitOnceCheck(key: String, blockTime: Int): Boolean {
        return internalCheck(key, 1, blockTime) { false }
    }

    /**
     * 针对于单次频率限制，请求成功后，在冷却时间内不得再次进行请求
     * 如3秒内不能再次发起请求，如果不听劝阻继续发起请求，将限制更长时间
     * @param key 键
     * @param frequency 请求频率
     * @param baseTime 基础限制时间
     * @param upgradeTime 升级限制时间
     * @return 是否通过限流检查
     */
    fun limitOnceUpgradeCheck(key: String, frequency: Int, baseTime: Int, upgradeTime: Int): Boolean {
        return internalCheck(key, frequency, baseTime) { overclock: Boolean ->
            if (overclock) template.opsForValue()[key, "1", upgradeTime.toLong()] = TimeUnit.SECONDS
            false
        }
    }

    /**
     * 针对于在时间段内多次请求限制，如3秒内限制请求20次，超出频率则封禁一段时间
     * @param counterKey 计数键
     * @param blockKey 封禁键
     * @param blockTime 封禁时间
     * @param frequency 请求频率
     * @param period 计数周期
     * @return 是否通过限流检查
     */
    fun limitPeriodCheck(counterKey: String, blockKey: String?, blockTime: Int, frequency: Int, period: Int): Boolean {
        return internalCheck(counterKey, frequency, period) { overclock: Boolean ->
            if (overclock) template.opsForValue()[blockKey!!, "", blockTime.toLong()] = TimeUnit.SECONDS
            !overclock
        }
    }

    /**
     * 内部使用请求限制主要逻辑
     * @param key 计数键
     * @param frequency 请求频率
     * @param period 计数周期
     * @param action 限制行为与策略
     * @return 是否通过限流检查
     */
    private fun internalCheck(key: String, frequency: Int, period: Int, action: LimitAction): Boolean {
        return if (java.lang.Boolean.TRUE == template.hasKey(key)) {
            val value = Optional.ofNullable(template.opsForValue().increment(key)).orElse(0L)
            action.run(value > frequency)
        } else {
            template.opsForValue()[key, "1", period.toLong()] = TimeUnit.SECONDS
            true
        }
    }

    /**
     * 内部使用，限制行为与策略
     */
    private fun interface LimitAction {
        fun run(overclock: Boolean): Boolean
    }
}

