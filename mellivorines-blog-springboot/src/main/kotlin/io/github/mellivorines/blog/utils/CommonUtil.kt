package io.github.mellivorines.blog.utils

import java.util.*
import java.util.regex.Pattern


/**
 * @Description:
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/8/19
 */


object CommonUtil {
    fun checkEmail(username: String): Boolean {
        val rule = "^\\w+((-\\w+)|(\\.\\w+))*\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z0-9]+$"
        //正则表达式的模式 编译正则表达式
        val p = Pattern.compile(rule)
        //正则表达式的匹配器
        val m = p.matcher(username)
        //进行正则匹配
        return m.matches()
    }

    fun getBracketsContent(str: String): String {
        return str.substring(str.indexOf("(") + 1, str.indexOf(")"))
    }

    fun getRandomCode(): String {
        val str = StringBuilder()
        val random = Random()
        for (i in 0..5) {
            str.append(random.nextInt(10))
        }
        return str.toString()
    }

    fun <T> castList(obj: Any?, clazz: Class<T>): List<T> {
        val result: MutableList<T> = ArrayList()
        if (obj is List<*>) {
            for (o in obj) {
                result.add(clazz.cast(o))
            }
            return result
        }
        return result
    }

    fun <T> castSet(obj: Any?, clazz: Class<T>): Set<T> {
        val result: MutableSet<T> = HashSet()
        if (obj is Set<*>) {
            for (o in obj) {
                result.add(clazz.cast(o))
            }
            return result
        }
        return result
    }
}

