package io.github.mellivorines.blog.constant


/**
 * @Description:
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/8/28
 */
object CommonConstant {
    //JWT令牌
    const val JWT_BLACK_LIST = "jwt:blacklist:"
    const val JWT_FREQUENCY = "jwt:frequency:"

    //请求频率限制
    const val FLOW_LIMIT_COUNTER = "flow:counter:"
    const val FLOW_LIMIT_BLOCK = "flow:block:"

    //邮件验证码
    const val VERIFY_EMAIL_LIMIT = "verify:email:limit:"
    const val VERIFY_EMAIL_DATA = "verify:email:data:"

    //过滤器优先级
    const val ORDER_FLOW_LIMIT = -101
    const val ORDER_CORS = -102

    //请求自定义属性
    const val ATTR_USER_ID = "userId"

    //消息队列
    const val MQ_MAIL = "mail"

    //用户角色
    const val ROLE_DEFAULT = "user"


    const val ONE = 1
    const val ZERO = 0
    const val FALSE = 0
    const val TRUE = 1
    const val BLOGGER_ID = 1
    const val DEFAULT_CONFIG_ID = 1
    const val DEFAULT_ABOUT_ID = 1
    const val PRE_TAG = "<mark>"
    const val POST_TAG = "</mark>"
    const val CURRENT = "current"
    const val SIZE = "size"
    const val DEFAULT_SIZE = "10"
    const val DEFAULT_NICKNAME = "用户"
    const val COMPONENT = "Layout"
    const val UNKNOWN = "未知"
    const val APPLICATION_JSON = "application/json;charset=utf-8"
    const val CAPTCHA = "验证码"
    const val CHECK_REMIND = "审核提醒"
    const val COMMENT_REMIND = "评论提醒"
    const val MENTION_REMIND = "@提醒"

    //mq
    const val MAXWELL_QUEUE = "maxwell_queue"
    const val MAXWELL_EXCHANGE = "maxwell_exchange"
    const val EMAIL_QUEUE = "email_queue"
    const val EMAIL_EXCHANGE = "email_exchange"
    const val SUBSCRIBE_QUEUE = "subscribe_queue"
    const val SUBSCRIBE_EXCHANGE = "subscribe_exchange"

    //redis
    const val CODE_EXPIRE_TIME = (15 * 60).toLong()
    const val USER_CODE_KEY = "code:"
    const val BLOG_VIEWS_COUNT = "blog_views_count"
    const val ARTICLE_VIEWS_COUNT = "article_views_count"
    const val WEBSITE_CONFIG = "website_config"
    const val USER_AREA = "user_area"
    const val VISITOR_AREA = "visitor_area"
    const val ABOUT = "about"
    const val UNIQUE_VISITOR = "unique_visitor"
    const val LOGIN_USER = "login_user"
    const val ARTICLE_ACCESS = "article_access:"

    //Schedule
    const val MISFIRE_DEFAULT = 0
    const val MISFIRE_IGNORE_MISFIRES = 1
    const val MISFIRE_FIRE_AND_PROCEED = 2
    const val MISFIRE_DO_NOTHING = 3
    const val TASK_CLASS_NAME = "TASK_CLASS_NAME"
    const val TASK_PROPERTIES = "TASK_PROPERTIES"

    //SocialLogin
    const val QQ_OPEN_ID = "openid"
    const val ACCESS_TOKEN = "access_token"
    const val OAUTH_CONSUMER_KEY = "oauth_consumer_key"


    //OptType
    const val SAVE_OR_UPDATE = "新增或修改"
    const val SAVE = "新增"
    const val UPDATE = "修改"
    const val DELETE = "删除"
    const val UPLOAD = "上传"
    const val EXPORT = "导出"

    //auth
    const val TWENTY_MINUTES = 20
    const val EXPIRE_TIME:Long = 7 * 24 * 60 * 60
    const val TOKEN_HEADER = "Authorization"
    const val TOKEN_PREFIX = "Bearer "
    const val SECRET = "mellivorines"
}