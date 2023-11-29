package io.github.mellivorines.blog.constant


/**
 * @Description:
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/8/18
 */
data class StatusCodeEnum(val code:Int,val desc:String){

    companion object {
        val SUCCESS = StatusCodeEnum(20000, "操作成功")
        val NO_LOGIN = StatusCodeEnum(40001, "用户未登录")
        val AUTHORIZED = StatusCodeEnum(40300, "没有操作权限")
        val SYSTEM_ERROR = StatusCodeEnum(50000, "系统异常")
        val FAIL = StatusCodeEnum(51000, "操作失败")
        val VALID_ERROR = StatusCodeEnum(52000, "参数格式不正确")
        val USERNAME_EXIST = StatusCodeEnum(52001, "用户名已存在")
        val USERNAME_NOT_EXIST = StatusCodeEnum(52002, "用户名不存在")
        val ARTICLE_ACCESS_FAIL = StatusCodeEnum(52003, "文章密码认证未通过")
        val QQ_LOGIN_ERROR = StatusCodeEnum(53001, "qq登录错误")
    }
}
