<template>
   

    <el-dialog v-model="dialogFormVisible" :title="dialogMode === 'add' ? '新增用户' : '编辑用户'" width="500">
      <el-form :model="userForm" ref="userFormRef">
        <el-form-item label="登录名" :label-width="formLabelWidth">
          <el-input v-model="userForm.loginName" autocomplete="off" :disabled="dialogMode === 'edit'" />
        </el-form-item>
        <el-form-item label="姓名" :label-width="formLabelWidth">
          <el-input v-model="userForm.userName" autocomplete="off" />
        </el-form-item>
        <el-form-item label="性别" :label-width="formLabelWidth">
          <el-radio-group v-model="userForm.gender">
            <el-radio value="M">男</el-radio>
            <el-radio value="F">女</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="联系方式" :label-width="formLabelWidth">
          <el-input v-model="userForm.tel" autocomplete="off" />
        </el-form-item>
        <el-form-item label="年龄" :label-width="formLabelWidth">
          <el-input v-model="userForm.age" autocomplete="off" />
        </el-form-item>
        <el-form-item label="用户类别" :label-width="formLabelWidth">
          <el-select v-model="userForm.type" placeholder="请选择用户类型">
            <el-option label="管理员" value="admin" />
            <el-option label="普通用户" value="user" />
          </el-select>
        </el-form-item>
        <el-form-item label="备注" :label-width="formLabelWidth">
          <el-input v-model="userForm.remark" autocomplete="off" />
        </el-form-item>
      </el-form>
    </el-dialog>
    <!-- 新增用户的界面--END -->

    <el-table :data="userList" style="width: 100%">
      <el-table-column prop="id" label="数据库ID" />
      <el-table-column prop="loginName" label="登录名" width="180" />
      <el-table-column prop="userName" label="姓名" width="180" />
      <el-table-column prop="age" label="年龄" />
      <el-table-column prop="gender" label="性别">
        <template #default="scope">
          {{ scope.row.gender === 'M' ? "男" : "女" }}
        </template>
      </el-table-column>
      <el-table-column prop="tel" label="联系方式" />
      <el-table-column prop="type" label="用户类型">
        <template #default="scope">
          <el-tag type="primary" v-if="scope.row.type === 'admin'">管理员</el-tag>
          <el-tag type="success" v-else>普通用户</el-tag>
        </template>
      </el-table-column>
      <el-table-column prop="remark" label="备注" />
    </el-table>

    <div class="charts-container">
      <h3>用户性别统计</h3>
      <div id="genderChart" class="chart" />
      
      <h3>管理员用户统计</h3>
      <div id="adminChart" class="chart" />
    </div>

    <el-pagination :page-size="query.pageSize" :pager-count="5" layout="total, prev, pager, next, jumper"
                   :total="total" @current-change="handleCurrentChange" />
</template>

<script lang="ts" setup>
import { ref, onMounted } from 'vue';
import * as echarts from 'echarts';
import { UserListApi } from '@/utils/api.js'; // 请确保您的 API 引入路径正确

// 声明变量
const query = ref({
  userName: '',
  pageSize: 10,
  pageNum: 1
});
const userList = ref([]);
const total = ref(0);
const genderData = ref({ male: 0, female: 0 });
const adminData = ref({ admin: 0, user: 0 });
const dialogFormVisible = ref(false);
const dialogMode = ref('add');
const userForm = ref({
  loginName: '',
  userName: '',
  gender: 'M', // 默认性别
  tel: '',
  age: '',
  type: 'user',
  remark: ''
});
const formLabelWidth = '100px'; // Form label width can be customized

// 获取用户列表
const getUserList = () => {
  UserListApi(query.value).then(res => {
    userList.value = res.data.list;
    total.value = res.data.total;

    // 性别统计
    genderData.value.male = userList.value.filter(user => user.gender === 'M').length;
    genderData.value.female = userList.value.filter(user => user.gender === 'F').length;

    // 用户类型统计
    adminData.value.admin = userList.value.filter(user => user.type === 'admin').length;
    adminData.value.user = userList.value.filter(user => user.type === 'user').length;

    renderGenderChart();
    renderAdminChart();
  }).catch(err => {
    console.error(err);
  });
};

// 渲染性别饼图
const renderGenderChart = () => {
  const chartDom = document.getElementById('genderChart');
  const myChart = echarts.init(chartDom);

  const option = {
    title: {
      text: '用户性别统计',
      subtext: '普通用户',
      left: 'center'
    },
    tooltip: {
      trigger: 'item'
    },
    legend: {
      orient: 'vertical',
      left: 'left'
    },
    series: [
      {
        name: '性别',
        type: 'pie',
        radius: '50%',
        data: [
          { value: genderData.value.male, name: '男' },
          { value: genderData.value.female, name: '女' }
        ],
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

// 渲染管理员用户饼图
const renderAdminChart = () => {
  const chartDom = document.getElementById('adminChart');
  const myChart = echarts.init(chartDom);

  const option = {
    title: {
      text: '用户类型统计',
      subtext: '管理员 vs 普通用户',
      left: 'center'
    },
    tooltip: {
      trigger: 'item'
    },
    legend: {
      orient: 'vertical',
      left: 'left'
    },
    series: [
      {
        name: '用户类型',
        type: 'pie',
        radius: '50%',
        data: [
          { value: adminData.value.admin, name: '管理员' },
          { value: adminData.value.user, name: '普通用户' }
        ],
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

// 分页变化处理
const handleCurrentChange = (val) => {
  query.value.pageNum = val;
  getUserList(); // 在分页变化时重新获取用户列表
};

// 新增用户
const addUser = () => {
  dialogMode.value = 'add';
  userForm.value = {
    loginName: '',
    userName: '',
    gender: 'M',
    tel: '',
    age: '',
    type: 'user',
    remark: ''
  };
  dialogFormVisible.value = true; // 打开对话框
};

// 编辑用户
const editUser = (user) => {
  dialogMode.value = 'edit';
  userForm.value = { ...user }; // 将选中的用户数据填入表单
  dialogFormVisible.value = true; // 打开对话框
};

// 提交新增用户
const onSubmit = () => {
  // TODO: 添加 API 调用以保存新用户
  console.log('新增用户:', userForm.value);
  dialogFormVisible.value = false; // 关闭对话框
  getUserList(); // 更新用户列表
};

// 提交编辑用户
const onSubmitEdit = () => {
  // TODO: 添加 API 调用以保存编辑用户
  console.log('编辑用户:', userForm.value);
  dialogFormVisible.value = false; // 关闭对话框
  getUserList(); // 更新用户列表
};

// 删除用户
const removeUser = (id) => {
  // TODO: 添加 API 调用以删除用户
  console.log('删除用户ID:', id);
  getUserList(); // 更新用户列表
};

// 页面加载时获取用户列表
onMounted(() => {
  getUserList();
});
</script>

<style scoped>
.dialog-footer {
  display: flex;
  justify-content: flex-end;
}
.charts-container {
  margin-top: 20px;
  display: flex;
  flex-direction: column;
  align-items: center;
}
.chart {
  width: 80%; /* 控制图表宽度 */
  height: 400px; /* 控制图表高度 */
  margin: 20px 0; /* 图表之间的间距 */
  border: 1px solid #dcdfe6; /* 边框样式 */
  border-radius: 4px; /* 圆角边框 */
  padding: 10px; /* 内边距 */
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.1); /* 阴影效果 */
}
</style>
