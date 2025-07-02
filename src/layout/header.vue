<template>
  <div class="icon">
    <el-icon v-if="show" @click="change">
      <Fold />
    </el-icon>
    <el-icon v-else @click="change">
      <Expand />
    </el-icon>
  </div>

  <div class="tabs">
    <el-tag
      v-for="(tab, index) in tabs"
      :key="index"
      closable
      @close="handleCloseTab(index)"
      @click="handleTabClick(tab)"
      class="custom-tab"
    >
      {{ tab.title }}
    </el-tag>
  </div>
  <div class="right">
    <el-icon>
      <Message />
    </el-icon>
    <el-avatar :size="30" :src="circleUrl" />
    <el-dropdown>
      <span class="el-dropdown-link">
        设置
        <el-icon class="el-icon--right">
          <arrow-down />
        </el-icon>
      </span>
      <template #dropdown>
        <el-dropdown-menu>
          <el-dropdown-item @click="goToSettings">设置账号</el-dropdown-item>
          <el-dropdown-item>更改头像</el-dropdown-item>
          <el-dropdown-item @click="exit">退出登录</el-dropdown-item>
        </el-dropdown-menu>
      </template>
    </el-dropdown>
  </div>

  
</template>

<script setup lang="ts">
import { ref, reactive, toRefs, computed } from "vue";
import { useRouter } from "vue-router";

const router = useRouter();
const current = computed(() => {
  return router.currentRoute.value;
});
const show = ref(true);
const change = function () {
  show.value = !show.value;
};

const state = reactive({
  circleUrl: "https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png",
  tabs: [] // 初始化tabs数组
});

const { circleUrl, tabs } = toRefs(state);

interface Tab {
  title: string;
  path: string;
}

const emit = defineEmits(['remove-tab', 'add-tab']); // 增加add-tab事件

const handleCloseTab = (index) => {
  emit('remove-tab', index);
};

const handleTabClick = (tab) => {
  router.push(tab.path); 
};

// 用于侧边栏点击时添加新选项卡
const addTab = (tab: Tab) => {
  const exists = tabs.value.find(t => t.path === tab.path);
  if (!exists) {
    tabs.value.push(tab);
    emit('add-tab', tab);
  }
};

const exit = function () {
  router.push("/index1");
};

const goToSettings = function () {
  router.push("/settings");
};
</script>

<style scoped>
.title {
  width: 100px;
  margin: -22px 0px 0 28px;
}

.icon {
  margin-top: 15px;
}

.input-container {
  margin: 10px 0;
}

.input-container input {
  width: 100%;
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 4px;
}

.right {
  display: flex;
  padding-right: 10px;
  width: 110px;
  justify-content: space-between;
  align-items: center;
  float: right;
  margin-top: -32px;
}

.tabs {
  display: flex;
  gap: 10px;
  margin-left: 20px;
  padding: 10px;
  background-color: #f5f7fa;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.custom-tab {
  cursor: pointer;
  transition: background-color 0.3s ease;
}

.custom-tab:hover {
  background-color: #409eff;
  color: #fff;
}
</style>
