import { defineStore } from "pinia";
import { ref, computed, watch } from "vue";

export const useAuthStore = defineStore(
  "userAuth",
  () => {
    const authInfo = ref({ 
      type: null, // 默认值为 null
      id: null,
      userName: null, }); 
      
    const userName = ref("未登录用户");
    const authToken = ref("");

    const loadStoredData = () => {
      const storedUserInfo = localStorage.getItem('authInfo');
      const storedAuthToken = localStorage.getItem('authToken');

      if (storedUserInfo) {
        authInfo.value = JSON.parse(storedUserInfo);
        userName.value = authInfo.value.userName || "未登录用户";
      } else {
        authInfo.value = { type: null }; // 默认用户信息
      }
      
      if (storedAuthToken) {
        authToken.value = storedAuthToken;
      }
    };

    loadStoredData(); 

    const setAuthUser = (user) => {
      authInfo.value = user; 
      userName.value = user.userName; 
      localStorage.setItem('authInfo', JSON.stringify(user)); 
    };

    const setAuthToken = (token) => {
      authToken.value = token; 
      localStorage.setItem('authToken', token); 
    };

    const clearUserInfo = () => {
      authInfo.value = { type: null }; 
      userName.value = "未登录用户"; 
      authToken.value = ""; 
      localStorage.removeItem('authInfo'); 
      localStorage.removeItem('authToken'); 
    };

    const isLoggedIn = () => {
      return !!authToken.value && Object.keys(authInfo.value).length > 0; 
    };

    const logoutUser = () => {
      clearUserInfo();
    };

    const getUserRole = () => {
      const roleType = authInfo.value?.type; // 使用可选链
      if (roleType === 'admin') {
        return 'admin';
      } else if (roleType === 'user') {
        return 'user';
      } 
      return null; // 未知角色返回 null
    };

    const displayName = computed(() => {
      return authInfo.value.userName || "未登录用户"; 
    });

    watch([authInfo, authToken], () => {
      localStorage.setItem('authInfo', JSON.stringify(authInfo.value)); 
      localStorage.setItem('authToken', authToken.value); 
    });

    const handleLoginResponse = (response) => {
      if (response.code === 200) {
        const { user, token } = response.data;
        setAuthUser(user);
        setAuthToken(token);
      } else {
        console.error(response.msg); 
      }
    };

    const setAuthInfo = (info) => {
      authInfo.value.type = info.type; // 简单地更新类型
      localStorage.setItem('authInfo', JSON.stringify(authInfo.value));
    };
    
    // 在 return 对象中返回该方法
    return {
      authInfo,
      authToken,
      userName,
      displayName,
      getUserRole,
      setAuthUser,
      setAuthToken,
      clearUserInfo,
      isLoggedIn,
      logoutUser,
      handleLoginResponse,
      setAuthInfo, // 确保将此方法返回
    };
  },
  {
    persist: true, // 启用数据持久化
  }
);
