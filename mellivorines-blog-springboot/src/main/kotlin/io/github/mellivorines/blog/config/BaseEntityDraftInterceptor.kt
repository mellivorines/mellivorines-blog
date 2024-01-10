package io.github.mellivorines.blog.config

import io.github.mellivorines.blog.model.entity.BaseEntity
import io.github.mellivorines.blog.model.entity.BaseEntityDraft
import org.babyfish.jimmer.kt.isLoaded
import org.babyfish.jimmer.sql.DraftInterceptor
import org.springframework.stereotype.Component
import java.time.LocalDateTime


/**
 * @Description:
 *
 * @author lilinxi
 * @version 1.0.0
 * @since 2023/9/2
 */
@Component
class BaseEntityDraftInterceptor : DraftInterceptor<BaseEntity,BaseEntityDraft> {
    override fun beforeSave(draft: BaseEntityDraft, original: BaseEntity?) {
        if (original === null) {
            if (!isLoaded(draft, BaseEntity::createTime)) {
                draft.createTime = LocalDateTime.now()
            }
            if (!isLoaded(draft, BaseEntity::updateTime)) {
                draft.updateTime = LocalDateTime.now()
            }
        } else {
            if (!isLoaded(draft, BaseEntity::updateTime)) {
                draft.updateTime = LocalDateTime.now()
            }
        }
    }
}