<template>
  <div class="icon">
    <el-dropdown>
      <span class="el-dropdown-link">
        设置
        <el-icon class="el-icon--right">
          <arrow-down />
        </el-icon>
      </span>
      <template #dropdown>
        <el-dropdown-menu>
          <el-dropdown-item>查看账户信息</el-dropdown-item>
          <el-dropdown-item @click="exit">退出登录</el-dropdown-item>
        </el-dropdown-menu>
      </template>
    </el-dropdown>
  </div>
</template>

<script setup>
import { ref } from "vue";
import { useRouter } from "vue-router";

const router = useRouter();

const exit = function () {
  // 实现退出逻辑，例如清除用户状态并跳转
  router.push("/index1");
};
</script>

<style scoped>
.icon {
  float: right;
}
</style>
