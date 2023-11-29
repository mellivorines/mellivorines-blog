package io.github.mellivorines.blog.utils

import io.github.mellivorines.blog.constant.CommonConstant
import io.micrometer.common.util.StringUtils
import jakarta.annotation.PostConstruct
import jakarta.servlet.http.HttpServletRequest
import org.lionsoul.ip2region.xdb.Searcher
import org.slf4j.LoggerFactory
import org.springframework.core.io.ClassPathResource
import org.springframework.util.FileCopyUtils
import java.io.InputStream
import java.net.InetAddress
import java.net.UnknownHostException


/**
 * @Description:
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/10/11
 */
open class IPUtil(private var searcher: Searcher) {

    private val logger = LoggerFactory.getLogger(IPUtil::class.java)


    /**
     * 获取客户端IP地址
     *
     * 使用Nginx等反向代理软件， 则不能通过request.getRemoteAddr()获取IP地址
     * 如果使用了多级反向代理的话，X-Forwarded-For的值并不止一个，而是一串IP地址，X-Forwarded-For中第一个非unknown的有效IP字符串，则为真实IP地址
     */
    open fun getIpAddr(request: HttpServletRequest): String? {
        var ip: String? = null
        try {
            ip = request.getHeader("x-forwarded-for")
            if (StringUtils.isEmpty(ip) || "unknown".equals(ip, ignoreCase = true)) {
                ip = request.getHeader("Proxy-Client-IP")
            }
            if (StringUtils.isEmpty(ip) || ip.isEmpty() || "unknown".equals(ip, ignoreCase = true)) {
                ip = request.getHeader("WL-Proxy-Client-IP")
            }
            if (StringUtils.isEmpty(ip) || "unknown".equals(ip, ignoreCase = true)) {
                ip = request.getHeader("HTTP_CLIENT_IP")
            }
            if (StringUtils.isEmpty(ip) || "unknown".equals(ip, ignoreCase = true)) {
                ip = request.getHeader("HTTP_X_FORWARDED_FOR")
            }
            if (StringUtils.isEmpty(ip) || "unknown".equals(ip, ignoreCase = true)) {
                ip = request.remoteAddr
                if ("127.0.0.1" == ip || "0:0:0:0:0:0:0:1" == ip) {
                    //根据网卡取本机配置的IP
                    var inet: InetAddress? = null
                    try {
                        inet = InetAddress.getLocalHost()
                    } catch (e: UnknownHostException) {
                        logger.error("getIpAddress exception:", e)
                    }
                    ip = inet!!.hostAddress
                }
            }
        } catch (e: Exception) {
            logger.error("IPUtils ERROR ", e)
        }
        return ip
    }

    /**
     * 根据ip从 ip2region.db 中获取地理位置
     *
     * @param ip
     * @return 地理位置
     */
    fun getCityInfo(ip: String): Map<String, Any> {
        //数据格式： 国家|区域|省份|城市|ISP
        //192.168.31.160 0|0|0|内网IP|内网IP
        //47.52.236.180 中国|0|香港|0|阿里云
        //220.248.12.158 中国|0|上海|上海市|联通
        //164.114.53.60 美国|0|华盛顿|0|0
        val cityInfo = HashMap<String, Any>()
        try {
            val searchIpInfo = searcher.search(ip)
            val splitIpInfo = searchIpInfo.split("\\|".toRegex()).dropLastWhile { it.isEmpty() }
                .toTypedArray()
            cityInfo["ip"] = ip
            cityInfo["searchInfo"] = searchIpInfo
            cityInfo["country"] = splitIpInfo[0]
            cityInfo["region"] = splitIpInfo[1]
            cityInfo["province"] = splitIpInfo[2]
            cityInfo["city"] = splitIpInfo[3]
            cityInfo["ISP"] = splitIpInfo[3]
        } catch (e: java.lang.Exception) {
            logger.info("failed to search($ip):$e\n")
        }
        return cityInfo
    }

    fun getIpProvince(ipSource: String): String {
        if (org.apache.commons.lang3.StringUtils.isBlank(ipSource)) {
            return CommonConstant.UNKNOWN
        }
        val strings = ipSource.split("\\|".toRegex()).dropLastWhile { it.isEmpty() }.toTypedArray()
        return if (strings.size > 1 && strings[1].endsWith("省")) {
            org.apache.commons.lang3.StringUtils.substringBefore(strings[1], "省")
        } else strings[0]
    }
//
//    fun getUserAgent(request: HttpServletRequest): UserAgent {
//        return UserAgent.parseUserAgentString(request.getHeader("User-Agent"))
//    }

    /**
     * 在服务启动时加载 ip2region.db 到内存中
     * 解决打包jar后找不到 ip2region.db 的问题
     *
     * @throws Exception 出现异常应该直接抛出终止程序启动，避免后续invoke时出现更多错误
     */
    @PostConstruct
    private fun initIp2regionResource() {
        try {
            val inputStream: InputStream = ClassPathResource("/ip/ip2region.xdb").getInputStream()
            val dbBinStr = FileCopyUtils.copyToByteArray(inputStream)
            // 创建一个完全基于内存的查询对象
            searcher = Searcher.newWithBuffer(dbBinStr)
        } catch (e: java.lang.Exception) {
            logger.info("failed to create content cached searcher: $e\n")
        }
    }
}