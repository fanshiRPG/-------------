import request from "./request.js";

// post请求需要使用data参数
export function authlogin(data) {
  return request({
    url: "/login",
    method: "POST",
    data: data,
  });
}

export function addUserApi(params) {
  return request(
    {
      url: '/sysUser/add',
      method: 'get',
      params: params
    }
  )
}

export function addUserApi1(params) {
  return request(
    {
      url: '/sysUser1/add',
      method: 'get',
      params: params
    }
  )
}

export function getProductList(params) {
  return request(
    {
      url: '/product/list',
      method: 'get',
      params: params
    }
  )
}

// get请求需要使用params参数
export function getProductKu2ListApi(params) {
  return request(
    {
      url: '/productKu2/list',
      method: 'get',
      params: params
    }
  )
}

export function getProductListApi(params) {
  return request(
    {
      url: '/product/list',
      method: 'get',
      params: params
    }
  )
}

export function getProductKu1ListApi(params) {
  return request(
    {
      url: '/productKu1/list',
      method: 'get',
      params: params
    }
  )
}

export function getProductListApi3(params) {
  return request(
    {
      url: '/product3/list',
      method: 'get',
      params: params
    }
  )
}

export function getProductListApi2(params) {
  return request(
    {
      url: '/product2/list',
      method: 'get',
      params: params
    }
  )
}


export function getProductListApi1(params) {
  return request(
    {
      url: '/product1/list',
      method: 'get',
      params: params
    }
  )
}

//用户注册是不需要认证的
export function registUserApi(params) {
  return request(
    {
      url: '/prev/registUser',
      method: 'get',
      params: params
    }
  )
}

export function logLoginApi(params) {
  return request(
    {
      url: '/api/logs/addLog',
      method: 'get',
      params: params
    }
  )
}

export function removeUserApi(userId){
  return request({
    url: "/sysUser/remove/"+userId,
    method: "POST",
    data: {},
  });
}


export function removeUserApi1(userId){
  return request({
    url: "/sysUser1/remove/"+userId,
    method: "POST",
    data: {},
  });
}

//新增产品
export function addProductApi(params) {
  return request(
    {
      url: '/product/add',
      method: 'get',
      params: params
    }
  )
}

export function addProductKu2Api(params) {
  return request(
    {
      url: '/productKu2/add',
      method: 'get',
      params: params
    }
  )
}

export function addProductApi3(params) {
  return request(
    {
      url: '/product3/add',
      method: 'get',
      params: params
    }
  )
}

export function addProductApi2(params) {
  return request(
    {
      url: '/product2/add',
      method: 'get',
      params: params
    }
  )
}

export function addProductApi1(params) {
  return request(
    {
      url: '/product1/add',
      method: 'get',
      params: params
    }
  )
}
//修改产品
export function editProductApi(params) {
  return request(
    {
      url: '/product/edit',
      method: 'get',
      params: params
    }
  )
}


export function editProductKu2Api(params) {
  return request(
    {
      url: '/productKu2/edit',
      method: 'get',
      params: params
    }
  )
}
export function editProductApi3(params) {
  return request(
    {
      url: '/product3/edit',
      method: 'get',
      params: params
    }
  )
}

export function editProductApi2(params) {
  return request(
    {
      url: '/product2/edit',
      method: 'get',
      params: params
    }
  )
}

export function editProductApi1(params) {
  return request(
    {
      url: '/product1/edit',
      method: 'get',
      params: params
    }
  )
}

//删除产品
export function deleteProductApi(productId) {
  return request(
    {
      url: "/product/remove/"+productId,
      method: 'post',
      data:{}
    }
  )
}
export function deleteProductKu2Api(productId) {
  return request(
    {
      url: "/productKu2/remove/"+productId,
      method: 'post',
      data:{}
    }
  )
}
export function deleteProductApi3(productId) {
  return request(
    {
      url: "/product3/remove/"+productId,
      method: 'post',
      data:{}
    }
  )
}

export function deleteProductApi2(productId) {
  return request(
    {
      url: "/product2/remove/"+productId,
      method: 'post',
      data:{}
    }
  )
}
export function deleteProductApi21(productName) {
  return request(
    {
      url: "/product2/remove1/"+productName,
      method: 'post',
      data:{}
    }
  )
}

export function deleteProductApi1(productId) {
  return request(
    {
      url: "/product1/remove/"+productId,
      method: 'post',
      data:{}
    }
  )
}
//不需要权限就可以访问的产品列表
export function precProductListApi(params) {
  return request(
    {
      url: '/prev/productlist',
      method: 'get',
      params: params
    }
  )
}

export function preProductDetailApi(params) {
  return request(
    {
      url: '/prev/getProductDetail',
      method: 'get',
      params: params
    }
  )
}

export function updateUserApi(params) {
  return request(
    {
      url: '/sysUser/update',
      method: 'post',
      params: params
    }
  )
}

export function updateUserApi1(params) {
  return request(
    {
      url: '/sysUser1/update',
      method: 'get',
      params: params
    }
  )
}

//获取用户列表
export function UserListApi(data) {
  return request({
    url: "/sysUser/getList",
    method: "POST",
    data: data,
  });
}

export function UserListApi1(data) {
  return request({
    url: "/sysUser1/getList",
    method: "POST",
    data: data,
  });
}

export function loginLogaddApi(params) {
  return request(
    {
      url: '/api/logs',
      method: 'post',
      params: params
    }
  )
}
export function loginLogeditApi(params) {
  return request(
    {
      url: '/loginLog/edit',
      method: 'get',
      params: params
    }
  )
}
export function deleteLogApi(params) {
  return request(
    {
      url: '/api/logs/{id}',
      method: 'get',
      params: params
    }
  )
}
export function fetchLogsApi(params) {
  return request(
    {
      url: '/loginLog/fetchLogs',
      method: 'get',
      params: params
    }
  )
}


