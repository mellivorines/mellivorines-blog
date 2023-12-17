import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [react()],
  server: {
    port:3000,
    //用来配置跨域
    proxy: {
      '/api': {
        target: 'http://127.0.0.1:8080',//目标服务器地址
        changeOrigin: true,
        rewrite: (path) => path.replace(/^\/api/, '')
      },
      '/admin': {
        target: 'http://127.0.0.1:8080',//目标服务器地址
        changeOrigin: true,
        rewrite: (path) => path.replace(/^\/admin/, '')
      },
    }
  }
})
