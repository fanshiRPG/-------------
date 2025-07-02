<template>
  <el-container style="height: 100%; background-color: #f1f1f3;">
    <el-main>
      <div style="text-align: center; padding: 20px;">
        <h1 style="font-size: 50px; margin-bottom: 20px;">{{ '欢迎你！' + displayName }}</h1>
        <el-descriptions title="个人中心" :column="2" size="40" border>
          <el-descriptions-item>
            <template #label>
              <i class="el-icon-s-custom"></i>
              账号
            </template>
            {{ authInfo.id }}
          </el-descriptions-item>
          <el-descriptions-item>
            <template #label>
              <i class="el-icon-mobile-phone"></i>
              电话
            </template>
            {{ authInfo.tel || "未提供" }}
          </el-descriptions-item>
          <el-descriptions-item>
            <template #label>
              <i class="el-icon-location-outline"></i>
              性别
            </template>
            <el-tag
              :type="authInfo.gender === 'M' ? 'primary' : 'danger'"
              disable-transitions
            >
              <i :class="authInfo.gender == 'M' ? 'el-icon-male' : 'el-icon-female'"></i>
              {{ authInfo.gender == 'M' ? "男" : "女" }}
            </el-tag>
          </el-descriptions-item>
          <el-descriptions-item>
            <template #label>
              <i class="el-icon-tickets"></i>
              角色
            </template>
            <el-tag type="success" disable-transitions>
              {{ getUserRole() === 'admin' ? "管理员" : "普通用户" }}
            </el-tag>
          </el-descriptions-item>
        </el-descriptions>

        <div style="margin-top: 20px;">
          <DateUtils />
        </div>
      </div>
    </el-main>
  </el-container>
</template>

<script>
import { defineComponent, onMounted } from 'vue';
import DateUtils from "./DateUtils.vue";
import { useAuthStore } from '@/stores/index.js';

export default defineComponent({
  name: "Home",
  components: { DateUtils },
  setup() {
    const authStore = useAuthStore();

    onMounted(() => {
      // 在组件加载时可以触发一些初始化操作
    });

    return {
      authInfo: authStore.authInfo,
      displayName: authStore.displayName,
      getUserRole: authStore.getUserRole,
    };
  },
});
</script>

<style scoped>
.el-descriptions {
  width: 90%;
  margin: 0 auto;
  text-align: center;
}

.el-main {
  padding: 20px;
  background-color: #ffffff;
  border-radius: 8px;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
}
</style>
