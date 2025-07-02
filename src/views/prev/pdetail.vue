<template>
<div v-html="phone.content"></div>
</template>
<script setup>
import { useRoute } from 'vue-router';
import {ref} from "vue";
import {preProductDetailApi} from '@/utils/api.js';
const route=useRoute();
const id=ref(route.query.id);
const phone=ref({});
let getProductDetail=()=>{
    preProductDetailApi({id:id.value}).then((res)=>{
        phone.value=res.data;
    }).catch((err)=>{});
};
getProductDetail();
</script>

<style></style>