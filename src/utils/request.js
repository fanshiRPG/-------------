import axios from "axios";
import { ElMessage } from "element-plus";
import { getToken } from './common.js'
// 创建axios实例
const instance = axios.create({
  baseURL: import.meta.env.VITE_BASE_API, // 设置默认的 API 地址，url = baseURL + url（使用proxy代理时此处可不写）
  timeout: 5000, // 设置请求超时时间
  headers: { "Content-Type": "application/x-www-form-urlencoded" }, // 设置请求header，可以自定义属性
});

// 请求拦截器
instance.interceptors.request.use(
  // 请求配置（全局），在请求headers中添加token
  (config) => {
    const token = getToken();
    if (token) {
      config.headers.token = token;
    }
    return config;
  },
  // 请求错误
  (error) => {
    return Promise.reject(error);
  }
);
// 响应拦截器
instance.interceptors.response.use(
  (response) => {
    const { status, data } = response;
    if (status === 200) {
      const { code, msg } = data;
      // 根据后端返回的自定义状态码 code 进行错误信息提示（根据具体需求确定是否需要书写）
      if (code == 200) {
        return data;
      } else {
        ElMessage({
          message: msg,
          type: "error",
        });
        return Promise.reject(data);
      }
    }
  },
  (error) => {
    ElMessage({
      message: "请求已发送，未收到响应信息！",
      type: "error",
    });
    // 若简写，上面代码可省略，只写此一行
    return Promise.reject(error);
  }
);

export default instance;
