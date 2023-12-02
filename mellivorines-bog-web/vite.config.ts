import {defineConfig} from 'vite'
import vue from '@vitejs/plugin-vue'
import AutoImport from 'unplugin-auto-import/vite'
import Components from 'unplugin-vue-components/vite'
import {ElementPlusResolver} from 'unplugin-vue-components/resolvers'
import {fileURLToPath, URL} from "node:url";
import tailwindcss from "tailwindcss"
import autoprefixer from "autoprefixer"
import { createSvgIconsPlugin } from 'vite-plugin-svg-icons'
import path from 'path'
export default defineConfig({
    plugins: [
        vue(),
        AutoImport({
            imports: [
                'vue',
                'vue-router',
                'pinia',
            ],
            resolvers: [ElementPlusResolver()],
            dts: './auto-imports.d.ts',
            vueTemplate: true,
        }),
        Components({
            resolvers: [ElementPlusResolver()],
            dts: './components.d.ts',
        }),
        createSvgIconsPlugin({
            // Specify the icon folder to be cached
            iconDirs: [path.resolve(process.cwd(), 'src/icons/svg')],
            // Specify symbolId format
            symbolId: 'icon-[dir]-[name]',
        }),
    ],
    resolve: {
        // 配置别名
        alias: {
            "@": path.resolve(__dirname, "src"),
        },
    },
    css: {
        postcss: {
            plugins: [
                tailwindcss, autoprefixer
            ]
        }
    },
    server: {
        //用来配置跨域
        proxy: {
            '/api': {
                target: 'http://127.0.0.1:8080',//目标服务器地址
                changeOrigin: true,
                rewrite: (path) => path.replace(/^\/api/, '')
            },
        }
    }
})
