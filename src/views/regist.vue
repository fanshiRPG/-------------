<template>
  <div style="height: 1000px;background-image: url('/src/assets/imgs/注册文雅图片.jpeg');">
  <el-card style="max-width: 600px; margin: auto; border-radius: 10px; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);" class="login-card">
    <template #header>
      <div class="card-header" style="text-align: center; padding: 20px; font-size: 2em; color: #409EFF;">
        <span>用户注册</span>
      </div>
 
    </template>
    <!-- 表单-START -->
    <el-form :model="regForm" label-width="auto" style="max-width: 600px; padding: 20px;">
      <el-form-item label="登录名" style="font-size: 1.2em;">
        <el-input v-model="regForm.loginName" placeholder="请输入登录名" style="border-radius: 5px; font-size: 1.2em;" />
      </el-form-item>
      <el-form-item label="姓名" style="font-size: 1.2em;">
        <el-input v-model="regForm.userName" placeholder="请输入姓名" style="border-radius: 5px; font-size: 1.2em;" />
      </el-form-item>
      <el-form-item label="密码" style="font-size: 1.2em;">
        <el-input v-model="regForm.password" type="password" placeholder="请输入密码" style="border-radius: 5px; font-size: 1.2em;" />
      </el-form-item>
      <el-form-item label="再次输入密码" style="font-size: 1.2em;">
        <el-input v-model="regForm.password2" type="password" placeholder="请再次输入密码" style="border-radius: 5px; font-size: 1.2em;" />
      </el-form-item>
      <el-form-item label="年龄" style="font-size: 1.2em;">
        <el-input v-model="regForm.age" type="number" placeholder="请输入年龄" style="border-radius: 5px; font-size: 1.2em;" />
      </el-form-item>
      <el-form-item label="联系方式" style="font-size: 1.2em;">
        <el-input v-model="regForm.tel" type="text" placeholder="请输入联系方式" style="border-radius: 5px; font-size: 1.2em;" />
      </el-form-item>
      <el-form-item label="性别" style="font-size: 1.2em;">
        <el-radio-group v-model="regForm.gender">
          <el-radio value="M">男</el-radio>
          <el-radio value="F">女</el-radio>
        </el-radio-group>
      </el-form-item>
      <el-form-item label="用户类型" style="font-size: 1.2em;">
        <el-select v-model="regForm.type" placeholder="请选择用户类型" style="font-size: 1.2em;">
          <el-option label="管理员" value="admin" />
          <el-option label="普通用户" value="user" />
        </el-select>
      </el-form-item>
      <el-form-item label="备注" style="font-size: 1.2em;">
        <el-input v-model="regForm.remark" type="text" placeholder="请输入备注" style="border-radius: 5px; font-size: 1.2em;" />
      </el-form-item>
    </el-form>
    <!-- 表单-END -->
    <template #footer>
      <div style="text-align: center; padding: 20px;">
        <el-button type="primary" @click="onSubmit" style="width: 100%; border-radius: 5px; font-size: 1.2em;">立即注册</el-button>
        <el-link type="primary" href="/login" style="display: block; margin-top: 10px; text-align: center; font-size: 1.2em;">已有用户，返回登录</el-link>
      </div>
    </template>
  </el-card>
</div>
</template>

<script setup>
import {ref} from "vue";
import { registUserApi } from "@/utils/api.js";
import { ElMessage} from 'element-plus'

let regForm=ref({
    loginName:"",
    password:"",
    age:null
});
let onSubmit=()=>{
  //验证一下信息是否正确，如再次输入密码是否匹配
  registUserApi(regForm.value).then((res)=>{
    alert("");
    ElMessage({
        type: '注册成功，请求登录',
        message: 'success',
      });
  }).catch((err)=>{});
};
</script>

<style scoped>
.login-card{
    margin:10px auto;
}
.card-header{
    text-align: center;
}
</style>