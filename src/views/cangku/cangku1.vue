<template>
  <div class="container">
    <h1 class="title">仓库产品列表</h1>
    <el-table :data="productList" style="width: 100%" border>
      <el-table-column prop="productName" label="仓库名称" width="180" />
      <el-table-column prop="num" label="仓库存储量" />
      <el-table-column prop="ops" label="操作" width="180">
        <template #default="scope">
          <el-button type="danger" @click="removeProduct(scope.row.productName)">出库操作</el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-pagination 
      class="pagination" 
      :page-size="query.pageSize" 
      :pager-count="5" 
      layout="prev, pager, next" 
      :total="totals" 
      @change="changePage" 
    />
  </div>
</template>

<script setup>
import { ref } from "vue";
import { getProductKu1ListApi, deleteProductApi21 } from "@/utils/api.js";
import { ElMessage } from 'element-plus';
import { nextTick } from 'vue';

const productList = ref([]);

// 分页
const totals = ref(100);
let query = ref({
  pageNum: 1,
  pageSize: 10,
  productName: ''
});

// 获取产品列表
const getList = () => {
  getProductKu1ListApi(query.value)
    .then((res) => {
      productList.value = res.data.list;
      totals.value = res.data.total;
    })
    .catch((err) => {
      console.error(err);
      ElMessage.error("获取产品列表失败，请稍后再试");
    });
};

getList();

const changePage = (pageNum) => {
  query.value.pageNum = pageNum;
  // 页码发生变化，重新发送网络分页请求
  getList();
};

// 出库操作
const removeProduct = (productName) => {
  deleteProductApi21(productName)
    .then(async (res) => {
      ElMessage({
        message: '删除成功',
        type: 'success',
      });
      await nextTick(); // 等待 DOM 更新完成
      getList(); // 然后重新获取列表
    })
    .catch((err) => {
      console.error(err);
      ElMessage.error('删除失败，请检查');
    });
};

</script>

<style>
.container {
  padding: 20px;
  background-color: #f9f9f9;
  border-radius: 8px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.title {
  font-size: 24px;
  color: #333;
  margin-bottom: 20px;
  text-align: center;
}

.el-table {
  margin-top: 20px;
  border-radius: 8px;
}

.el-table th {
  background-color: #f2f2f2;
  color: #666;
}

.el-table td {
  color: #444;
}

.pagination {
  margin-top: 20px;
  text-align: right;
}
</style>
