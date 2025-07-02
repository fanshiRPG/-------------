<template>
  <div style="height: 1000px;background-image: url('/src/assets/imgs/登录文雅图片.jpeg');">
    <el-card style="max-width: 600px; margin: auto; border-radius: 10px; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);" class="login-card">
      <template #header>
        <div class="card-header" style="text-align: center; padding: 20px; font-size: 2em; color: #409EFF;">
          <span>用户登录</span>
        </div>
      </template>
      <el-form :model="loginForm" label-width="auto" style="max-width: 600px; padding: 20px;">
        <el-form-item label="登录名" style="font-size: 1.2em;">
          <el-input v-model="loginForm.loginName" placeholder="请输入登录名" style="border-radius: 5px; font-size: 1.2em;" />
        </el-form-item>
        <el-form-item label="密码" style="font-size: 1.2em;">
          <el-input v-model="loginForm.password" type="password" placeholder="请输入密码" style="border-radius: 5px; font-size: 1.2em;" />
        </el-form-item>
      </el-form>
      <template #footer>
        <div style="text-align: center; padding: 20px;">
          <el-button type="primary" @click="onSubmit" style="width: 100%; border-radius: 5px; font-size: 1.2em;">立即登录</el-button>
          <el-link type="primary" href="/regist" style="display: block; margin-top: 10px; text-align: center; font-size: 1.2em;">没有用户，点击注册</el-link>
        </div>
      </template>
    </el-card>
  </div>
</template>

<script setup>
import { ref } from "vue";
import { authlogin } from "@/utils/api.js";
import { useAuthStore } from "@/stores/index.js";
import { useRouter } from "vue-router";


const router = useRouter();
const userStore = useAuthStore();

let loginForm = ref({
  loginName: "",
  password: "",
  type: "",
});

let onSubmit = () => {
  // 调用后端的网络登录接口
  authlogin(loginForm.value).then((res) => {
    console.log("登录成功");
    console.log(res);

    // 将认证信息存储到 Pinia 中
    userStore.setAuthUser(res.data.user);
    userStore.setAuthToken(res.data.token);
    userStore.setAuthInfo({ type: res.data.user.type });

    // 更新 loginForm 中的 type 信息
    loginForm.value.type = res.data.user.type; // 从返回的用户数据中获取 type

    // 根据 type 进行页面跳转
    const targetRoute = loginForm.value.type === 'admin' ? "/index2" : "/index3";
    console.log("准备跳转到:", targetRoute); // 打印目标路由
     // 仅在确定登录成功后进行跳转
     router.push(targetRoute).catch(err => {
      console.error("跳转错误:", err);
    });
  }).catch((err) => {
    console.error("登录失败", err);
  });
};
</script>

<style scoped>
.login-card {
  margin: 10px auto;
}
.card-header {
  text-align: center;
}
</style>
