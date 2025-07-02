import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import Layout from "@/layout/index.vue";
import Layout1 from "@/layout1/index.vue";
import { getToken } from '@/utils/common.js';
import { useAuthStore } from '@/stores/index.js';

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'index',
      component: () => import('../views/index.vue'),
    },
    {
      path: '/index',
      name: 'index1',
      component: () => import('../views/index.vue'),
    },
    {
      path: '/index1',
      name: 'index2',
      component: () => import('../views/prev/index.vue'),
    },
    {
      path: '/par',
      name: 'par',
      component: () => import('../views/demo/par.vue'),
    },
    {
      path: '/about',
      name: 'about',
      component: () => import('../views/AboutView.vue'),
    },
    {
      path: '/demo1',
      name: 'demo1',
      component: () => import('../views/demo1.vue'),
    },
    {
      path: '/demo2',
      name: 'demo2',
      component: () => import('../views/demo2.vue'),
    },
    {
      path: '/demo3',
      name: 'demo3',
      component: () => import('../views/demo3.vue'),
    },
    {
      path: '/demo4',
      name: 'demo4',
      component: () => import('../views/demo4.vue'),
    },
    {
      path: '/settings',
      name: 'settings',
      component: () => import('../views/Settings.vue'),
    },
    {
      path: '/login',
      name: 'login',
      component: () => import('../views/login.vue'),
    },
    {
      path: '/regist',
      name: 'regist',
      component: () => import('../views/regist.vue'),
    },
    {
      path: '/cart',
      name: 'cart',
      component: () => import('../views/cart.vue'),
    },
    {
      path: '/prev/pdetail',
      name: 'pdetail',
      component: () => import('../views/prev/pdetail.vue'),
    },

    {
      path: "/index2",
      component: Layout,
      name: "homeView",
      meta: { requiresAuth: true, role: 'admin' }, 
      children: [
        {
          path: "/home",
          name: "home",
          meta: {
            title: "任务编辑",
            icon: 'House',
          },
          component: () => import("@/views/admin-home.vue")
        },
        {
          path:'/xianshi',
          name:'XianShi',
          meta:{
              title:'账户页面',
              icon: 'Loading'
          },
          component:()=>import('@/views/system/xianshi.vue')
      },
        {
          'path': '/system',
          name: 'system',
          meta: {
            title: '系统管理',
            icon: 'Tools'
          },
          children: [
            {
              path: 'user',
              name: 'User',
              meta: {
                title: '客户管理',
                icon: 'UserFilled'
              },
              component: () => import("@/views/system/user.vue")
            },
            {
              path: 'role',
              name: 'Role',
              meta: {
                title: '供应商管理',
                icon: 'Histogram'
              },
              component: () => import("@/views/system/role.vue")
            },
            {
              path: 'dingdan',
              name: 'dingDan',
              meta: {
                title: '订单日志管理',
                icon: 'ShoppingCartFull'
              },
              component: () => import("@/views/system/dingdan.vue")
            },
            {
              path: 'product',
              name: 'proDuct',
              meta: {
                title: '产品管理',
                icon: 'Present'
              },
              component: () => import("@/views/system/product.vue")
            },
           

          ]
        },
        

        {
          'path': '/cangku',
          name: 'cangku',
          meta: {
            title: '仓库管理',
            icon: 'CreditCard'
          },
          children: [
            {
              path: 'cangku1',
              name: 'cangku1',
              meta: {
                title: '仓库展示',
                icon: 'Grid'
              },
              component: () => import("@/views/cangku/cangku.vue")
            },
            {
              path: 'cangku2',
              name: 'cangku2',
              meta: {
                title: '仓库详情',
                icon: 'Menu'
              },
              component: () => import("@/views/cangku/cangku1.vue")
            },
    
          ]
        },      
          
        
    {
      'path': '/echat',
      name: 'echat',
      meta: {
        title: '可视化报表',
        icon: 'Opportunity'
      },
      children: [
        {
          path: 'echat1',
          name: 'Echat1',
          meta: {
            title: '价格报表',
            icon: 'CreditCard'
          },
          component: () => import("@/views/echat/echat1.vue")
        },
        {
          path: 'echat2',
          name: 'Echat2',
          meta: {
            title: '订单分类报表',
            icon: 'Wallet'
          },
          component: () => import("@/views/echat/echat2.vue")
        },
        {
          path: 'echat3',
          name: 'Echat3',
          meta: {
            title: '用户报表',
            icon: 'DataLine'
          },
          component: () => import("@/views/echat/echat3.vue")
        },


      ]
    },      
      ]
    },

    {
      path: "/index3",
      component: Layout1,
      name: "homeView1",
      meta: { requiresAuth: true, role: 'user' },
      children: [
        {
          path: "/user-home",
          name: "user-home",
          meta: {
            title: "首页",
            icon: 'House',
          },
          component: () => import("@/views/user-home.vue")
        },
        {
          path:'/xianshi1',
          name:'XianShi1',
          meta:{
              title:'显示页面',
              icon: 'Loading'
          },
          component:()=>import('@/views/system1/xianshi.vue')
      },

        {
          'path': '/system1',
          name: 'system1',
          meta: {
            title: '订单页面',
            icon: 'Grid'
          },
          children: [
            {
              path: 'product1',
              name: 'proDuct1',
              meta: {
                title: '购物车',
                icon: 'ShoppingCartFull'
              },
              component: () => import("@/views/system1/dingdan.vue")
            },
           

          ]
        }
      ]
    },

  ],
})




// 全局路由守卫
router.beforeEach((to, from, next) => {
  const authStore = useAuthStore();
  const token = getToken();

  console.log('Navigating to:', to.path);
  console.log('Current Token:', token);
  console.log('Stored User Info:', authStore.authInfo); // 输出存储的用户信息

  // 允许访问的公共路由
  if (
    to.path.startsWith("/login") ||
    to.path.startsWith("/regist") || 
    to.path.startsWith("/logout") ||
    to.path.startsWith("/prev") || 
    to.path === "/index" || 
    to.path === "/"
  ) {
    next(); // 直接放行
  } else {
    if (token) {
      if (to.matched.some(record => record.meta.requiresAuth)) {
        const userRole = authStore.authInfo.type; // 根据实际情况访问
        const requiredRole = to.meta.role;

        if (requiredRole) {
          const hasAccess = Array.isArray(requiredRole)
            ? requiredRole.includes(userRole)
            : userRole === requiredRole;

          if (!hasAccess) {
            console.log('Access Denied, redirecting to login');
            return next("/login"); // 权限不足，重定向
          }
        }

        next(); // 有权限，允许访问
      } else {
        next(); // 不需要权限的路由，允许访问
      }
    } else {
      console.log('No Token, redirecting to login');
      next("/login"); // 未登录，重定向到登录页
    }
  }
});



export  default router;