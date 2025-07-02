import { createApp } from 'vue'
import { createStore } from 'vuex';
import { createPinia } from 'pinia'

import App from './App.vue'
import router from './router'

import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'

import { createPersistedState } from 'pinia-persistedstate-plugin'

const app = createApp(App)
import * as ElementPlusIconsVue from '@element-plus/icons-vue'
for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
  app.component(key, component)
}

const store = createStore({
  state() {
      return {
          // 定义初始状态
          count: 0
      };
  },
  mutations: {
      increment(state) {
          state.count++;
      }
  },
});


app.use(store); 

app.use(createPinia().use(createPersistedState()))
app.use(router)

app.use(ElementPlus)

app.mount('#app')
