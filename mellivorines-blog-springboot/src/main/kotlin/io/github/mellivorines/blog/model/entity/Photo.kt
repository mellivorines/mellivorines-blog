package io.github.mellivorines.blog.model.entity

import org.babyfish.jimmer.sql.*


/**
 * <p>
 * 照片

 * </p>
 *
 * @author lilinxi
 * @date 2023-08-17
 */
@Entity
@Table(name = "mellivorines_blog_photo")
interface Photo : BaseEntity {

    /**
     *  主键
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id: Int

    /**
     *  照片名
     */
    @Column(name = "photo_name")
    val photoName: String

    /**
     *  照片描述
     */
    @Column(name = "photo_desc")
    val photoDesc: String?

    /**
     *  照片地址
     */
    @Column(name = "photo_src")
    val photoSrc: String

    /**
     *  是否删除
     */
    @Column(name = "is_delete")
    @LogicalDeleted(value = "1", restoredValue = "0")
    val isDelete: Int

    @ManyToOne
    @JoinColumn(name = "album_id")
    val photoAlbum:PhotoAlbum?

}
