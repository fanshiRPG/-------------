<template>
<h1 v-if="show">你看到我了，我是h1标签</h1>
<h2 v-show="show">我是h2标签</h2>
<button @click="changShow">{{ show ? "隐藏":"显示" }}</button>
<table>
    <tbody >
    <tr v-for="(item,index) in persons" :key="index">
        <td>{{ item.name }}</td>
        <td>{{ item.age }}</td>
        <td v-for="(person,index1) in persons" :key="index1">
            {{ "爱好:"+(++index1)+person.aihao }}
        </td>
    </tr>
    </tbody>
</table>
</template>

<script setup>
import {reactive, ref} from "vue";
let show=ref(true);
let changShow=()=>{
    show.value=!show.value;
};

let persons=reactive([
    {
        name:"张三",
        age:18,
        aihao:["zhuqiu","lanqiu","pqqiu"]
    },
    {
        name:"李四",
        age:20,
        aihao:["shouyou","duanyou"]
    }
]);
</script>

<style>

</style>