<template>
    <div style="text-align: center; background-color: #f1f1f3; height: 100%; padding: 0; margin: 0;">
        <h1 style="font-size: 50px;">{{ '欢迎你！' + displayName }}</h1>
        <el-descriptions title="个人中心" :column="2" size="40" border>
            <el-descriptions-item>
                <template #label>
                    <i class="el-icon-s-custom"></i>
                    账号
                </template>
                {{ authInfo.id }} <!-- 使用 authInfo.id -->
            </el-descriptions-item>
            <el-descriptions-item>
                <template #label>
                    <i class="el-icon-mobile-phone"></i>
                    电话
                </template>
                {{ authInfo.tel || "未提供" }} <!-- 使用 authInfo.tel -->
            </el-descriptions-item>
            <el-descriptions-item>
                <template #label>
                    <i class="el-icon-location-outline"></i>
                    性别
                </template>
                <el-tag
                        :type="authInfo.gender === 'M' ? 'primary' : 'danger'" 
                        disable-transitions>
                    <i :class="authInfo.gender == 'M' ? 'el-icon-male' : 'el-icon-female'"></i>
                    {{ authInfo.gender == 'M' ? "男" : "女" }} <!-- 使用 authInfo.gender -->
                </el-tag>
            </el-descriptions-item>
            <el-descriptions-item>
                <template #label>
                    <i class="el-icon-tickets"></i>
                    角色
                </template>
                <el-tag type="success" disable-transitions>
                    {{ getUserRole() === 'admin' ? "管理员" : "普通用户" }} <!-- 使用 getUserRole -->
                </el-tag>
            </el-descriptions-item>
        </el-descriptions>

        <DateUtils />
    </div>
</template>

<script>
import { defineComponent, onMounted } from 'vue';
import DateUtils from "./DateUtils.vue";
import { useAuthStore } from '@/stores/index.js'; // 根据实际路径引入

export default defineComponent({
    name: "Home",
    components: { DateUtils },
    setup() {
        const authStore = useAuthStore(); // 使用 Pinia store

        onMounted(() => {
            // 在组件加载时可以触发一些初始化操作
        });

        return { 
            authInfo: authStore.authInfo, // 直接引用 authInfo
            displayName: authStore.displayName, // 获取显示用户名
            getUserRole: authStore.getUserRole // 获取用户角色
        };
    }
});
</script>

<style scoped>
.el-descriptions {
    width: 90%;
    margin: 0 auto;
    text-align: center;
}
</style>
