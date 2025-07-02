<template>
  <div class="action-buttons">
    <el-input
      :clearable="true"
      v-model="query.pname"
      style="width: 240px"
      placeholder="输入用户名模糊查询姓名"
    />
    <el-button type="success" @click="searchProducts">点击搜索</el-button>
    <el-button type="success" @click="addProduct">新增产品</el-button>
    <el-button type="success" @click="addWarehouse">入库操作</el-button>
  </div>

  <!-- 产品对话框 -->
  <el-dialog z-index="100" v-model="dialogFormVisible" :title="dialogMode=='add' ? '新建产品' : '编辑信息'" width="1000">
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
      <el-form-item label="产品简介" :label-width="formLabelWidth">
        <el-input v-model="productForm.shotDesc" autocomplete="off"/>
      </el-form-item>
      <el-form-item label="是否上架" :label-width="formLabelWidth">
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
      <el-form-item label="详细描述" :label-width="formLabelWidth">
        <MceEditor v-model="productForm.content"/>
      </el-form-item>
    </el-form>
    <template #footer>
      <div class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取消</el-button>
        <el-button type="primary" @click="onSubmitProduct" v-if="dialogMode === 'add'">确认新增</el-button>
        <el-button type="primary" @click="onSubmitEditProduct" v-if="dialogMode === 'edit'">确认修改</el-button>
      </div>
    </template>
  </el-dialog>

  <!-- 仓库对话框 -->
  <el-dialog z-index="100" v-model="dialogFormVisible1" :title="dialogMode1==='add' ? '新建仓库':'编辑信息'" width="1000">
    <el-form :model="productForm1">
      <el-form-item label="仓库名称" :label-width="formLabelWidth">
        <el-input v-model="productForm1.productName" autocomplete="off" />
      </el-form-item>
      <el-form-item label="仓库负责人联系电话" :label-width="formLabelWidth">
        <el-input v-model="productForm1.price" autocomplete="off" />
      </el-form-item>
      <el-form-item label="仓库存储类别">
        <el-select v-model="productForm1.catName" placeholder="请选择仓库存储类别">
          <el-option label="加工类" value="加工类" />
          <el-option label="原料类" value="原料类" />
          <el-option label="基建设施储备" value="基建设设施储备" />
          <el-option label="能源类" value="能源类" />
        </el-select>
      </el-form-item>
      <el-form-item label="商品ID" :label-width="formLabelWidth">
        <el-input v-model="productForm1.shotDesc" autocomplete="off"/>
      </el-form-item>
      <el-form-item label="请确认入库操作" :label-width="formLabelWidth">
        <el-radio-group v-model="productForm1.status">
          <el-radio value="1">是</el-radio>
          <el-radio value="0">否</el-radio>
        </el-radio-group>
      </el-form-item>
      <el-form-item label="产品主图" :label-width="formLabelWidth">
        <el-upload
          class="avatar-uploader"
          :action="uploadUrl"
          :show-file-list="false"
          :on-success="handleAvatarSuccessWarehouse"
          :before-upload="beforeAvatarUpload"
        >
          <img style="width:100px;height: 100px;" v-if="productForm1.img" :src="productForm1.img" class="avatar" />
          <el-icon v-else class="avatar-uploader-icon"><Plus /></el-icon>
        </el-upload>
      </el-form-item>
      <el-form-item label="仓库详细描述" :label-width="formLabelWidth">
        <MceEditor v-model="productForm1.content"/>
      </el-form-item>
    </el-form>
    <template #footer>
      <div class="dialog-footer">
        <el-button @click="dialogFormVisible1 = false">取消</el-button>
        <el-button type="primary" @click="onSubmitWarehouse" v-if="dialogMode1 === 'add'">确认新增</el-button>
        <el-button type="primary" @click="onSubmitEditWarehouse" v-if="dialogMode1 === 'edit'">确认修改</el-button>
      </div>
    </template>
  </el-dialog>

  <el-table :data="productList" style="width: 100%">
    <el-table-column prop="id" label="数据库ID" />
    <el-table-column prop="productName" label="产品名称" width="180" />
    <el-table-column prop="img" label="产品图片" width="180">
      <template #default="scope">
        <el-image style="width: 100px; height: 100px" :src="scope.row.img" />
      </template>
    </el-table-column>
    <el-table-column prop="shotDesc" label="产品描述" width="180" />
    <el-table-column prop="price" label="价格" />
    <el-table-column prop="catName" label="分类" />
    <el-table-column prop="status" label="产品状态">
      <template #default="scope">
        <el-tag type="primary" v-if="scope.row.status == '0'">已下架</el-tag>
        <el-tag type="success" v-if="scope.row.status != '0'">已发布</el-tag>
      </template>
    </el-table-column>
    <el-table-column prop="createBy" label="创建者" />
    <el-table-column prop="ops" label="操作" width="180">
      <template #default="scope">
        <el-button type="primary" @click="editProduct(scope.row)">编辑</el-button>
        <el-button type="danger" @click="removeProduct(scope.row.id)">删除</el-button>
      </template>
    </el-table-column>
  </el-table>

  <el-pagination
    :page-size="query.pageSize"
    :pager-count="5"
    layout="prev, pager, next"
    :total="totals"
    @change="changePage"
  />
</template>

<script setup>
import { ref } from "vue";
import { getProductListApi, addProductApi2, addProductApi, editProductApi, deleteProductApi } from "@/utils/api.js";
import MceEditor from "@/components/MceEditor.vue";
import { ElMessage } from 'element-plus';

// 定义上传接口地址
const uploadUrl = import.meta.env.VITE_BASE_API + "/pubfile/upload/imgs";

const productList = ref([]);
const totals = ref(0);
const query = ref({
    pageNum: 1,
    pageSize: 5,
    pname: ''
});
let dialogFormVisible = ref(false);
let dialogMode = ref("add");
const formLabelWidth = "80px";

const productForm = ref({
  productName: '',
  price: '',
  catName: '',
  shotDesc: '',
  status: '1',
  img: '',
  content: ''
});

const productForm1 = ref({
  productName: '',
  price: '',
  catName: '',
  shotDesc: '',
  status: '1',
  img: '',
  content: ''
});

let dialogFormVisible1 = ref(false);
let dialogMode1 = ref("add");

// 处理产品主图上传成功
const handleAvatarSuccess = (res) => {
  productForm.value.img = res.data.url;
};

// 处理仓库主图上传成功
const handleAvatarSuccessWarehouse = (res) => {
  productForm1.value.img = res.data.url;
};

// 获取产品列表
const getList = () => {
  getProductListApi(query.value)
    .then((res) => {
      productList.value = res.data.list;
      totals.value = res.data.total;
    })
    .catch((err) => {
      console.error(err);
      alert("获取产品列表失败，请稍后再试");
    });
};
getList();

// 根据查询条件搜索产品
const searchProducts = () => {
  query.value.pageNum = 1;
  getList();
};

// 处理分页变化
const changePage = (pageNum) => {
  query.value.pageNum = pageNum;
  getList();
};

// 提交新增产品
const onSubmitProduct = () => {
  addProductApi(productForm.value)
    .then((res) => {
      dialogFormVisible.value = false;
      getList();
      alert("新增产品成功！");
    })
    .catch((err) => {
      console.error(err);
      alert("新增产品失败，请稍后再试");
    });
};

// 提交编辑产品
const onSubmitEditProduct = () => {
  editProductApi(productForm.value)
    .then((res) => {
      dialogFormVisible.value = false;
      getList();
      alert("编辑产品成功！");
    })
    .catch((err) => {
      console.error(err);
      alert("编辑产品失败，请稍后再试");
    });
};

// 编辑产品数据
const editProduct = (product) => {
  productForm.value = { ...product };  
  dialogFormVisible.value = true;  
  dialogMode.value = "edit";  
};

// 打开新增产品对话框
const addProduct = () => {
  productForm.value = {
    productName: '',
    price: '',
    catName: '',
    shotDesc: '',
    status: '1',
    img: '',
    content: ''
  };
  dialogFormVisible.value = true;
  dialogMode.value = "add";
};

// 删除指定产品
const removeProduct = (productId) => {
  deleteProductApi(productId)
    .then((res) => {
      ElMessage({
        message: '删除成功',
        type: 'success',
      });
      getList();
    })
    .catch((err) => {
      ElMessage.error('删除失败，请检查');
    });
};

// 打开仓库新增操作对话框
const addWarehouse = () => {
  productForm1.value = {
    productName: '',
    price: '',
    catName: '',
    shotDesc: '',
    status: '1',
    img: '',
    content: ''
  };
  dialogFormVisible1.value = true;
  dialogMode1.value = "add";  
};

// 提交新增仓库
const onSubmitWarehouse = () => {
  addProductApi2(productForm1.value) // 这里应该是添加仓库的 API 调用
    .then((res) => {
      dialogFormVisible1.value = false;
      ElMessage({
        message: '新增仓库成功！',
        type: 'success',
      });
      
    })
    .catch((err) => {
      console.error(err);
      alert("新增仓库失败，请稍后再试");
    });
};

// 提交编辑仓库
const onSubmitEditWarehouse = () => {
  // 在这里实现编辑仓库的功能
  alert('仓库编辑功能尚未实现');
};

// 上传前的验证操作
const beforeAvatarUpload = (file) => {
  const isImage = file.type.startsWith('image/');
  if (!isImage) {
    alert('请上传图片文件');
  }
  return isImage;
};

</script>

<style>
.action-buttons {
  margin-bottom: 20px; /* 控制整体底部空间 */
}

.action-buttons .el-button {
  margin-right: 10px; /* 按钮之间的间距 */
}

/* 其他样式 */
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