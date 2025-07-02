<template>
    <h1>VUE3基础指令语法</h1>
    <!-- 插值表达式{{  }} -->
     <p>{{ num }} {{ person.age }}</p>
     <p>{{ person.name }}</p>
     <p>{{ arr[0].gender }}</p>
     <!-- 把字符绑定为为class=red红色 -->
      <p :class="redColor">{{ person.name }}</p>
     <p v-bind:class="redColor">{{ arr[0].gender }}</p>
     <!-- 原本字符串打印 -->
     <div v-text="ht"></div>
     <!-- 对原有字符进行解析 -->
     <div v-html="ht"></div>
     <!-- 模拟点击事件 -->
      <button v-on:click="add">年龄+1</button>
      <!-- 绑定数据 -->
    <input type="text" v-model="num" />
   
</template>

<script setup>
import { ref} from "vue";
const num=ref(10);
const str=ref("hello vue3");
const ht="<h2 class='red'>h2标签</h2>";
const redColor="red";
const person=ref({name:"张三",age:20,gender:"M"});
const arr=ref([
    {name:"张三",age:20,gender:"M"},
    {name:"张三",age:21,gender:"F"},
    {name:"张三",age:22,gender:"G"}
]);
const add=()=>{
    num.value++;
    person.age++;
};
</script>

<!-- scoped表示只对当前页面有效 -->
<style scoped>
.red{
    color: red;
}

</style>