<template>
  <!-- 新增用户的界面--START -->
  <el-input :clearable="true" v-model="query.userName" style="width: 240px" placeholder="输入模糊查询姓名" />
  <el-button type="success" @click="getUserList">点击搜索</el-button>
  <el-button type="success" @click="addUser">新增用户</el-button>
  
  <el-dialog v-model="dialogFormVisible" :title="dialogMode=='add' ? '新增用户':'编辑用户'" width="500">
    <el-form :model="userForm">
      <el-form-item label="登录名" :label-width="formLabelWidth">
        <el-input v-model="userForm.loginName" autocomplete="off" :disabled="dialogMode=='edit'" />
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
    
    <template #footer>
      <div class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取消</el-button>
        <el-button type="primary" @click="onSubmit" v-if="dialogMode=='add'">确认新增</el-button>
        <el-button type="primary" @click="onSubmitEdit" v-if="dialogMode=='edit'">确认修改</el-button>
      </div>
    </template>
  </el-dialog>
  <!-- 新增用户的界面--END -->

  <el-table :data="userList" style="width: 100%">
    <el-table-column prop="id" label="数据库ID" />
    <el-table-column prop="loginName" label="登录名" width="180" />
    <el-table-column prop="userName" label="姓名" width="180" />
    <el-table-column prop="age" />
    <el-table-column prop="gender" label="性别">
      <template #default="scope">
        {{ scope.row.gender == 'M' ? "男" : "女" }}
      </template>
    </el-table-column>
    <el-table-column prop="tel" label="联系方式" />
    <el-table-column prop="type" label="用户类型">
      <template #default="scope">
        <el-tag type="primary" v-if="scope.row.type=='admin'">管理员</el-tag>
        <el-tag type="success" v-if="scope.row.type!='admin'">普通用户</el-tag>
      </template>
    </el-table-column>
    <el-table-column prop="remark" label="备注" />
    <el-table-column label="操作" width="160">
      <template #default="scope">
        <el-button type="primary" @click="editUser(scope.row)">编辑</el-button>
        <el-button type="danger" @click="removeUser(scope.row.id)">删除</el-button>
      </template>
    </el-table-column>
  </el-table>

  <!-- 分页 -->
  <el-pagination :page-size="query.pageSize" :pager-count="5" layout="  prev, pager, next" :total="totals" @change="changePage"/>
</template>

<script lang="ts" setup>
import { ref } from 'vue';
import { UserListApi, addUserApi, removeUserApi, updateUserApi } from '@/utils/api.js';
import { ElMessage } from 'element-plus';

// dialogMode控制打开的对话框是用于新增还是编辑
const dialogMode = ref("add");
const userList = ref([]);
const totals = ref(100);
let query = ref({
  pageNum: 1,
  pageSize: 10,
  userName: '' // 添加用户姓名查询字段
});

let getUserList = () => {
  // 从后台接口获取数据
  UserListApi(query.value)
    .then(res => {
      console.log('OK');
      console.log(res);
      // 过滤掉 type 为 'admin' 的用户
      userList.value = res.data.list.filter(user => user.type !== 'admin');
      // 更新总数
      totals.value = res.data.total; 
    }).catch(err => {
      console.log(err);
    });
};

getUserList();

// 新增用户
const formLabelWidth = '140px';
let userForm = ref({
  loginName: '',
  userName: '',
  gender: '',
  tel: '',
  age: null,
  type: '',
  remark: ''
});
const dialogFormVisible = ref(false);

let addUser = () => {
  dialogFormVisible.value = true;
  dialogMode.value = 'add';
  // 重置表单
  resetForm();
};

let onSubmit = () => {
  addUserApi(userForm.value).then(res => {
    dialogFormVisible.value = false;
    getUserList();
    ElMessage({ message: '新增成功', type: 'success' });
  }).catch(err => {
    console.error(err);
    ElMessage.error('新增失败，请检查输入');
  });
};

// 删除用户
let removeUser = (userId) => {
  removeUserApi(userId).then((res) => {
    ElMessage({ message: '删除成功', type: 'success' });
    getUserList();
  }).catch((err) => {
    ElMessage.error('删除失败，请检查');
  });
};

// 编辑用户
let editUser = (user) => {
  userForm.value = { ...user }; // 使用展开运算符更简洁
  dialogFormVisible.value = true;
  dialogMode.value = 'edit';
};

let onSubmitEdit = () => {
  updateUserApi(userForm.value)
    .then((res) => {
      dialogFormVisible.value = false;
      getUserList();
      ElMessage({ message: '修改成功', type: 'success' });
    })
    .catch((err) => {
      console.error(err);
      ElMessage.error('修改失败，请检查输入');
    });
};

let changePage = (num) => {
  query.value.pageNum = num;
  getUserList();
};

// 重置表单函数
let resetForm = () => {
  userForm.value = {
    loginName: '',
    userName: '',
    gender: '',
    tel: '',
    age: null,
    type: '',
    remark: ''
  };
};
</script>
