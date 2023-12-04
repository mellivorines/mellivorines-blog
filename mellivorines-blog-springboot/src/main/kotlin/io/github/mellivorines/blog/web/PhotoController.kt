package io.github.mellivorines.blog.web

import cn.xuyanwu.spring.file.storage.FileStorageService
import io.github.mellivorines.blog.constant.FilePathEnum
import io.github.mellivorines.blog.model.ResultVO
import io.github.mellivorines.blog.model.entity.*
import io.github.mellivorines.blog.model.entity.dto.PhotoAlbumView
import io.github.mellivorines.blog.repository.PhotoAlbumRepository
import io.github.mellivorines.blog.repository.PhotoRepository
import io.github.mellivorines.salamanderblog.out.ConditionVO
import io.swagger.v3.oas.annotations.Operation
import io.swagger.v3.oas.annotations.tags.Tag
import org.babyfish.jimmer.spring.repository.fetchPage
import org.babyfish.jimmer.sql.kt.ast.expression.desc
import org.babyfish.jimmer.sql.kt.ast.expression.eq
import org.babyfish.jimmer.sql.kt.ast.expression.ilike
import org.springframework.data.domain.Page
import org.springframework.web.bind.annotation.*
import org.springframework.web.multipart.MultipartFile


/**
 * @Description:照片模块
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/9/10
 */

@Tag(name = "照片模块")
@RestController
@RequestMapping("/api")
class PhotoController(
    private val photoRepository: PhotoRepository,
    private val photoAlbumRepository: PhotoAlbumRepository,
    private val fileStorageService: FileStorageService
) {

    @Operation(summary = "上传照片")
    @PostMapping("/admin/photos/upload")
    fun savePhotoAlbumCover(file: MultipartFile): ResultVO<String> {
        return ResultVO.success(fileStorageService.of(file).setPath(FilePathEnum.PHOTO.path).upload().url)
    }

    @Operation(summary = "根据相册id获取照片列表")
    @GetMapping("/admin/photos")
    fun listPhotos(conditionVO: ConditionVO): ResultVO<Page<Photo>> {
        return ResultVO.success(photoRepository.sql.createQuery(Photo::class) {
            conditionVO.keywords?.let {
                where(table.photoName ilike it)
            }
            orderBy(table.id.desc())
            select(
                table.fetchBy {
                    allScalarFields()
                    photoAlbum { allScalarFields() }
                }
            )
        }.fetchPage(pageIndex = conditionVO.current, pageSize = conditionVO.size))
    }

    @Operation(summary = "更新照片信息")
    @PutMapping("/admin/photos")
    fun updatePhoto(@RequestBody photoInfo: Photo): ResultVO<Any> {
        return ResultVO.success(photoRepository.update(photoInfo))
    }

    @Operation(summary = "保存照片")
    @PostMapping("/admin/photos")
    fun savePhotos(@RequestBody photo: Photo): ResultVO<Any> {
        return ResultVO.success(photoRepository.save(photo))
    }

//    @Operation(summary = "移动照片相册")
//    @PutMapping("/admin/photos/album")
//    fun updatePhotosAlbum(@RequestBody photoVO: @Valid PhotoVO?): ResultVO<*> {
//        photoService.updatePhotosAlbum(photoVO)
//        return ResultVO.ok()
//    }

//    @OptLog(optType = UPDATE)
//    @ApiOperation(value = "更新照片删除状态")
//    @PutMapping("/admin/photos/delete")
//    fun updatePhotoDelete(@RequestBody deleteVO: @Valid DeleteVO?): ResultVO<*> {
//        photoService.updatePhotoDelete(deleteVO)
//        return ResultVO.ok()
//    }

    @Operation(summary = "删除照片")
    @DeleteMapping("/admin/photos")
    fun deletePhotos(@RequestBody photoIds: List<Int>): ResultVO<Any> {
        //逻辑删除
        return ResultVO.success(photoRepository.deleteByIds(photoIds))
    }

    @Operation(summary = "根据相册id查看照片列表")
    @GetMapping("/albums/{albumId}/photos")
    fun listPhotosByAlbumId(
        @PathVariable("albumId") albumId: Int,
    ): ResultVO<PhotoAlbumView> {
        return ResultVO.success(
            photoAlbumRepository.sql.createQuery(PhotoAlbum::class) {
                where(table.id eq albumId)
                select(table.fetch(PhotoAlbumView::class))
            }.fetchOneOrNull()
        )
    }
}
