<template>
    <div class="settings-container">
      <el-card class="settings-card" style="max-width: 600px; margin: auto;">
        <template #header>
          <div style="text-align: center; font-size: 2em;">设置账号</div>
        </template>
        
        <el-form :model="userInfo" label-width="auto" style="padding: 20px;">
          <el-form-item label="登录名">
            <el-input v-model="userInfo.loginName" placeholder="请输入登录名" />
          </el-form-item>
          
          <el-form-item label="姓名">
            <el-input v-model="userInfo.userName" placeholder="请输入姓名" />
          </el-form-item>
  
          <el-form-item label="年龄">
            <el-input v-model="userInfo.age" type="number" placeholder="请输入年龄" />
          </el-form-item>
  
          <el-form-item label="联系方式">
            <el-input v-model="userInfo.tel" placeholder="请输入联系方式" />
          </el-form-item>
  
          <el-form-item>
            <el-button type="primary" @click="updateUserInfo">保存</el-button>
          </el-form-item>
        </el-form>
      </el-card>
    </div>
  </template>
  
  <script setup lang="ts">
import { ref } from 'vue';
  import { useRouter } from 'vue-router';
  
  const router = useRouter();
  
  // 假设从 API 获取到用户信息
  const userInfo = ref({
    loginName: '',
    userName: '',
    age: null,
    tel: ''
  });
  
  // 模拟 API 请求以存储用户信息
  const updateUserInfo = () => {
    // 在这里调用 API 更新用户信息
    console.log("用户信息被更新：", userInfo.value);
    // 返回上一页或某个路径
    router.push('/home');
  };
  </script>
  
  <style scoped>
  .settings-container {
    padding: 20px;
  }
  .settings-card {
    margin: 20px;
  }
  </style>
  