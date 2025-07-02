<template>
    <MceEditor v-model="content" />
  </template>
  
  <script setup>
    import MceEditor from "@/components/MceEditor.vue";
    import { ref } from "vue";
    let content = ref("富文本编辑器Editor");
  </script>
  
  <style></style>
  