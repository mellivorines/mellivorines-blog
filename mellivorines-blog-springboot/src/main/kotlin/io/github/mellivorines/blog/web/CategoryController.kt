package io.github.mellivorines.blog.web

import io.github.mellivorines.blog.model.ResultVO
import io.github.mellivorines.blog.model.entity.Category
import io.github.mellivorines.blog.model.entity.categoryName
import io.github.mellivorines.blog.model.entity.dto.CategoryInputForSave
import io.github.mellivorines.blog.model.entity.dto.CategoryInputForUpdate
import io.github.mellivorines.blog.model.entity.fetchBy
import io.github.mellivorines.blog.model.entity.id
import io.github.mellivorines.blog.repository.CategoryRepository
import io.github.mellivorines.salamanderblog.out.ConditionVO
import io.swagger.v3.oas.annotations.Operation
import io.swagger.v3.oas.annotations.tags.Tag
import org.babyfish.jimmer.spring.repository.fetchPage
import org.babyfish.jimmer.sql.kt.ast.expression.desc
import org.babyfish.jimmer.sql.kt.ast.expression.ilike
import org.springframework.data.domain.Page
import org.springframework.web.bind.annotation.*


/**
 * @Description:分类模块
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/9/9
 */

@Tag(name = "分类模块")
@RestController
@RequestMapping("/api")
class CategoryController(
    private val categoryRepository: CategoryRepository
) {
    @Operation(summary = "获取所有分类")
    @GetMapping("/categories/all")
    fun listCategories(): ResultVO<List<Category>> {
        return ResultVO.success(categoryRepository.findAll())
    }

    @Operation(summary = "查看后台分类列表")
    @GetMapping("/admin/categories")
    fun listCategoriesAdmin(conditionVO: ConditionVO): ResultVO<Page<Category>> {
        return ResultVO.success(categoryRepository.sql.createQuery(Category::class) {
            select(table.fetchBy { allScalarFields() })
        }.fetchPage(pageSize = conditionVO.size, pageIndex = conditionVO.current))
    }

    @Operation(summary = "搜索文章分类")
    @GetMapping("/admin/categories/search")
    fun listCategoriesAdminBySearch(conditionVO: ConditionVO): ResultVO<List<Category>> {
        return ResultVO.success(categoryRepository.sql.createQuery(Category::class) {
            conditionVO.keywords?.let {
                where(table.categoryName ilike it)
            }
            orderBy(table.id.desc())
            select(table.fetchBy { allScalarFields() })
        }.execute())
    }

    @Operation(summary = "删除分类")
    @DeleteMapping("/admin/categories")
    fun deleteCategories(@RequestBody categoryIds: List<Int>): ResultVO<Any> {
        return ResultVO.success(categoryRepository.deleteByIds(categoryIds))
    }

    @Operation(summary = "添加分类")
    @PostMapping("/admin/categories/save")
    fun saveCategory(@RequestBody categoryVO: CategoryInputForSave): ResultVO<Any> {
        return ResultVO.success(categoryRepository.save(categoryVO))
    }

    @Operation(summary = "修改分类")
    @PostMapping("/admin/categories/update")
    fun updateCategory(@RequestBody categoryVO: CategoryInputForUpdate): ResultVO<Any> {
        return ResultVO.success(categoryRepository.update(categoryVO))
    }
}
