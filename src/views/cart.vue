<template>
    <div>
      <h1>购物车</h1>
      <el-table :data="cart">
        <el-table-column prop="productName" label="商品名称"></el-table-column>
        <el-table-column prop="quantity" label="数量"></el-table-column>
        <el-table-column prop="price" label="单价"></el-table-column>
        <el-table-column label="操作">
          <template #default="scope">
            <el-button @click="removeFromCart(scope.row)">移除</el-button>
          </template>
        </el-table-column>
      </el-table>
      <el-button type="success" @click="checkout">结算</el-button>
      <el-link type="primary" href="/index1" style="display: block; margin-top: 10px; text-align: center; font-size: 1.2em;">取消购买，返回主页</el-link>
    </div>
  </template>
  
  <script setup>
  import { ref, onMounted } from 'vue';
  import axios from 'axios';
  import { ElMessage } from 'element-plus';
  
  const cart = ref([]);
  
  const fetchCart = () => {
    const storedCart = JSON.parse(localStorage.getItem("cart")) || [];
    cart.value = storedCart;
  };
  
  const removeFromCart = (item) => {
    cart.value = cart.value.filter(cartItem => cartItem.id !== item.id);
    localStorage.setItem("cart", JSON.stringify(cart.value)); // 更新 localStorage
  };
  
  const checkout = async () => {
    const purchaseInfo = cart.value.map(item => ({
      productId: item.id,
      buyer: "用户名", // 从用户状态中获取
      price: item.price,
      quantity: item.quantity
    }));
  
    try {
      await axios.post('/api/purchase', purchaseInfo);
      ElMessage.success("购买成功！");
      cart.value = []; // 清空购物车
      localStorage.removeItem("cart"); // 清空 localStorage
    } catch (error) {
      console.error(error);
      ElMessage.error("购买失败，请稍后再试");
    }
  };
  
  // 页面加载时获取购物车信息
  onMounted(fetchCart);
  </script>
  