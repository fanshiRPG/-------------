<template>
    <div class="common-layout">
      <el-container>
        <el-aside width="200px">
          <Aside  @add-tab="handleAddTab"/>
        </el-aside>
        <el-container>
          <el-header>
            <Header :tabs="tabs" @remove-tab="handleRemoveTab" />
          </el-header>
          <el-main>
            <router-view></router-view>
          </el-main>
        </el-container>
      </el-container>
    </div>
  </template>
  
  <script setup>
    import Aside from "./aside.vue";
    import Header from "./header.vue";
    import { ref } from "vue";
    const tabs = ref([]);

const handleAddTab = (tab) => {
  if (!tabs.value.some(t => t.path === tab.path)) {
    tabs.value.push(tab);
  }
};

const handleRemoveTab = (index) => {
  tabs.value.splice(index, 1);
};
  </script>
  
  <style scoped></style>
  