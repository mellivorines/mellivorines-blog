package io.github.mellivorines.blog.service

import jakarta.annotation.Resource
import org.springframework.data.domain.Sort
import org.springframework.data.geo.Distance
import org.springframework.data.geo.GeoResults
import org.springframework.data.geo.Point
import org.springframework.data.redis.connection.BitFieldSubCommands
import org.springframework.data.redis.connection.RedisConnection
import org.springframework.data.redis.connection.RedisGeoCommands
import org.springframework.data.redis.connection.RedisGeoCommands.GeoRadiusCommandArgs
import org.springframework.data.redis.core.RedisCallback
import org.springframework.data.redis.core.RedisTemplate
import org.springframework.data.redis.core.ZSetOperations.TypedTuple
import org.springframework.stereotype.Service
import java.util.*
import java.util.concurrent.TimeUnit
import java.util.stream.Collectors


/**
 * @Description:
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/8/19
 */
@Service
class RedisService {
    @Resource
    lateinit var redisTemplate: RedisTemplate<String, Any>

    fun set(key: String, value: Any?, time: Long) {
        redisTemplate.opsForValue()[key, value!!, time] = TimeUnit.SECONDS
    }

    fun set(key: String, value: Any?) {
        redisTemplate.opsForValue()[key] = value!!
    }

    fun get(key: String): Any? {
        return redisTemplate.opsForValue()[key]
    }

    fun del(key: String): Boolean {
        return redisTemplate.delete(key)
    }

    fun del(keys: List<String?>?): Long {
        return redisTemplate.delete(keys!!)
    }

    fun expire(key: String, time: Long): Boolean {
        return redisTemplate.expire(key, time, TimeUnit.SECONDS)
    }

    fun getExpire(key: String): Long {
        return redisTemplate.getExpire(key, TimeUnit.SECONDS)
    }

    fun hasKey(key: String): Boolean {
        return redisTemplate.hasKey(key)
    }

    fun incr(key: String, delta: Long): Long? {
        return redisTemplate.opsForValue().increment(key, delta)
    }

    fun incrExpire(key: String, time: Long): Long? {
        val count = redisTemplate.opsForValue().increment(key, 1)
        if (count != null && count == 1L) {
            redisTemplate.expire(key, time, TimeUnit.SECONDS)
        }
        return count
    }

    fun decr(key: String, delta: Long): Long? {
        return redisTemplate.opsForValue().increment(key, -delta)
    }

    fun hGet(key: String, hashKey: String?): Any? {
        return redisTemplate.opsForHash<Any, Any>()[key, hashKey!!]
    }

    fun hSet(key: String, hashKey: String, value: Any, time: Long): Boolean {
        redisTemplate.opsForHash<Any, Any>().put(key, hashKey, value)
        return expire(key, time)
    }

    fun hSet(key: String, hashKey: String, value: Any) {
        redisTemplate.opsForHash<Any, Any>().put(key, hashKey, value)
    }

    fun hGetAll(key: String): Map<*, *> {
        return redisTemplate.opsForHash<Any, Any>().entries(key)
    }

    fun hSetAll(key: String, map: Map<String, Any>?, time: Long): Boolean {
        redisTemplate.opsForHash<Any, Any>().putAll(key, map!!)
        return expire(key, time)
    }

    fun hSetAll(key: String, map: Map<String, *>?) {
        redisTemplate.opsForHash<Any, Any>().putAll(key, map!!)
    }

    fun hDel(key: String, vararg hashKey: Any?) {
        redisTemplate.opsForHash<Any, Any>().delete(key, *hashKey)
    }

    fun hHasKey(key: String, hashKey: String?): Boolean {
        return redisTemplate.opsForHash<Any, Any>().hasKey(key, hashKey!!)
    }

    fun hIncr(key: String, hashKey: String, delta: Long?): Long {
        return redisTemplate.opsForHash<Any, Any>().increment(key, hashKey, delta!!)
    }

    fun hDecr(key: String, hashKey: String, delta: Long?): Long {
        return redisTemplate.opsForHash<Any, Any>().increment(key, hashKey, -delta!!)
    }

    fun zIncr(key: String, value: Any?, score: Double?): Double? {
        return redisTemplate.opsForZSet().incrementScore(key, value!!, score!!)
    }

    fun zDecr(key: String, value: Any?, score: Double?): Double? {
        return redisTemplate.opsForZSet().incrementScore(key, value!!, -score!!)
    }

    fun zReverseRangeWithScore(key: String, start: Long, end: Long): Map<Any, Double> {
        return redisTemplate.opsForZSet().reverseRangeWithScores(key, start, end)
            ?.stream()
            ?.collect(
                Collectors.toMap<TypedTuple<Any>, Any, Double>(
                    { it.value },
                    { it.score }
                )
            ) ?: mapOf()
    }

    fun zScore(key: String, value: Any?): Double? {
        return redisTemplate.opsForZSet().score(key, value!!)
    }

    fun zAllScore(key: String): Map<Any, Double> {
        return Objects.requireNonNull<Set<TypedTuple<Any>>>(
            redisTemplate.opsForZSet().rangeWithScores(
                key, 0, -1
            )
        )
            .stream()
            .collect(
                Collectors.toMap<TypedTuple<Any>, Any, Double>(
                    { it.value },
                    { it.score }
                )
            )
    }

    fun sMembers(key: String): Set<Any>? {
        return redisTemplate.opsForSet().members(key)
    }

    fun sAdd(key: String, vararg values: Any): Long? {
        return redisTemplate.opsForSet().add(key, *values)
    }

    fun sAddExpire(key: String, time: Long, vararg values: Any?): Long? {
        val count = redisTemplate.opsForSet().add(key, *values)
        expire(key, time)
        return count
    }

    fun sIsMember(key: String, value: Any?): Boolean? {
        return redisTemplate.opsForSet().isMember(key, value!!)
    }

    fun sSize(key: String): Long? {
        return redisTemplate.opsForSet().size(key)
    }

    fun sRemove(key: String, vararg values: Any?): Long? {
        return redisTemplate.opsForSet().remove(key, *values)
    }

    fun lRange(key: String, start: Long, end: Long): List<Any>? {
        return redisTemplate.opsForList().range(key, start, end)
    }

    fun lSize(key: String): Long? {
        return redisTemplate.opsForList().size(key)
    }

    fun lIndex(key: String, index: Long): Any? {
        return redisTemplate.opsForList().index(key, index)
    }

    fun lPush(key: String, value: Any?): Long? {
        return redisTemplate.opsForList().rightPush(key, value!!)
    }

    fun lPush(key: String, value: Any?, time: Long): Long? {
        val index = redisTemplate.opsForList().rightPush(key, value!!)
        expire(key, time)
        return index
    }

    fun lPushAll(key: String, vararg values: Any?): Long? {
        return redisTemplate.opsForList().rightPushAll(key, *values)
    }

    fun lPushAll(key: String, time: Long, vararg values: Any?): Long? {
        val count = redisTemplate.opsForList().rightPushAll(key, *values)
        expire(key, time)
        return count
    }

    fun lRemove(key: String, count: Long, value: Any?): Long? {
        return redisTemplate.opsForList().remove(key, count, value!!)
    }

    fun bitAdd(key: String, offset: Int, b: Boolean): Boolean? {
        return redisTemplate.opsForValue().setBit(key, offset.toLong(), b)
    }

    fun bitGet(key: String, offset: Int): Boolean? {
        return redisTemplate.opsForValue().getBit(key, offset.toLong())
    }

    fun bitCount(key: String): Long? {
        return redisTemplate.execute { con: RedisConnection -> con.bitCount(key.toByteArray()) }
    }

    fun bitField(key: String, limit: Int, offset: Int): List<Long> {
        return redisTemplate.execute(RedisCallback { con: RedisConnection ->
            con.bitField(
                key.toByteArray(),
                BitFieldSubCommands.create()[BitFieldSubCommands.BitFieldType.unsigned(limit)].valueAt(offset.toLong())
            )
        } as RedisCallback<List<Long>>)!!
    }

    fun bitGetAll(key: String): ByteArray? {
        return redisTemplate.execute { con: RedisConnection ->
            con[key.toByteArray()]
        }
    }

    fun hyperAdd(key: String, vararg value: Any?): Long {
        return redisTemplate.opsForHyperLogLog().add(key, *value)
    }

    fun hyperGet(vararg key: String): Long {
        return redisTemplate.opsForHyperLogLog().size(*key)
    }

    fun hyperDel(key: String) {
        redisTemplate.opsForHyperLogLog().delete(key)
    }

    fun geoAdd(key: String, x: Double?, y: Double?, name: String?): Long? {
        return redisTemplate.opsForGeo().add(key, Point(x!!, y!!), name!!)
    }

    fun geoGetPointList(key: String, vararg place: Any?): List<Point>? {
        return redisTemplate.opsForGeo().position(key, *place)
    }

    fun geoCalculationDistance(key: String, placeOne: String?, placeTow: String?): Distance? {
        return redisTemplate.opsForGeo()
            .distance(key, placeOne!!, placeTow!!, RedisGeoCommands.DistanceUnit.KILOMETERS)
    }

    fun geoNearByPlace(
        key: String,
        place: String?,
        distance: Distance?,
        limit: Long,
        sort: Sort.Direction
    ): GeoResults<RedisGeoCommands.GeoLocation<Any>>? {
        val args = GeoRadiusCommandArgs.newGeoRadiusArgs().includeDistance().includeCoordinates()
        // 判断排序方式
        if (Sort.Direction.ASC == sort) {
            args.sortAscending()
        } else {
            args.sortDescending()
        }
        args.limit(limit)
        return redisTemplate.opsForGeo()
            .radius(key, place!!, distance!!, args)
    }

    fun geoGetHash(key: String, vararg place: String?): List<String>? {
        return redisTemplate.opsForGeo()
            .hash(key, *place)
    }
}