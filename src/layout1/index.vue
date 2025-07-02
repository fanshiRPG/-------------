<template>
  <div class="common-layout">
    <el-container>
      <el-aside width="200px">
        <Aside />
      </el-aside>
      <el-container>
        <el-header>
          <Header />
        </el-header>
        <el-main>
          <router-view />
        </el-main>
      </el-container>
    </el-container>
  </div>
</template>

<script setup>
import Aside from "./aside.vue"; // 引入普通用户侧边栏
import Header from "./header.vue"; // 头部保持不变
</script>

<style scoped>
/* 可根据需要添加样式 */
.common-layout {
  height: 100vh;
}
</style>
