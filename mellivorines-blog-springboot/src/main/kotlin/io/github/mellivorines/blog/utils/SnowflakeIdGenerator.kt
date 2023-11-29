package io.github.mellivorines.blog.utils

import org.springframework.stereotype.Component


/**
 * @Description:雪花算法ID生成器
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/8/28
 */
@Component
class SnowflakeIdGenerator private constructor(dataCenterId: Long, workerId: Long) {
    private val dataCenterId: Long
    private val workerId: Long
    private var lastTimestamp = -1L
    private var sequence = 0L

    constructor() : this(1, 1)

    init {
        require(!(dataCenterId > MAX_DATA_CENTER_ID || dataCenterId < 0)) { "Data center ID can't be greater than $MAX_DATA_CENTER_ID or less than 0" }
        require(!(workerId > MAX_WORKER_ID || workerId < 0)) { "Worker ID can't be greater than $MAX_WORKER_ID or less than 0" }
        this.dataCenterId = dataCenterId
        this.workerId = workerId
    }

    /**
     * 生成一个新的雪花算法ID加锁
     * @return 雪花ID
     */
    @Synchronized
    fun nextId(): Long {
        var timestamp = getCurrentTimestamp()
        check(timestamp >= lastTimestamp) { "Clock moved backwards. Refusing to generate ID." }
        if (timestamp == lastTimestamp) {
            sequence = sequence + 1 and MAX_SEQUENCE
            if (sequence == 0L) {
                timestamp = getNextTimestamp(lastTimestamp)
            }
        } else {
            sequence = 0L
        }
        lastTimestamp = timestamp
        return timestamp - START_TIMESTAMP shl TIMESTAMP_SHIFT.toInt() or
                (dataCenterId shl DATA_CENTER_ID_SHIFT.toInt()) or
                (workerId shl WORKER_ID_SHIFT.toInt()) or
                sequence
    }

    private fun getCurrentTimestamp(): Long {
        return System.currentTimeMillis()
    }

    private fun getNextTimestamp(lastTimestamp: Long): Long {
        var timestamp = getCurrentTimestamp()
        while (timestamp <= lastTimestamp) {
            timestamp = getCurrentTimestamp()
        }
        return timestamp
    }

    companion object {
        private const val START_TIMESTAMP = 1691087910202L
        private const val DATA_CENTER_ID_BITS = 5L
        private const val WORKER_ID_BITS = 5L
        private const val SEQUENCE_BITS = 12L
        private const val MAX_DATA_CENTER_ID = (-1L shl DATA_CENTER_ID_BITS.toInt()).inv()
        private const val MAX_WORKER_ID = (-1L shl WORKER_ID_BITS.toInt()).inv()
        private const val MAX_SEQUENCE = (-1L shl SEQUENCE_BITS.toInt()).inv()
        private const val WORKER_ID_SHIFT = SEQUENCE_BITS
        private const val DATA_CENTER_ID_SHIFT = SEQUENCE_BITS + WORKER_ID_BITS
        private const val TIMESTAMP_SHIFT = SEQUENCE_BITS + WORKER_ID_BITS + DATA_CENTER_ID_BITS
    }
}
