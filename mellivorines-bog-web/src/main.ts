import '@/styles/index.scss'
import 'prismjs/themes/prism.css'
import 'prismjs'
import 'element-plus/theme-chalk/index.css'
import 'mavon-editor/dist/css/index.css'
import 'normalize.css/normalize.css'

import 'virtual:svg-icons-register'
import { createApp } from "vue";
import App from "./App.vue";
import { i18n } from "@/i18n";
import {createPinia} from "pinia";
import router from "@/router";
import v3ImgPreview from 'v3-img-preview'
import lazyPlugin from 'vue3-lazy'
import infiniteScroll from 'vue3-infinite-scroll-better'
import VueClickAway from 'vue3-click-away'
import piniaPluginPersistedState from 'pinia-plugin-persistedstate'
import {registerObSkeleton} from '@/components/LoadingSkeleton'
import show from '@/assets/js/fireworks.js'
import showStar from '@/assets/js/showStar.js'
import Particles from "vue3-particles";

const pinia = createPinia()
pinia.use(piniaPluginPersistedState)
export const app = createApp(App);

app.use(i18n)
app.use(show)
app.use(showStar)
app.use(Particles)
app.use(pinia)
app.use(VueClickAway)
app.use(infiniteScroll)
app.use(v3ImgPreview,{})
app.use(lazyPlugin,{})
registerObSkeleton(app)
app.use(router)
app.use(createPinia)
app.mount('#app');
