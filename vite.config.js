import { fileURLToPath, URL } from 'node:url'

import { defineConfig, loadEnv } from 'vite'
import vue from '@vitejs/plugin-vue'

export default defineConfig(({ mode, command }) => {
  const env = loadEnv(mode, process.cwd());//获取当前环境下的.env配置文件
  return {
    plugins: [
      vue(),
    ],
    resolve: {
      alias: {
        '@': fileURLToPath(new URL('./src', import.meta.url))
      }
    },
    server: {
      proxy: {
        '/pubfile': { //获取请求中带有 /pubfile 的请求，这里主要处理图片的回显
          target: env.VITE_BASE_API, //后台服务器的地址
          changeOrigin: true, //修改源，处理跨域问题
          rewrite: (path) => path.replace(RegExp(`^pubfile`), 'pubfile')  //保留/pubfile
        }
      }
    }
  }
})

