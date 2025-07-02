<template>
  <div>
    <el-input
      :clearable="true"
      v-model="query.productName"
      style="width: 240px"
      placeholder="输入产品名称进行搜索"
    />
    <el-button type="success" @click="searchProducts">搜索</el-button>

    <el-dialog
      v-model="dialogFormVisible"
      :title="dialogMode === 'add' ? '新增产品' : '编辑产品'"
      width="600"
    >
      <el-form :model="productForm">
        <el-form-item label="产品名称" prop="productName">
          <el-input v-model="productForm.productName"></el-input>
        </el-form-item>
        <el-form-item label="分类名称" prop="catName">
          <el-input v-model="productForm.catName"></el-input>
        </el-form-item>
        <el-form-item label="价格" prop="price">
          <el-input v-model.number="productForm.price"></el-input>
        </el-form-item>
        <el-form-item label="销量" prop="salesVolume">
          <el-input v-model.number="productForm.salesVolume"></el-input>
        </el-form-item>
      </el-form>
      <template #footer>
        <div class="dialog-footer">
          <el-button @click="dialogFormVisible = false">取消</el-button>
          <el-button type="primary" @click="onSubmit">{{ dialogMode === 'add' ? '确认新增' : '确认修改' }}</el-button>
        </div>
      </template>
    </el-dialog>

    <div ref="chartContainer" id="chartContainer" style="width: 100%; height: 400px; margin-top: 20px;"></div>
    
    <el-button type="primary" @click="downloadChart">下载图表</el-button> <!-- 下载按钮 -->

    <el-table :data="productList" style="width: 100%">
      <el-table-column prop="productName" label="产品名称"></el-table-column>
      <el-table-column prop="price" label="价格"></el-table-column>
      <el-table-column prop="salesVolume" label="销量"></el-table-column>
      <el-table-column label="操作">
        <template #default="{ row }">
          <el-button @click="editProduct(row)">调整</el-button>
          <el-button type="danger" @click="confirmDelete(row.id)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <el-pagination
      :page-size="query.pageSize"
      layout="prev, pager, next"
      :total="totals"
      @change="changePage"
    />
  </div>
</template>

<script setup>
import { ref, onMounted, watch } from "vue";
import { getProductListApi, addProductApi, deleteProductApi, updateUserApi } from "@/utils/api.js"; 
import { ElMessage, ElMessageBox } from 'element-plus';
import * as echarts from 'echarts';

const productList = ref([]);
const query = ref({
  productName: '',
  pageNum: 1,
  pageSize: 10,
});
const dialogFormVisible = ref(false);
const totals = ref(0);
const dialogMode = ref('add');
const productForm = ref({});

const fetchProductList = async () => {
  try {
    const response = await getProductListApi(query.value);
    
    console.log('API Response:', response);

    if (response.code === 200 && Array.isArray(response.data.list)) {
      productList.value = response.data.list;
      totals.value = response.data.total;
      renderChart(response.data.list);
    } else {
      console.error('Invalid data format:', response);
      throw new Error('Invalid data format');
    }
  } catch (error) {
    console.error(error);
    ElMessage.error('加载产品列表失败');
  }
};

onMounted(() => {
  fetchProductList();
});

const renderChart = (data) => {
  if (!data || data.length === 0) return;

  const chartContainer = document.getElementById('chartContainer');
  if (!chartContainer) return;

  const myChart = echarts.init(chartContainer);

  const productNames = data.map(item => item.productName);
  const prices = data.map(item => item.price || 0);

  const option = {
    title: {
      text: '产品价格统计',
    },
    tooltip: {
      trigger: 'axis'
    },
    legend: {
      data: ['价格'],
    },
    xAxis: {
      type: 'category',
      data: productNames,
    },
    yAxis: {
      type: 'value',
      name: '价格',
    },
    series: [
      {
        name: '价格',
        type: 'bar',
        data: prices,
        emphasis: {
          focus: 'series'
        }
      },
      {
        name: '价格',
        type: 'line',
        data: prices,
        emphasis: {
          focus: 'series'
        },
        smooth: true,
        lineStyle: {
          width: 2
        }
      }
    ],
  };

  myChart.setOption(option);
};

// 下载图表
const downloadChart = () => {
  const chartContainer = document.getElementById('chartContainer');
  if (!chartContainer) return;

  const myChart = echarts.getInstanceByDom(chartContainer);
  if (!myChart) return;

  const imgData = myChart.getDataURL({
    pixelRatio: 2,
    backgroundColor: '#fff'
  });

  const link = document.createElement('a');
  link.href = imgData;
  link.download = 'product-price-statistics.png';
  link.click();
};

// 搜索产品
const searchProducts = async () => {
  query.value.pageNum = 1;
  await fetchProductList();
};

// 新增产品时初始化表单
const addProduct = async () => {
  productForm.value = {};
  dialogMode.value = 'add';
  dialogFormVisible.value = true;
};

// 编辑产品
const editProduct = (row) => {
  dialogMode.value = 'edit';
  productForm.value = { ...row };
  dialogFormVisible.value = true;
};

const onSubmit = async () => {
  try {
    if (dialogMode.value === 'add') {
      await addProductApi(productForm.value);
      ElMessage.success('新增成功');
    } else if (dialogMode.value === 'edit') {
      if (!productForm.value.id) {
        throw new Error('更新用户必须传递ID属性');
      }
      productForm.value.updateTime = new Date().toISOString();

      await updateUserApi(productForm.value);
      ElMessage.success('更新成功');
    }

    dialogFormVisible.value = false;
    await fetchProductList();
  } catch (error) {
    console.error(error);
    ElMessage.error('操作失败：' + error.message);
  }
};

// 确认删除
const confirmDelete = async (productId) => {
  ElMessageBox.confirm('确定要删除该产品吗?', '提示', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning'
  }).then(async () => {
    try {
      await deleteProductApi(productId);
      ElMessage.success('删除成功');
      await fetchProductList();
    } catch (error) {
      console.error(error);
      ElMessage.error('删除失败：' + error.message);
    }
  }).catch(() => {
    ElMessage.info('已取消删除');
  });
};

// 分页变化
const changePage = (pageNum) => {
  query.value.pageNum = pageNum;
  fetchProductList();
};

// 监听查询条件的变化
watch(() => query.value.productName, fetchProductList);
</script>

<style scoped>
/* 添加一些基本样式 */
#chartContainer {
  border: 1px solid #dcdfe6;
}
</style>

     