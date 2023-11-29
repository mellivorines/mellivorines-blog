package io.github.mellivorines.blog.model.entity

import org.babyfish.jimmer.sql.*


/**
 * <p>
 * 相册

 * </p>
 *
 * @author lilinxi
 * @date 2023-08-17
 */
@Entity
@Table(name = "mellivorines_blog_photo_album")
interface PhotoAlbum : BaseEntity {

    /**
     *  主键
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Int

    /**
     *  相册名
     */
    @Column(name = "album_name")
    val albumName: String

    /**
     *  相册描述
     */
    @Column(name = "album_desc")
    val albumDesc: String

    /**
     *  相册封面
     */
    @Column(name = "album_cover")
    val albumCover: String

    /**
     *  是否删除
     */
    @Column(name = "is_delete")
    val isDelete: Int

    /**
     *  状态值 1公开 2私密
     */
    val status: Int

    @OneToMany(mappedBy = "photoAlbum")
    val photos:List<Photo>
}
