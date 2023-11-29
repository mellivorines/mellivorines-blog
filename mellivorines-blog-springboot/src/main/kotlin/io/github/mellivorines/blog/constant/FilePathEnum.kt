package io.github.mellivorines.blog.constant


/**
 * @Description:
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/9/3
 */
enum class FilePathEnum(val path: String, val desc: String) {
    AVATAR("avatar/", "头像路径"),
    ARTICLE("articles/", "文章图片路径"),
    VOICE("voice/", "音频路径"),
    PHOTO("photos/", "相册路径"),
    CONFIG("config/", "配置图片路径"),
    TALK("talks/", "配置图片路径"),
    MD("markdown/", "md文件路径");

}
