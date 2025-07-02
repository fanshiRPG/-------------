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
    @select="handleMenuSelect"
    router
  >

    <div class="title">管理员管理系统</div>
    <div class="search-container">
      <input 
        type="text" 
        placeholder="搜索菜单..." 
        v-model="searchTerm" 
        @input="filterMenus" 
      />
    </div>

    <template v-for="(menu, index) in filteredMenus" :key="index">
      <!-- 两层 -->
      <el-sub-menu v-if="menu.children" :index="menu.path">
        <template #title>
          <el-icon><component :is="menu.meta.icon"></component></el-icon>
          <span>{{ menu.meta.title }}</span>
        </template>
        <template v-for="(menu2, index2) in menu.children" :key="index2">
          <el-menu-item v-if="matchesSearch(menu2)" :index="menu.path + '/' + menu2.path">
            <el-icon><component :is="menu2.meta.icon"></component> </el-icon>
            <template #title>
              <span>{{ menu2.meta.title }}</span>
            </template>
          </el-menu-item>
        </template>
      </el-sub-menu>
      <!-- 两层结束 -->
      <!-- 只有一层 -->
      <el-menu-item v-else v-if="matchesSearch(menu)" :index="menu.path">
        <el-icon> <component :is="menu.meta.icon"></component> </el-icon>
        <span>{{ menu.meta.title }}</span>
      </el-menu-item>
      <!-- 只有一层 -->
       
    </template>
  </el-menu>
  <!-- -->
</template>

<script lang="ts" setup>
import { ref, computed } from "vue";
import { useRouter } from "vue-router";

const searchTerm = ref('');
const router = useRouter();

const menus = computed(() => {
  let menu = router.options.routes.filter((item) => item.children);
  return menu[0].children;
});

const filteredMenus = computed(() => {
  return menus.value.filter(menu => {
    return matchesSearch(menu) || (menu.children && menu.children.some(child => matchesSearch(child)));
  });
});

const matchesSearch = (menu) => {
  const title = menu.meta.title.toLowerCase();
  return title.includes(searchTerm.value.toLowerCase());
};

const handleOpen = (key: string, keyPath: string[]) => {
  console.log(key, keyPath);
};

const handleClose = (key: string, keyPath: string[]) => {
  console.log(key, keyPath);
};

const handleMenuSelect = (index) => {
  const menuItem = router.options.routes.find(route => route.path === index);
  if (menuItem) {
    emit("add-tab", { title: menuItem.meta.title, path: menuItem.path });
  }
};
</script>

<style scoped>
.common-layout {
  background-color: #f0f2f5; /* 浅色背景 */
  height: 1000px;
}

.el-header {
  background-color: #283e4a; /* 深色头部 */
  color: #fff;
  padding: 10px 20px; /* 增加内边距 */
}

.el-breadcrumb {
  margin: 15px 0;
  font-size: 14px;
}

.icon {
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.right {
  display: flex;
  align-items: center;
  gap: 10px; /* 增加元素之间的间隔 */
}

.el-dropdown-link {
  cursor: pointer;
  color: #ffd04b; /* 设计为主题色 */
  display: flex;
  align-items: center;
}

.title {
  font-size: 20px; /* 增加标题字体大小 */
  text-align: center;
  margin: 15px 0;
  color: #fff; /* 颜色与头部保持一致 */
}

.el-menu-vertical-demo {
  border-right: 1px solid #ddd; /* 为菜单添加右边框 */
}

/* 美化菜单项 */
.el-menu-item,
.el-sub-menu {
  transition: background-color 0.3s;
}

.el-menu-item:hover, 
.el-sub-menu:hover {
  background-color: rgba(255, 208, 75, 0.1); /* 鼠标悬停时改变背景颜色 */
}

.search-container {
  padding: 10px;
}

.search-container input {
  width: calc(100% - 20px); /* 调整宽度，留出一些内边距 */
  padding: 10px; /* 增加内边距 */
  border: 1px solid #ccc;
  border-radius: 4px;
  background-color: #fff;
  color: #333;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* 添加阴影效果 */
}
</style>
