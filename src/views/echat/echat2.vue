<template>
  <div>
    <el-input
      v-model="query.pname"
      style="width: 240px"
      placeholder="输入产品名模糊查询"
    />
    <el-button type="success" @click="searchProducts">点击搜索</el-button>
    
    <el-button type="primary" @click="downloadChart">下载报表</el-button>

    <el-card>
      <h3>订单分类统计</h3>
      <div id="pieChart" style="width: 100%; height: 400px;"></div>
    </el-card>
    
    <el-table :data="productList" style="width: 100%">
      <!-- 其他列 -->
    </el-table>
  </div>
</template>
<script setup>
import { ref, onMounted } from "vue";
import { getProductListApi3 } from "@/utils/api.js";
import * as echarts from 'echarts';

const query = ref({
  pageNum: 1,
  pageSize: 10,
  pname: ''
});
const productList = ref([]);

// 创建图表实例
let myChart;

const getList = async () => {
  try {
    const res = await getProductListApi3(query.value);
    productList.value = res.data.list;
    generatePieChart(res.data.list); // 生成饼图
  } catch (err) {
    console.error(err);
    alert("获取产品列表失败，请稍后再试");
  }
};

// 生成饼图
const generatePieChart = (products) => {
  const pieData = {};

  // 根据分类计算数量
  products.forEach(product => {
    pieData[product.catName] = (pieData[product.catName] || 0) + 1;
  });

  const chartData = Object.entries(pieData).map(([key, value]) => ({
    name: key,
    value: value
  }));

  // 确保图表实例只被初始化一次
  if (!myChart) {
    myChart = echarts.init(document.getElementById('pieChart'));
  }

  const option = {
    title: {
      text: '订单分类统计',
      left: 'center',
    },
    tooltip: {
      trigger: 'item'
    },
    series: [
      {
        name: '分类',
        type: 'pie',
        radius: '50%',
        data: chartData,
        emphasis: {
          itemStyle: {
            shadowBlur: 10,
            shadowOffsetX: 0,
            shadowColor: 'rgba(0, 0, 0, 0.5)'
          }
        }
      }
    ]
  };

  myChart.setOption(option);
};

onMounted(() => {
  getList();
});

const searchProducts = () => {
  query.value.pageNum = 1;  
  getList();  
};

const downloadChart = () => {
  if (myChart) {
    const imgData = myChart.getDataURL({
      pixelRatio: 2,
      backgroundColor: '#fff'
    });

    const link = document.createElement('a');
    link.href = imgData;
    link.download = 'order-category-statistics.png';
    link.click();
  } else {
    alert("图表尚未生成，请先执行搜索。");
  }
};
</script>

<style></style>
