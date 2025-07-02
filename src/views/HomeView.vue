<script setup></script>

<template>
  <main>
    <router-link to="/index" style="text-decoration: none;">客户端主页</router-link>
    <br/>
    <button @click="link">按钮跳转</button>
  </main>
</template>

<script setup>
import { useRouter } from "vue-router";
const router=useRouter();
let link=()=>{
  router.push("/index");
};
</script>