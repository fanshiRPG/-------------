<template>
   <el-input
    :clearable="true"
    v-model="query.pname"
    style="width: 240px"
    placeholder="输入产品名模糊查询"
  />
  <el-button type="success" @click="searchProducts">点击搜索</el-button>

<el-button type="success" @click="addProduct">新增订单信息</el-button>
<el-dialog v-bind:z-index="100" v-model="dialogFormVisible" :title="dialogMode=='add' ?'新建订单':'编辑订单'" width="1000">
  <el-form :model="productForm">
    <el-form-item label="产品名称" :label-width="formLabelWidth">
      <el-input v-model="productForm.productName" autocomplete="off" />
    </el-form-item>
    <el-form-item label="产品价格" :label-width="formLabelWidth">
      <el-input v-model="productForm.price" autocomplete="off" />
    </el-form-item>
    <el-form-item label="产品类别">
    <el-select v-model="productForm.catName" placeholder="请选择产品类别">
      <el-option label="手机" value="手机" />
      <el-option label="智能穿戴" value="智能穿戴" />
      <el-option label="家电" value="家电" />
      <el-option label="汽车" value="汽车" />
    </el-select>
  </el-form-item>
    <el-form-item label="产品需求" :label-width="formLabelWidth">
      <el-input v-model="productForm.shotDesc" autocomplete="off"/>
    </el-form-item>
    <el-form-item label="是否下单" :label-width="formLabelWidth">
    <el-radio-group v-model="productForm.status">
      <el-radio value="1">是</el-radio>
      <el-radio value="0">否</el-radio>
    </el-radio-group>
  </el-form-item>
    <el-form-item label="产品主图" :label-width="formLabelWidth">
      <el-upload
  class="avatar-uploader"
  :action="uploadUrl"
  :show-file-list="false"
  :on-success="handleAvatarSuccess"
  :before-upload="beforeAvatarUpload"
>
  <img style="width:100px;height: 100px;" v-if="productForm.img" :src="productForm.img" class="avatar" />
  <el-icon v-else class="avatar-uploader-icon"><Plus /></el-icon>
</el-upload>
    </el-form-item>
    <el-form-item label="需求供应反馈" :label-width="formLabelWidth">
      <MceEditor v-model="productForm.content"/>
    </el-form-item>
  </el-form>
  <template #footer>
    <div class="dialog-footer">
      <el-button @click="dialogFormVisible = false">取消</el-button>
      <el-button type="primary" @click="onSubmit" v-if="dialogMode == 'add'">确认新增</el-button>
      <el-button type="primary" @click="onSubmitEdit" v-if="dialogMode == 'edit'">确认修改</el-button>
    </div>
  </template>
</el-dialog>
  <el-table :data="productList" style="width: 100%">
  <el-table-column prop="id" label="订单编号" />
  <el-table-column prop="productName" label="产品名称" width="180" />
  <el-table-column prop="img" label="产品图片" width="180">
      <template #default="scope">
        <el-image style="width: 100px; height: 100px" :src="scope.row.img" />
      </template>
    </el-table-column>
  <el-table-column prop="shotDesc" label="产品需求" width="180" />
  <el-table-column prop="price" label="价格" />
  <el-table-column prop="catName" label="分类" />
  <el-table-column prop="status" label="订单状态" >
    <template #default="scope">
     <el-tag type="primary" v-if="scope.row.status == '0'">已取消</el-tag>
     <el-tag type="success" v-if="scope.row.status != '0'">已下单</el-tag>
    </template>
  </el-table-column>
  <el-table-column prop="createBy" label="创建者" />
  <el-table-column prop="ops" label="操作" width="180">
    <template #default="scope">
      <el-button type="primary" @click="editProduct(scope.row)">编辑</el-button>
      <el-button type="danger"   @click="removeProduct(scope.row.id)">删除</el-button>
    </template>
  </el-table-column>
</el-table>
<el-pagination
  :page-size="query.pageSize"
  :pager-count="10"
  layout="prev, pager, next"
  :total="totals"
  @change="changePage"
/>
</template>
<script setup>
import {ref} from "vue";
import { getProductListApi3,addProductApi3,editProductApi3, deleteProductApi3 } from "@/utils/api.js";
import MceEditor from "@/components/MceEditor.vue";
import { ElMessage } from 'element-plus';
//定义上传接口地址
const uploadUrl = import.meta.env.VITE_BASE_API + "/pubfile/upload/imgs";

const imageUrl = ref('')

const productList = ref([
  { id: 1, img: 'image_url_1', productName: 'Product 1', price: 100 },
  { id: 2, img: 'image_url_2', productName: 'Product 2', price: 200 },
  // 更多产品...
]);

const handleAvatarSuccess = (res,uploadFile) => {
  productForm.value.img=res.data.url;
  //imageUrl.value = URL.createObjectURL(uploadFile.raw!)
}
//分页
const totals=ref(100);
let query=ref({
    pageNum:1,
    pageSize:10,
    pname: ''
});
let dialogFormVisible=ref(false);//是否显示弹出框
let dialogMode=ref("add");//编辑和新增共用弹出框，所以需要动态确定弹出框是新增的还是编辑的
const formLabelWidth="80px";
const productForm=ref({
  productName: '',
  price: '',
  catName: '',
  shotDesc: '',
  status: '1', // 默认值
  img: '',
  content: ''
});

//获取产品列表
let getList = () => {
    getProductListApi3(query.value).then((res) => {
    productList.value = res.data.list;
    totals.value = res.data.total;
  }).catch((err) => {
    console.error(err);
    alert("获取产品列表失败，请稍后再试");
  });
};
getList();

const searchProducts = () => {

  query.value.pageNum = 1;  
  getList();  
}

const changePage=(pageNum)=>{
    query.value.pageNum=pageNum;
    //页码发生变化，重新发送网络分页请求
    getList();
};
let onSubmit = () => {
  // 发送新增请求
  addProductApi3(productForm.value)
    .then((res) => {
      // 新增成功，关闭弹窗并重新获取产品列表
      dialogFormVisible.value = false;
      getList();
      alert("新增产品成功！");
    })
    .catch((err) => {
      console.error(err);
      alert("新增产品失败，请稍后再试");
    });
};
let onSubmitEdit = () => {
  // 发送编辑请求
  editProductApi3(productForm.value)
    .then((res) => {
      // 编辑成功，关闭弹窗并重新获取产品列表
      dialogFormVisible.value = false;
      getList();
      alert("编辑产品成功！");
    })
    .catch((err) => {
      console.error(err);
      alert("编辑产品失败，请稍后再试");
    });
};

let editProduct = (product) => {
  let {id, productName, price, shotDesc, img, status, content} = product;
  let eproduct = {id, productName, price, shotDesc, img, status, content};
  productForm.value = eproduct;  
  dialogFormVisible.value = true;  
  dialogMode.value = "edit";  
};

let addProduct = () => {
  productForm.value = {
    productName: '',
    price: '',
    catName: '',
    shotDesc: '',
    status: '1',  // 默认值
    img: '',
    content: ''
  }; // 重置表单数据
  dialogFormVisible.value = true;
  dialogMode.value = "add";  // 设置为新增模式
};

// 删除指定产品的方法
let removeProduct = (productId) => {
   deleteProductApi3(productId).then((res) => {
      ElMessage({
        message: '删除成功',
        type: 'success',
      });
      getList();
    }).catch((err) => {
      ElMessage.error('删除失败，请检查')
    });
  };

// 回调来处理上传前的验证操作
const beforeAvatarUpload = (file) => {
  const isImage = file.type.startsWith('image/');
  if (!isImage) {
    alert('请上传图片文件');
  }
  return isImage;
};
</script>

<style>
.avatar-uploader .el-upload {
  border: 1px solid red;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
  transition: var(--el-transition-duration-fast);
}

.avatar-uploader .el-upload:hover {
  border-color: var(--el-color-primary);
}

.el-icon.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 80px;
  height: 80px;
  text-align: center;
  border: 1px solid red;
}
</style>