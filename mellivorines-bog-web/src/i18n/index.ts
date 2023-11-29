import {createI18n} from "vue-i18n";
import CN from "./lang/cn";
import EN from "./lang/en";
import cookies from "js-cookie";


// 定义语言国际化内容 zh-cn en
const messages = {
    cn: {
        ...CN,
    },
    en: {
        ...EN,
    },
};

export const i18n = createI18n({
    legacy: false,
    // 采用全局参数配置初始化语言 项目中有`zh-cn`、`en`两种
    locale: cookies["locale"] ? String(cookies["locale"]) : 'cn',
    fallbackLocale: cookies["locale"] ? String(cookies["locale"]) : 'cn',
    messages: messages,
});
