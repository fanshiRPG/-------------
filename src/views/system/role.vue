<template>
    <el-input
     :clearable="true"
     v-model="query.pname"
     style="width: 240px"
     placeholder="输入用户名模糊查询姓名"
   />
   <el-button type="success" @click="searchProducts">点击搜索</el-button>
 
 <el-button type="success" @click="addProduct">新增供应商</el-button>
 <el-dialog z-index="100" v-model="dialogFormVisible" :title="dialogMode=='add' ?'新增信息':'编辑信息'" width="1000">
   <el-form :model="productForm">

    <el-form-item label="供应商名称" :label-width="formLabelWidth">
  <el-input v-model="productForm.productName" autocomplete="off">
    <template #prepend><span>供应商名称</span></template>
  </el-input>
</el-form-item>

<el-form-item label="联系方式" :label-width="formLabelWidth">
  <el-input v-model="productForm.price" autocomplete="off">
    <template #prepend><span>联系方式</span></template>
  </el-input>
</el-form-item>

<el-form-item label="供应商类别">
  <el-select v-model="productForm.catName" placeholder="请选择供应商类别">
    <template #prepend><span>供应商类别</span></template>
    <el-option label="稳定型" value="稳定型" />
    <el-option label="特殊型" value="特殊型" />
    <el-option label="领头型" value="领头型" />
    <el-option label="先进技术型" value="先进技术型" />
  </el-select>
</el-form-item>

<el-form-item label="供应商简介" :label-width="formLabelWidth">
  <el-input v-model="productForm.shotDesc" autocomplete="off">
    <template #prepend><span>供应商简介</span></template>
  </el-input>
</el-form-item>

<el-form-item label="产品是否上架" :label-width="formLabelWidth">
  <el-radio-group v-model="productForm.status">
    <el-radio value="1">是</el-radio>
    <el-radio value="0">否</el-radio>
  </el-radio-group>
</el-form-item>

<el-form-item label="供应产品详细描述" :label-width="formLabelWidth">
  <MceEditor v-model="productForm.content" />
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
   <el-table-column prop="id" label="数据库ID" />
   <el-table-column prop="productName" label="供应商名称" width="180" />
   <el-table-column prop="img" label="主打产品图片" width="180">
       <template #default="scope">
         <el-image style="width: 100px; height: 100px" :src="scope.row.img" />
       </template>
     </el-table-column>
   <el-table-column prop="shotDesc" label="供应商描述" width="180" />
   <el-table-column prop="price" label="联系方式" />
   <el-table-column prop="catName" label="供应商分类" />
   <el-table-column prop="status" label="产品状态" >
     <template #default="scope">
      <el-tag type="primary" v-if="scope.row.status == '0'">已下架</el-tag>
      <el-tag type="success" v-if="scope.row.status != '0'">已发布</el-tag>
     </template>
   </el-table-column>
   <el-table-column prop="createBy" label="公司法人" />
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
 import { getProductListApi1,addProductApi1,editProductApi1,deleteProductApi1 } from "@/utils/api.js";
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
     getProductListApi1(query.value).then((res) => {
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
   addProductApi1(productForm.value)
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
   editProductApi1(productForm.value)
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
   deleteProductApi1(productId).then((res) => {
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