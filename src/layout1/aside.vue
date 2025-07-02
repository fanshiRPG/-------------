<template>
  <!-- 菜单 -->

  <el-menu
    active-text-color="#ffd04b"
    background-color="#545c64"
    class="el-menu-vertical-demo"
    default-active="2"
    text-color="#fff"
    @open="handleOpen"
    @close="handleClose"
    router
  >
    <div class="title">普通用户系统</div>
    <template v-for="(menu, index) in menus" :key="index">
      <!-- 两层 -->
      <el-sub-menu v-if="menu.children" :index="menu.path">
        <template #title>
          <el-icon><component :is="menu.meta.icon"></component></el-icon>
          <span>{{ menu.meta.title }}</span>
        </template>
        <template v-for="(menu2, index2) in menu.children" :key="index2">
          <el-menu-item :index="menu.path + '/' + menu2.path">
            <el-icon><component :is="menu2.meta.icon"></component> </el-icon>
            <template #title>
              <span>{{ menu2.meta.title }}</span>
            </template>
          </el-menu-item>
        </template>
      </el-sub-menu>
      <!-- 两层结束 -->
      <!-- 只有一层 -->
      <el-menu-item v-else :index="menu.path">
        <el-icon> <component :is="menu.meta.icon"></component> </el-icon>
        <span>{{ menu.meta.title }}</span>
      </el-menu-item>
      <!-- 只有一层 -->
    </template>
  </el-menu>
  <!-- -->
</template>

<script lang="ts" setup>
  import { ref, computed, reactive } from "vue";
  const isCollapse = ref(true);

  import { useRouter } from "vue-router";
  const router = useRouter();
  const menus = computed(() => {
    let menu = router.options.routes.filter((item) => item.children);
    return menu[1].children;
  });

  const handleOpen = (key: string, keyPath: string[]) => {
    console.log(key, keyPath);
  };
  const handleClose = (key: string, keyPath: string[]) => {
    console.log(key, keyPath);
  };
</script>

<style>
  .el-menu-vertical-demo:not(.el-menu--collapse) {
    width: 200px;
    height: 90vh;
  }
  .title {
    font-size: 18px;
    display: flex;
    justify-content: center;
    top: 5px;
    margin-top: 15px;
  }
</style>
