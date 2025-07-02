<template>
    <h1>登录页面</h1>
    <button @click="login">点击登录</button>
</template>

<script setup>
import { useAuthStore } from '@/stores/index.js';
import {ref} from "vue";
import { useRouter } from 'vue-router';
let router = useRouter();
let authStore=useAuthStore();
let loginInfo=ref({
    userName:"admin",
    age:18,
    tel:"13366669"
});
let login=()=>{
    //获取用户输入的登录信息，然后传给后台,后台验证成功后才能保存登录信息
    //模拟成功
    authStore.setAuthUser(loginInfo.value);
    authStore.setAuthToken("autoh4654646");
    //跳转到后台的根目录下
    router.push("/home");
};
</script>

<style></style>