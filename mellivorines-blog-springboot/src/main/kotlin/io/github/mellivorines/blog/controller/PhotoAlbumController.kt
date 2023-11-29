package io.github.mellivorines.blog.controller

import cn.xuyanwu.spring.file.storage.FileStorageService
import io.github.mellivorines.blog.constant.FilePathEnum
import io.github.mellivorines.blog.model.ResultVO
import io.github.mellivorines.blog.model.entity.PhotoAlbum
import io.github.mellivorines.blog.model.entity.albumName
import io.github.mellivorines.blog.model.entity.fetchBy
import io.github.mellivorines.blog.model.entity.id
import io.github.mellivorines.blog.repository.PhotoAlbumRepository
import io.github.mellivorines.salamanderblog.out.ConditionVO
import io.swagger.v3.oas.annotations.Operation
import io.swagger.v3.oas.annotations.tags.Tag
import org.babyfish.jimmer.spring.repository.fetchPage
import org.babyfish.jimmer.sql.kt.ast.expression.desc
import org.babyfish.jimmer.sql.kt.ast.expression.ilike
import org.springframework.data.domain.Page
import org.springframework.web.bind.annotation.*
import org.springframework.web.multipart.MultipartFile


/**
 * @Description:
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/9/10
 */
@Tag(name = "相册模块")
@RestController
@RequestMapping("/api")
class PhotoAlbumController(
    private val photoAlbumRepository: PhotoAlbumRepository,
    private val fileStorageService: FileStorageService
) {

    @Operation(summary = "上传相册封面")
    @PostMapping("/admin/photos/albums/upload")
    fun savePhotoAlbumCover(file: MultipartFile): ResultVO<String> {
        return ResultVO.success(fileStorageService.of(file).setPath(FilePathEnum.PHOTO.path).upload().url)
    }

    @Operation(summary = "保存相册")
    @PostMapping("/admin/photos/albums/save")
    fun savePhotoAlbum(@RequestBody photoAlbum: PhotoAlbum): ResultVO<Any> {
        return ResultVO.success(photoAlbumRepository.save(photoAlbum))
    }

    @Operation(summary = "更新相册")
    @PostMapping("/admin/photos/albums/update")
    fun updatePhotoAlbum(@RequestBody photoAlbum: PhotoAlbum): ResultVO<Any> {
        return ResultVO.success(photoAlbumRepository.update(photoAlbum))
    }

    @Operation(summary = "查看后台相册列表")
    @GetMapping("/admin/photos/albums")
    fun listPhotoAlbumBacks(conditionVO: ConditionVO): ResultVO<Page<PhotoAlbum>> {
        return ResultVO.success(photoAlbumRepository.sql.createQuery(PhotoAlbum::class) {
            conditionVO.keywords?.let {
                where(table.albumName ilike it)
            }
            orderBy(table.id.desc())
            select(table.fetchBy { allScalarFields() })
        }.fetchPage(pageIndex = conditionVO.current, pageSize = conditionVO.size))
    }

    @Operation(summary = "获取后台相册列表信息")
    @GetMapping("/admin/photos/albums/info")
    fun listPhotoAlbumBackInfos(): ResultVO<List<PhotoAlbum>> {
        return ResultVO.success(photoAlbumRepository.findAll())
    }

    @Operation(summary = "根据id获取后台相册信息")
    @GetMapping("/admin/photos/albums/{albumId}/info")
    fun getPhotoAlbumBackById(@PathVariable("albumId") albumId: Int): ResultVO<PhotoAlbum> {
        return ResultVO.success(photoAlbumRepository.findById(albumId).get())
    }

    @Operation(summary = "根据id删除相册")
    @DeleteMapping("/admin/photos/albums/{albumId}")
    fun deletePhotoAlbumById(@PathVariable("albumId") albumId: Int): ResultVO<Any> {
        return ResultVO.success(photoAlbumRepository.deleteById(albumId))
    }

    @Operation(summary = "获取相册列表")
    @GetMapping("/photos/albums")
    fun listPhotoAlbums(): ResultVO<List<PhotoAlbum>> {
        return ResultVO.success(photoAlbumRepository.findAll())
    }
}

