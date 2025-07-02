<template>
  <div class="main">
    <div class="bubbles left"></div>
    <div class="content">
      <h1>欢迎来到我的网站</h1>
      <button class="styled-button" @click.prevent="goToAbout">关于我们</button>
    </div>
    <div class="bubbles right"></div>
  </div>
</template>

<script setup>
import { useRouter } from "vue-router";

const router = useRouter();
const goToAbout = () => {
  router.push("/index1");
};
</script>

<style scoped>
.main {
  display: flex;
  justify-content: center;
  align-items: center;
  position: relative;
  height: 100vh;
  background-image: url('/src/assets/imgs/科幻引入首图.jpeg');
  background-repeat: no-repeat;
  background-size: contain;
  background-position: center;
  background-attachment: fixed;
  overflow: hidden;
}

.content {
  text-align: center;
  padding: 20px;
  background: rgba(255, 255, 255, 0.85);
  border-radius: 12px;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
  animation: fadeIn 2s ease-in-out;
  transform: scale(1);
  transition: transform 0.3s ease-in-out;
}

.content:hover {
  transform: scale(1.1);
}

h1 {
  font-size: 3rem;
  color: #4a4a4a;
  font-family: "Arial", sans-serif;
  margin-bottom: 20px;
  background: linear-gradient(90deg, #ff7e5f, #feb47b);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}

.styled-button {
  background: linear-gradient(90deg, #4caf50, #45a049);
  color: white;
  padding: 15px 32px;
  font-size: 16px;
  border: none;
  border-radius: 8px;
  cursor: pointer;
  transition: all 0.3s ease;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
}

.styled-button:hover {
  background: linear-gradient(90deg, #45a049, #4caf50);
  transform: scale(1.1);
  box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
}

@keyframes fadeIn {
  from {
    opacity: 0;
    transform: translateY(50px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.bubbles {
  position: absolute;
  top: 0;
  bottom: 0;
  width: 50px;
  pointer-events: none;
  overflow: hidden;
}

.bubbles.left {
  left: 0;
}

.bubbles.right {
  right: 0;
}

.bubbles::before,
.bubbles::after {
  content: '';
  position: absolute;
  background: rgba(255, 255, 255, 0.2);
  border-radius: 50%;
  animation: float 10s infinite ease-in-out;
}

.bubbles::before {
  width: 20px;
  height: 20px;
  left: 10%;
  animation-delay: 0s;
}

.bubbles::after {
  width: 30px;
  height: 30px;
  left: 50%;
  animation-delay: 5s;
}

@keyframes float {
  0% {
    transform: translateY(100vh) translateX(0);
    opacity: 0;
  }
  50% {
    opacity: 1;
  }
  100% {
    transform: translateY(-100vh) translateX(20px);
    opacity: 0;
  }
}
</style>
