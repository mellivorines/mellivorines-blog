package io.github.mellivorines.blog.service

import io.github.mellivorines.blog.model.entity.Menu
import io.github.mellivorines.blog.model.entity.dto.*
import io.github.mellivorines.blog.model.entity.name
import io.github.mellivorines.blog.repository.MenuRepository
import io.github.mellivorines.blog.utils.UserUtil
import io.github.mellivorines.salamanderblog.out.ConditionVO
import org.babyfish.jimmer.sql.kt.ast.expression.ilike
import org.springframework.stereotype.Service


/**
 * @Description:
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/9/9
 */
@Service
class MenuService(
    private val menuRepository: MenuRepository,
    private val userUtil: UserUtil
) {
    fun listMenus(conditionVO: ConditionVO): List<MenuDTO>? = menuRepository.sql.createQuery(Menu::class) {
        conditionVO.keywords?.let {
            where(table.name ilike it)
        }
        select(table.fetch(MenuDTO::class))
    }.execute()

    fun listMenuOptions(): List<MenuAdminDTO>? = menuRepository.sql.createQuery(Menu::class) {
        select(table.fetch(MenuAdminDTO::class))
    }.execute()

    fun listUserMenus(): List<UserMenuDTO>? = menuRepository.sql.createQuery(Menu::class) {
            select(table.fetch(UserMenuDTO::class))
        }.execute()


    fun deleteMenu(menuId: Int): Any = menuRepository.deleteById(menuId)

    fun updateMenuIsHidden(hiddenInput: MenuIsHiddenInput): Any {
        return menuRepository.update(hiddenInput)
    }

    fun saveMenu(menuInputForSave: MenuInputForSave): Any = menuRepository.save(menuInputForSave)


    fun updateMenu(menuInputForUpdate: MenuInputForUpdate): Any = menuRepository.update(menuInputForUpdate)

}