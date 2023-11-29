package io.github.mellivorines.blog.model.dto


/**
 * @Description:
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/10/14
 */
data class WebsiteConfigDTO(
    var name: String? = "mellivorines",
    
    var englishName: String,
    
    var author: String,


    var authorAvatar: String,


    var authorIntro: String,


    var logo: String,


    var multiLanguage: Int,


    var notice: String,


    var websiteCreateTime: String,


    var beianNumber: String,


    var qqLogin: Int,


    var github: String,


    var gitee: String,


    var qq: String,


    var weChat: String,


    var weibo: String,


    var csdn: String,


    var zhihu: String,


    var juejin: String,


    var twitter: String,


    var stackoverflow: String,


    var touristAvatar: String,


    var userAvatar: String,


    var isCommentReview: Int,


    var isEmailNotice: Int,


    var isReward: Int,


    var weiXinQRCode: String,


    var alipayQRCode: String? = null
)
