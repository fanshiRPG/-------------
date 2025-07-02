<template>
    <h1>VUE3基础指令语法</h1>
    <br>
    <button @click="add">num+1</button>
    <p>数字：{{ num }}</p>
    <p>{{ str }}</p>
    <h2>姓名：{{ person.name }} 年龄：{{ person.age }}</h2>
</template>

<script>
import {reactive, ref} from "vue"
export default{
    setup(){
        const num=ref(10);
        const str=ref("hello")
        const person=reactive({
            name:"张三",
            age:20
        });
        const add=()=>{
            num.value++;
            str.value=str.value+"01";
            person.age++;
        };
        

    return {
        num,
        str,
        add,
        person
    };
}
};

</script>

<style scoped>


</style>