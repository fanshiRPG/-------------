<template>
  <div class="main">
  <!-- 顶部 -->
  <div class="top-nav">
    <div class="language mr5">
      <svg class="icon" aria-hidden="true">
        <use xlink:href="#icon-wangqiu"></use>
      </svg>
      <span>中国</span>
    </div>
    <div class="phone mr40">
      <svg class="icon" aria-hidden="true">
        <use xlink:href="#icon-shouji"></use>
      </svg>
      <span>手机云企业App</span>
    </div>
  </div>
  <!-- 导航栏 -->
  <div class="navs">
    <div class="logo mr10">
      <svg class="icon-logo" aria-hidden="true">
        <use xlink:href="#icon-huaweiyun"></use>
      </svg>
      <span class="logo-info"><a href="#">手机专卖</a></span>
    </div>
    <div class="nav">
      <ul>
        <li v-for="(item,index) in topNavs" :key="index"><a target="_blank" :href="item.link">{{ item.name }}</a></li>
      </ul>
    </div>
    <div class="others">
      <div class="search">
        <svg class="icon-search" aria-hidden="true">
          <use xlink:href="#icon-sousuo"></use>
        </svg>
      </div>
      <div class="login">
        <ul>
          <li><a href="#" class="front">联系我们</a></li>
          <li><a href="#" class="front">ICP备案</a></li>
          <li><a href="#" class="front">文档</a></li>
          <li><a href="#" class="front">控制台</a></li>
          <li><router-link to="/login">登录</router-link></li>
          <li><router-link to="/regist">注册</router-link></li>
        </ul>
      </div>
    </div>
  </div>
  <!-- 云上优选背景图 -->
  <div class="cloud">
    <div class="container">
      <span class="cloud-title">云上优选 特惠来袭</span>
      <p class="summary">汇聚全站年度销量TOP云产品，以下多重好礼等你拿</p>
    </div>
  </div>
  <!-- 四个小banner -->
  <div class="banners backgroundSize">
    <ul>
      <li class="small-banner">
        <span>2核2g服务器33元起</span>
        <span>2核2g服务器33元起</span>
      </li>
      <li class="small-banner">
        <span>2核2g服务器33元起</span>
        <span>2核2g服务器33元起</span>
      </li>
      <li class="small-banner">
        <span>2核2g服务器33元起</span>
        <span>2核2g服务器33元起</span>
      </li>
      <li class="small-banner">
        <span>2核2g服务器33元起</span>
        <span>2核2g服务器33元起</span>
      </li>
    </ul>
  </div>
  <!-- 限时秒杀区 -->
  <div class="title-info backgroundSize">
    <div class="title">
      <span>限时秒杀专区</span>
      <span class="ps-lim">我是老用户，看看新老同享</span>
    </div>
    <div class="summary">
      <span>每日限量抢购，优惠仅限1单，抢完即止！ <a href="">L实例镜像怎么选？</a><a href="">活动规则</a></span>
    </div>
  </div>
  <div class="product-container backgroundSize">
    <div class="product-box mt10">
      <div class="top">
        <span class="title">2核2G3M 云耀L实例 1年</span>
        <div class="info">
          <p class="summary">初创企业建站、电商店铺管理优选，价优随心用</p>
          <p class="tag">新用户专享</p>
          <p class="tag">限购1台</p>
        </div>
      </div>
      <div class="body">
        <div class="box">
          <label for="mirror">镜像 </label>
          <select name="mirror" id="mirror">
            <option value="1">企业建站系统 WordPress</option>
            <option value="1">企业建站系统 WordPress</option>
            <option value="1">企业建站系统 WordPress</option>
            <option value="1">企业建站系统 WordPress</option>
            <option value="1">企业建站系统 WordPress</option>
          </select>
        </div>
        <div class="box">
          <label for="pack">流量包</label>
          <span id="pack">40G/月</span>
        </div>
        <div class="box">
          <label for="sys">系统盘</label>
          <span id="sys">40GB</span>
        </div>
      </div>
      <div class="footer mt20">
    <div class="line-fir">
      <span class="price">￥{{ product.price }}</span>
      <p class="discount ml10">优惠后￥{{ product.discountPrice }}</p>
    </div>
    <div class="line-sec">
      <button class="im-afford" @click="addToCart">
        立即购买<span class="area-afford">已购40%</span>
      </button>
    </div>
  </div>
    </div>
    <div class="product-box mt10">
      <div class="top">
        <span class="title">2核2G3M 云耀L实例 1年</span>
        <div class="info">
          <p class="summary">初创企业建站、电商店铺管理优选，价优随心用</p>
          <p class="tag">新用户专享</p>
          <p class="tag">限购1台</p>
        </div>
      </div>
      <div class="body">
        <div class="box">
          <label for="mirror">镜像 </label>
          <select name="mirror" id="mirror">
            <option value="1">企业建站系统 WordPress</option>
            <option value="1">企业建站系统 WordPress</option>
            <option value="1">企业建站系统 WordPress</option>
            <option value="1">企业建站系统 WordPress</option>
            <option value="1">企业建站系统 WordPress</option>
          </select>
        </div>
        <div class="box">
          <label for="pack">流量包</label>
          <span id="pack">40G/月</span>
        </div>
        <div class="box">
          <label for="sys">系统盘</label>
          <span id="sys">40GB</span>
        </div>
      </div>
      <div class="footer mt20">
    <div class="line-fir">
      <span class="price">￥{{ product.price }}</span>
      <p class="discount ml10">优惠后￥{{ product.discountPrice }}</p>
    </div>
    <div class="line-sec">
      <button class="im-afford" @click="addToCart">
        立即购买<span class="area-afford">已购40%</span>
      </button>
    </div>
  </div>
    </div>
    <div class="product-box mt10">
      <div class="top">
        <span class="title">2核2G3M 云耀L实例 1年</span>
        <div class="info">
          <p class="summary">初创企业建站、电商店铺管理优选，价优随心用</p>
          <p class="tag">新用户专享</p>
          <p class="tag">限购1台</p>
        </div>
      </div>
      <div class="body">
        <div class="box">
          <label for="mirror">镜像 </label>
          <select name="mirror" id="mirror">
            <option value="1">企业建站系统 WordPress</option>
            <option value="1">企业建站系统 WordPress</option>
            <option value="1">企业建站系统 WordPress</option>
            <option value="1">企业建站系统 WordPress</option>
            <option value="1">企业建站系统 WordPress</option>
          </select>
        </div>
        <div class="box">
          <label for="pack">流量包</label>
          <span id="pack">40G/月</span>
        </div>
        <div class="box">
          <label for="sys">系统盘</label>
          <span id="sys">40GB</span>
        </div>
      </div>
      <div class="footer mt20">
    <div class="line-fir">
      <span class="price">￥{{ product.price }}</span>
      <p class="discount ml10">优惠后￥{{ product.discountPrice }}</p>
    </div>
    <div class="line-sec">
      <button class="im-afford" @click="addToCart">
        立即购买<span class="area-afford">已购40%</span>
      </button>
    </div>
  </div>
    </div>
    <div class="product-box mt10">
      <div class="top">
        <span class="title">2核2G3M 云耀L实例 1年</span>
        <div class="info">
          <p class="summary">初创企业建站、电商店铺管理优选，价优随心用</p>
          <p class="tag">新用户专享</p>
          <p class="tag">限购1台</p>
        </div>
      </div>
      <div class="body">
        <div class="box">
          <label for="mirror">镜像 </label>
          <select name="mirror" id="mirror">
            <option value="1">企业建站系统 WordPress</option>
            <option value="1">企业建站系统 WordPress</option>
            <option value="1">企业建站系统 WordPress</option>
            <option value="1">企业建站系统 WordPress</option>
            <option value="1">企业建站系统 WordPress</option>
          </select>
        </div>
        <div class="box">
          <label for="pack">流量包</label>
          <span id="pack">40G/月</span>
        </div>
        <div class="box">
          <label for="sys">系统盘</label>
          <span id="sys">40GB</span>
        </div>
      </div>
      <div class="footer mt20">
    <div class="line-fir">
      <span class="price">￥{{ product.price }}</span>
      <p class="discount ml10">优惠后￥{{ product.discountPrice }}</p>
    </div>
    <div class="line-sec">
      <button class="im-afford" @click="addToCart">
        立即购买<span class="area-afford">已购40%</span>
      </button>
    </div>
  </div>
    </div>
    <div class="product-box mt10">
      <div class="top">
        <span class="title">2核2G3M 云耀L实例 1年</span>
        <div class="info">
          <p class="summary">初创企业建站、电商店铺管理优选，价优随心用</p>
          <p class="tag">新用户专享</p>
          <p class="tag">限购1台</p>
        </div>
      </div>
      <div class="body">
        <div class="box">
          <label for="mirror">镜像 </label>
          <select name="mirror" id="mirror">
            <option value="1">企业建站系统 WordPress</option>
            <option value="1">企业建站系统 WordPress</option>
            <option value="1">企业建站系统 WordPress</option>
            <option value="1">企业建站系统 WordPress</option>
            <option value="1">企业建站系统 WordPress</option>
          </select>
        </div>
        <div class="box">
          <label for="pack">流量包</label>
          <span id="pack">40G/月</span>
        </div>
        <div class="box">
          <label for="sys">系统盘</label>
          <span id="sys">40GB</span>
        </div>
      </div>
      <div class="footer mt20">
    <div class="line-fir">
      <span class="price">￥{{ product.price }}</span>
      <p class="discount ml10">优惠后￥{{ product.discountPrice }}</p>
    </div>
    <div class="line-sec">
      <button class="im-afford" @click="addToCart">
        立即购买<span class="area-afford">已购40%</span>
      </button>
    </div>
  </div>
    </div>
    <div class="product-box mt10">
      <div class="top">
        <span class="title">2核2G3M 云耀L实例 1年</span>
        <div class="info">
          <p class="summary">初创企业建站、电商店铺管理优选，价优随心用</p>
          <p class="tag">新用户专享</p>
          <p class="tag">限购1台</p>
        </div>
      </div>
      <div class="body">
        <div class="box">
          <label for="mirror">镜像 </label>
          <select name="mirror" id="mirror">
            <option value="1">企业建站系统 WordPress</option>
            <option value="1">企业建站系统 WordPress</option>
            <option value="1">企业建站系统 WordPress</option>
            <option value="1">企业建站系统 WordPress</option>
            <option value="1">企业建站系统 WordPress</option>
          </select>
        </div>
        <div class="box">
          <label for="pack">流量包</label>
          <span id="pack">40G/月</span>
        </div>
        <div class="box">
          <label for="sys">系统盘</label>
          <span id="sys">40GB</span>
        </div>
      </div>
      <div class="footer mt20">
    <div class="line-fir">
      <span class="price">￥{{ product.price }}</span>
      <p class="discount ml10">优惠后￥{{ product.discountPrice }}</p>
    </div>
    <div class="line-sec">
      <button class="im-afford" @click="addToCart">
        立即购买<span class="area-afford">已购40%</span>
      </button>
    </div>
  </div>
    </div>
    <div class="product-box mt10">
      <div class="top">
        <span class="title">2核2G3M 云耀L实例 1年</span>
        <div class="info">
          <p class="summary">初创企业建站、电商店铺管理优选，价优随心用</p>
          <p class="tag">新用户专享</p>
          <p class="tag">限购1台</p>
        </div>
      </div>
      <div class="body">
        <div class="box">
          <label for="mirror">镜像 </label>
          <select name="mirror" id="mirror">
            <option value="1">企业建站系统 WordPress</option>
            <option value="1">企业建站系统 WordPress</option>
            <option value="1">企业建站系统 WordPress</option>
            <option value="1">企业建站系统 WordPress</option>
            <option value="1">企业建站系统 WordPress</option>
          </select>
        </div>
        <div class="box">
          <label for="pack">流量包</label>
          <span id="pack">40G/月</span>
        </div>
        <div class="box">
          <label for="sys">系统盘</label>
          <span id="sys">40GB</span>
        </div>
      </div>
      <div class="footer mt20">
    <div class="line-fir">
      <span class="price">￥{{ product.price }}</span>
      <p class="discount ml10">优惠后￥{{ product.discountPrice }}</p>
    </div>
    <div class="line-sec">
      <button class="im-afford" @click="addToCart">
        立即购买<span class="area-afford">已购40%</span>
      </button>
    </div>
  </div>
    </div>
    <div class="product-box mt10">
      <div class="top">
        <span class="title">2核2G3M 云耀L实例 1年</span>
        <div class="info">
          <p class="summary">初创企业建站、电商店铺管理优选，价优随心用</p>
          <p class="tag">新用户专享</p>
          <p class="tag">限购1台</p>
        </div>
      </div>
      <div class="body">
        <div class="box">
          <label for="mirror">镜像 </label>
          <select name="mirror" id="mirror">
            <option value="1">企业建站系统 WordPress</option>
            <option value="1">企业建站系统 WordPress</option>
            <option value="1">企业建站系统 WordPress</option>
            <option value="1">企业建站系统 WordPress</option>
            <option value="1">企业建站系统 WordPress</option>
          </select>
        </div>
        <div class="box">
          <label for="pack">流量包</label>
          <span id="pack">40G/月</span>
        </div>
        <div class="box">
          <label for="sys">系统盘</label>
          <span id="sys">40GB</span>
        </div>
      </div>
      <div class="footer mt20">
    <div class="line-fir">
      <span class="price">￥{{ product.price }}</span>
      <p class="discount ml10">优惠后￥{{ product.discountPrice }}</p>
    </div>
    <div class="line-sec">
      <button class="im-afford" @click="addToCart">
        立即购买<span class="area-afford">已购40%</span>
      </button>
    </div>
  </div>
    </div>
  </div>
  <div class="more mt5">
    <span>
      展开更多
      <div id="yi">
        <ul class="more mt6">
          <li><a href="#">html1</a></li>
          <li><a href="#">html2</a></li>
          <li><a href="#">html3</a></li>
        </ul>
      </div>
    </span>
  </div>
  <!-- 新用户专区 -->
  <div class="title-info backgroundSize">
    <div class="title">
      <span>新用户专区</span>
      <span class="ps-lim">我是老用户，看看新老同享 ></span>
    </div>
    <div class="summary">
      <span>优惠仅限一单！企业新用户可获得更多配额 |<a href="">续费享优惠 </a><a href="">活动规则</a></span>
    </div>
  </div>
  <div class="new-user-banner backgroundSize">
    <ul>
      <li><a href="#" class="new-active">云服务器</a></li>
      <li class="ml40"><a href="#">企业应用</a></li>
      <li class="ml40"><a href="#">CDN&视频云</a></li>
      <li class="ml40"><a href="#">云安全</a></li>
      <li class="ml40"><a href="#">云数据库</a></li>
      <li class="ml40"><a href="#">通信&网络&存储</a></li>
      <li class="ml40"><a href="#">AI&大数据</a></li>
      <li class="ml40"><a href="#">中间件&其他</a></li>
    </ul>
  </div>
  <div class="new_ backgroundSize">
    <div class="left">
      <div class="header">
        <h5 class="text">增强型C7云服务器</h5>
        <div class="sub-title">
          <p style="display: inline-block">
            全维度性能升级，硬件级安全技术加持，全链路可靠性保障
          </p>
          <a href="#">上云推荐></a>
        </div>
        <p class="tag">新用户专享</p>
        <p class="tag">限购1台</p>
      </div>
      <div class="body">
        <div class="box">
          <label for="mirror">规格 </label>
          <select name="mirror" id="mirror">
            <option value="1">2核4G</option>
            <option value="1">4核8G</option>
            <option value="1">4核10G</option>
            <option value="1">8核12G</option>
            <option value="1">16核32G</option>
          </select>
        </div>
        <div class="box">
          <label for="mirror">固定带宽 </label>
          <select name="mirror" id="mirror">
            <option value="1">1M</option>
            <option value="1">2M</option>
            <option value="1">3M</option>
            <option value="1">4M</option>
            <option value="1">5M</option>
          </select>
        </div>
        <div class="box">
          <label for="mirror">数据中心 </label>
          <select name="mirror" id="mirror">
            <option value="1">华北-北京四</option>
            <option value="1">华东-上海一</option>
            <option value="1">华南-广州</option>
          </select>
        </div>
        <div class="box">
          <label for="mirror">时长 </label>
          <select name="mirror" id="mirror">
            <option value="1">1年</option>
            <option value="1">6月</option>
          </select>
        </div>
        <div class="add">
          <input type="checkbox" style="display: block" name="" id="" />
          <p class="ml5 add_text">
            加<strong>40</strong> 元换购价值<strong>480</strong> 元
            <a href="#" class="add_text">主机安全专业版</a>
          </p>
        </div>
        <div class="add">
          <input type="checkbox" style="display: block" name="" id="" />
          <p class="ml5 add_text">
            加<strong>588</strong> 元换购价值<strong>588</strong> 元
            <a href="#" class="add_text">MySQL</a>
          </p>
        </div>
      </div>
      <div class="footer">
        <div class="line-fir">
          <div class="pp">
            <span class="price">￥660.36</span>
            <p class="discount ml10">优惠后￥1662.12</p>
          </div>
          <div class="line-sec">
           <button class="im-afford" @click="addtocart">
        立即购买<span class="area-afford">已购40%</span>
      </button>
          </div>
        </div>
      </div>
    </div>
    <div class="right"></div>
  </div>
  
  <div >
   <div class="shouji-text">
        <p>手机专区</p>
        <i class="iconfont icon-chevronrightyoujiantou"></i>
      </div>
    <ul class="shouji-flex">
        <li v-for="(phone,index) in phonelist" :key="index" style="list-style-type: none;">
            <a href="#" @click="toDetail(phone)">
                <img :src="phone.img" alt="">
                <h5 class="name">{{ phone.productName }}</h5>
                <p class="descr">{{ phone.shotDesc }}</p>
                <p class="price">{{ phone.price }}</p>
            </a>
        </li>
    </ul>
  </div>
  <!-- 特惠优惠卷 -->
  <div class="coupon backgroundSize">
    <h1 class="coup-title">特惠专属礼券</h1>
    <div class="sub-coup-box">
      <p class="sub-coup-title">
        先领券，再下单，更优惠！ <a href="#">活动规则</a>
      </p>
    </div>
  </div>
  <div class="coupon-info-box backgroundSize">
    <div class="coupon-item mr10">
      <div class="card-outer">
        <div class="card-inner">
          <div class="fir">
            <div class="coup-account">￥288</div>
            <div class="upgrade-coup">新购/升级劵</div>
          </div>
          <div class="sec warn">满3188元可用 | 可叠加活动使用</div>
          <div class="thr im-get-box">
            <span class="im-get">
              立即领取
              <svg class="icon" aria-hidden="true">
                <use xlink:href="#icon-shuoming"></use>
              </svg>
            </span>
          </div>
        </div>
      </div>
    </div>
    <div class="coupon-item mr10">
      <div class="card-outer">
        <div class="card-inner">
          <div class="fir">
            <div class="coup-account">￥288</div>
            <div class="upgrade-coup">新购/升级劵</div>
          </div>
          <div class="sec warn">满3188元可用 | 可叠加活动使用</div>
          <div class="thr im-get-box">
            <span class="im-get">
              立即领取
              <svg class="icon" aria-hidden="true">
                <use xlink:href="#icon-shuoming"></use>
              </svg>
            </span>
          </div>
        </div>
      </div>
    </div>
    <div class="coupon-item mr10">
      <div class="card-outer">
        <div class="card-inner">
          <div class="fir">
            <div class="coup-account">￥288</div>
            <div class="upgrade-coup">新购/升级劵</div>
          </div>
          <div class="sec warn">满3188元可用 | 可叠加活动使用</div>
          <div class="thr im-get-box">
            <span class="im-get">
              立即领取
              <svg class="icon" aria-hidden="true">
                <use xlink:href="#icon-shuoming"></use>
              </svg>
            </span>
          </div>
        </div>
      </div>
    </div>
    <div class="coupon-item mr10">
      <div class="card-outer">
        <div class="card-inner">
          <div class="fir">
            <div class="coup-account">￥288</div>
            <div class="upgrade-coup">新购/升级劵</div>
          </div>
          <div class="sec warn">满3188元可用 | 可叠加活动使用</div>
          <div class="thr im-get-box">
            <span class="im-get">
              立即领取
              <svg class="icon" aria-hidden="true">
                <use xlink:href="#icon-shuoming"></use>
              </svg>
            </span>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- 新老用户同享 -->
  <div class="coupon new-and-old backgroundSize">
    <h1 class="coup-title">新老用户同享</h1>
    <div class="sub-coup-box">
      <p class="sub-coup-title">
        精选多款云上产品及服务，满足您一站式上云需求 |<a href="#">更多老用户权益</a>
        <a href="#">活动规则</a>
      </p>
    </div>
  </div>
  <div class="new-user-banner backgroundSize">
    <ul>
      <li><a href="#" class="new-active">云服务器</a></li>
      <li class="ml40"><a href="#">企业应用</a></li>
      <li class="ml40"><a href="#">CDN&视频云</a></li>
      <li class="ml40"><a href="#">云安全</a></li>
      <li class="ml40"><a href="#">云数据库</a></li>
      <li class="ml40"><a href="#">通信&网络&存储</a></li>
      <li class="ml40"><a href="#">AI&大数据</a></li>
      <li class="ml40"><a href="#">中间件&其他</a></li>
    </ul>
  </div>
  <div class="product-container new-and-old-box backgroundSize">
    <div class="product-box mt10">
      <div class="top">
        <span class="title">通用型S7云服务器</span>
        <div class="info">
          <p class="summary">适用于开发测试、自建数据库、部署ERP等应用</p>
          <p class="tag">限购2单</p>
          <p class="tag">每单5台</p>
        </div>
      </div>
      <div class="body">
        <div class="box">
          <label for="mirror">规格 </label>
          <select name="mirror" id="mirror">
            <option value="1">1核2G</option>
            <option value="1">2核4G</option>
            <option value="1">4核8G</option>
            <option value="1">8核12G</option>
            <option value="1">16核32G</option>
          </select>
        </div>
        <div class="box">
          <label for="pack">固定带宽</label>
          <select name="mirror" id="mirror">
            <option value="1">1M</option>
            <option value="1">2M</option>
            <option value="1">3M</option>
            <option value="1">4M</option>
            <option value="1">5M</option>
          </select>
        </div>
        <div class="box">
          <label for="sys">数据中心</label>
          <select name="mirror" id="mirror">
            <option value="1">华东-上海一</option>
            <option value="1">华南-广州</option>
          </select>
        </div>
        <div class="box">
          <label for="sys">时长</label>
          <select name="mirror" id="mirror">
            <option value="1">1年</option>
            <option value="1">6月</option>
          </select>
        </div>
      </div>
      <div class="footer mt20">
    <div class="line-fir">
      <span class="price">￥{{ product.price }}</span>
      <p class="discount ml10">优惠后￥{{ product.discountPrice }}</p>
    </div>
    <div class="line-sec">
      <button class="im-afford" @click="addToCart">
        立即购买<span class="area-afford">已购40%</span>
      </button>
    </div>
  </div>
    </div>
    <div class="product-box mt10">
      <div class="top">
        <span class="title">通用型S7云服务器</span>
        <div class="info">
          <p class="summary">适用于开发测试、自建数据库、部署ERP等应用</p>
          <p class="tag">限购2单</p>
          <p class="tag">每单5台</p>
        </div>
      </div>
      <div class="body">
        <div class="box">
          <label for="mirror">规格 </label>
          <select name="mirror" id="mirror">
            <option value="1">1核2G</option>
            <option value="1">2核4G</option>
            <option value="1">4核8G</option>
            <option value="1">8核12G</option>
            <option value="1">16核32G</option>
          </select>
        </div>
        <div class="box">
          <label for="pack">固定带宽</label>
          <select name="mirror" id="mirror">
            <option value="1">1M</option>
            <option value="1">2M</option>
            <option value="1">3M</option>
            <option value="1">4M</option>
            <option value="1">5M</option>
          </select>
        </div>
        <div class="box">
          <label for="sys">数据中心</label>
          <select name="mirror" id="mirror">
            <option value="1">华东-上海一</option>
            <option value="1">华南-广州</option>
          </select>
        </div>
        <div class="box">
          <label for="sys">时长</label>
          <select name="mirror" id="mirror">
            <option value="1">1年</option>
            <option value="1">6月</option>
          </select>
        </div>
        <div class="add">
          <input type="checkbox" style="display: block" name="" id="" />
          <p class="ml5 add_text">
            加<strong>40</strong> 元换购价值<strong>480</strong> 元
            <a href="#" class="add_text">主机安全专业版</a>
          </p>
        </div>
        <div class="add">
          <input type="checkbox" style="display: block" name="" id="" />
          <p class="ml5 add_text">
            加<strong>588</strong> 元换购价值<strong>588</strong> 元
            <a href="#" class="add_text">MySQL</a>
          </p>
        </div>
      </div>
      <div class="footer mt20">
    <div class="line-fir">
      <span class="price">￥{{ product.price }}</span>
      <p class="discount ml10">优惠后￥{{ product.discountPrice }}</p>
    </div>
    <div class="line-sec">
      <button class="im-afford" @click="addToCart">
        立即购买<span class="area-afford">已购40%</span>
      </button>
    </div>
  </div>
    </div>
    <div class="product-box mt10">
      <div class="tip-flag">
        <p class="tip">新品推荐</p>
      </div>
      <div class="top">
        <span class="title">通用型S7云服务器</span>
        <div class="info">
          <p class="summary">适用于开发测试、自建数据库、部署ERP等应用</p>
          <p class="tag">限购2单</p>
          <p class="tag">每单5台</p>
        </div>
      </div>
      <div class="body">
        <div class="box">
          <label for="mirror">规格 </label>
          <select name="mirror" id="mirror">
            <option value="1">1核2G</option>
            <option value="1">2核4G</option>
            <option value="1">4核8G</option>
            <option value="1">8核12G</option>
            <option value="1">16核32G</option>
          </select>
        </div>
        <div class="box">
          <label for="pack">固定带宽</label>
          <select name="mirror" id="mirror">
            <option value="1">1M</option>
            <option value="1">2M</option>
            <option value="1">3M</option>
            <option value="1">4M</option>
            <option value="1">5M</option>
          </select>
        </div>
        <div class="box">
          <label for="sys">数据中心</label>
          <select name="mirror" id="mirror">
            <option value="1">华东-上海一</option>
            <option value="1">华南-广州</option>
          </select>
        </div>
        <div class="box">
          <label for="sys">时长</label>
          <select name="mirror" id="mirror">
            <option value="1">1年</option>
            <option value="1">6月</option>
          </select>
        </div>
      </div>
      <div class="footer mt20">
    <div class="line-fir">
      <span class="price">￥{{ product.price }}</span>
      <p class="discount ml10">优惠后￥{{ product.discountPrice }}</p>
    </div>
    <div class="line-sec">
      <button class="im-afford" @click="addToCart">
        立即购买<span class="area-afford">已购40%</span>
      </button>
    </div>
  </div>
    </div>
    <div class="product-box mt10">
      <div class="tip-flag">
        <p class="tip">新品推荐</p>
      </div>
      <div class="top">
        <span class="title">通用型S7云服务器</span>
        <div class="info">
          <p class="summary">适用于开发测试、自建数据库、部署ERP等应用</p>
          <p class="tag">限购2单</p>
          <p class="tag">每单5台</p>
        </div>
      </div>
      <div class="body">
        <div class="box">
          <label for="mirror">规格 </label>
          <select name="mirror" id="mirror">
            <option value="1">1核2G</option>
            <option value="1">2核4G</option>
            <option value="1">4核8G</option>
            <option value="1">8核12G</option>
            <option value="1">16核32G</option>
          </select>
        </div>
        <div class="box">
          <label for="pack">固定带宽</label>
          <select name="mirror" id="mirror">
            <option value="1">1M</option>
            <option value="1">2M</option>
            <option value="1">3M</option>
            <option value="1">4M</option>
            <option value="1">5M</option>
          </select>
        </div>
        <div class="box">
          <label for="sys">数据中心</label>
          <select name="mirror" id="mirror">
            <option value="1">华东-上海一</option>
            <option value="1">华南-广州</option>
          </select>
        </div>
        <div class="box">
          <label for="sys">时长</label>
          <select name="mirror" id="mirror">
            <option value="1">1年</option>
            <option value="1">6月</option>
          </select>
        </div>
        <div class="add">
          <input type="checkbox" style="display: block" name="" id="" />
          <p class="ml5 add_text">
            加<strong>40</strong> 元换购价值<strong>480</strong> 元
            <a href="#" class="add_text">主机安全专业版</a>
          </p>
        </div>
        <div class="add">
          <input type="checkbox" style="display: block" name="" id="" />
          <p class="ml5 add_text">
            加<strong>588</strong> 元换购价值<strong>588</strong> 元
            <a href="#" class="add_text">MySQL</a>
          </p>
        </div>
      </div>
      <div class="footer mt20">
    <div class="line-fir">
      <span class="price">￥{{ product.price }}</span>
      <p class="discount ml10">优惠后￥{{ product.discountPrice }}</p>
    </div>
    <div class="line-sec">
      <button class="im-afford" @click="addToCart">
        立即购买<span class="area-afford">已购40%</span>
      </button>
    </div>
  </div>
    </div>
    <div class="product-box mt10">
      <div class="top">
        <span class="title">通用型S7云服务器</span>
        <div class="info">
          <p class="summary">适用于开发测试、自建数据库、部署ERP等应用</p>
          <p class="tag">限购2单</p>
          <p class="tag">每单5台</p>
        </div>
      </div>
      <div class="body">
        <div class="box">
          <label for="mirror">规格 </label>
          <select name="mirror" id="mirror">
            <option value="1">1核2G</option>
            <option value="1">2核4G</option>
            <option value="1">4核8G</option>
            <option value="1">8核12G</option>
            <option value="1">16核32G</option>
          </select>
        </div>
        <div class="box">
          <label for="pack">固定带宽</label>
          <select name="mirror" id="mirror">
            <option value="1">1M</option>
            <option value="1">2M</option>
            <option value="1">3M</option>
            <option value="1">4M</option>
            <option value="1">5M</option>
          </select>
        </div>
        <div class="box">
          <label for="sys">数据中心</label>
          <select name="mirror" id="mirror">
            <option value="1">华东-上海一</option>
            <option value="1">华南-广州</option>
          </select>
        </div>
        <div class="box">
          <label for="sys">时长</label>
          <select name="mirror" id="mirror">
            <option value="1">1年</option>
            <option value="1">6月</option>
          </select>
        </div>
      </div>
      <div class="footer mt20">
    <div class="line-fir">
      <span class="price">￥{{ product.price }}</span>
      <p class="discount ml10">优惠后￥{{ product.discountPrice }}</p>
    </div>
    <div class="line-sec">
      <button class="im-afford" @click="addToCart">
        立即购买<span class="area-afford">已购40%</span>
      </button>
    </div>
  </div>
    </div>
    <div class="product-box mt10">
      <div class="tip-flag">
        <p class="tip">新品推荐</p>
      </div>
      <div class="top">
        <span class="title">通用型S7云服务器</span>
        <div class="info">
          <p class="summary">适用于开发测试、自建数据库、部署ERP等应用</p>
          <p class="tag">限购2单</p>
          <p class="tag">每单5台</p>
        </div>
      </div>
      <div class="body">
        <div class="box">
          <label for="mirror">规格 </label>
          <select name="mirror" id="mirror">
            <option value="1">1核2G</option>
            <option value="1">2核4G</option>
            <option value="1">4核8G</option>
            <option value="1">8核12G</option>
            <option value="1">16核32G</option>
          </select>
        </div>
        <div class="box">
          <label for="pack">固定带宽</label>
          <select name="mirror" id="mirror">
            <option value="1">1M</option>
            <option value="1">2M</option>
            <option value="1">3M</option>
            <option value="1">4M</option>
            <option value="1">5M</option>
          </select>
        </div>
        <div class="box">
          <label for="sys">数据中心</label>
          <select name="mirror" id="mirror">
            <option value="1">华东-上海一</option>
            <option value="1">华南-广州</option>
          </select>
        </div>
        <div class="box">
          <label for="sys">时长</label>
          <select name="mirror" id="mirror">
            <option value="1">1年</option>
            <option value="1">6月</option>
          </select>
        </div>
        <div class="add">
          <input type="checkbox" style="display: block" name="" id="" />
          <p class="ml5 add_text">
            加<strong>40</strong> 元换购价值<strong>480</strong> 元
            <a href="#" class="add_text">主机安全专业版</a>
          </p>
        </div>
        <div class="add">
          <input type="checkbox" style="display: block" name="" id="" />
          <p class="ml5 add_text">
            加<strong>588</strong> 元换购价值<strong>588</strong> 元
            <a href="#" class="add_text">MySQL</a>
          </p>
        </div>
      </div>
      <div class="footer mt20">
    <div class="line-fir">
      <span class="price">￥{{ product.price }}</span>
      <p class="discount ml10">优惠后￥{{ product.discountPrice }}</p>
    </div>
    <div class="line-sec">
      <button class="im-afford" @click="addToCart">
        立即购买<span class="area-afford">已购40%</span>
      </button>
    </div>
  </div>
    </div>
    <div class="product-box mt10">
      <div class="top">
        <span class="title">通用型S7云服务器</span>
        <div class="info">
          <p class="summary">适用于开发测试、自建数据库、部署ERP等应用</p>
          <p class="tag">限购2单</p>
          <p class="tag">每单5台</p>
        </div>
      </div>
      <div class="body">
        <div class="box">
          <label for="mirror">规格 </label>
          <select name="mirror" id="mirror">
            <option value="1">1核2G</option>
            <option value="1">2核4G</option>
            <option value="1">4核8G</option>
            <option value="1">8核12G</option>
            <option value="1">16核32G</option>
          </select>
        </div>
        <div class="box">
          <label for="pack">固定带宽</label>
          <select name="mirror" id="mirror">
            <option value="1">1M</option>
            <option value="1">2M</option>
            <option value="1">3M</option>
            <option value="1">4M</option>
            <option value="1">5M</option>
          </select>
        </div>
        <div class="box">
          <label for="sys">数据中心</label>
          <select name="mirror" id="mirror">
            <option value="1">华东-上海一</option>
            <option value="1">华南-广州</option>
          </select>
        </div>
        <div class="box">
          <label for="sys">时长</label>
          <select name="mirror" id="mirror">
            <option value="1">1年</option>
            <option value="1">6月</option>
          </select>
        </div>
      </div>
      <div class="footer mt20">
    <div class="line-fir">
      <span class="price">￥{{ product.price }}</span>
      <p class="discount ml10">优惠后￥{{ product.discountPrice }}</p>
    </div>
    <div class="line-sec">
      <button class="im-afford" @click="addToCart">
        立即购买<span class="area-afford">已购40%</span>
      </button>
    </div>
  </div>
    </div>
    <div class="product-box mt10">
      <div class="top">
        <span class="title">通用型S7云服务器</span>
        <div class="info">
          <p class="summary">适用于开发测试、自建数据库、部署ERP等应用</p>
          <p class="tag">限购2单</p>
          <p class="tag">每单5台</p>
        </div>
      </div>
      <div class="body">
        <div class="box">
          <label for="mirror">规格 </label>
          <select name="mirror" id="mirror">
            <option value="1">1核2G</option>
            <option value="1">2核4G</option>
            <option value="1">4核8G</option>
            <option value="1">8核12G</option>
            <option value="1">16核32G</option>
          </select>
        </div>
        <div class="box">
          <label for="pack">固定带宽</label>
          <select name="mirror" id="mirror">
            <option value="1">1M</option>
            <option value="1">2M</option>
            <option value="1">3M</option>
            <option value="1">4M</option>
            <option value="1">5M</option>
          </select>
        </div>
        <div class="box">
          <label for="sys">数据中心</label>
          <select name="mirror" id="mirror">
            <option value="1">华东-上海一</option>
            <option value="1">华南-广州</option>
          </select>
        </div>
        <div class="box">
          <label for="sys">时长</label>
          <select name="mirror" id="mirror">
            <option value="1">1年</option>
            <option value="1">6月</option>
          </select>
        </div>
        <div class="add">
          <input type="checkbox" style="display: block" name="" id="" />
          <p class="ml5 add_text">
            加<strong>40</strong> 元换购价值<strong>480</strong> 元
            <a href="#" class="add_text">主机安全专业版</a>
          </p>
        </div>
        <div class="add">
          <input type="checkbox" style="display: block" name="" id="" />
          <p class="ml5 add_text">
            加<strong>588</strong> 元换购价值<strong>588</strong> 元
            <a href="#" class="add_text">MySQL</a>
          </p>
        </div>
      </div>
      <div class="footer mt20">
    <div class="line-fir">
      <span class="price">￥{{ product.price }}</span>
      <p class="discount ml10">优惠后￥{{ product.discountPrice }}</p>
    </div>
    <div class="line-sec">
      <button class="im-afford" @click="addToCart">
        立即购买<span class="area-afford">已购40%</span>
      </button>
    </div>
  </div>
    </div>
  </div>
  <!-- 组合购折 -->
  <div class="combine-buy-discount title-info backgroundSize">
    <div class="title">
      <span>组合购折上折</span>
      <span class="ps-lim">专家咨询 ></span>
    </div>
    <div class="summary">
      <span>任意2款及以上产品下单，<strong>折上95折</strong> 起！
        二三级等保劲享钜惠 <a href="">活动规则</a></span>
    </div>
  </div>
  <!-- 组合购折banner -->
  <div class="combine-buy-banner-box backgroundSize">
    <ul>
      <li class="new-active"><a href="#">新用户专享</a></li>
      <li><a href="#">新老同享</a></li>
    </ul>
  </div>
  <div class="combine-product-container backgroundSize">
    <div class="product-box mt10">
      <div class="top">
        <img src="/src/assets/imgs/phone3.webp" alt="通用上云必备（通用版）" />
        <h5 class="combine-title">通用上云必备（通用版）</h5>
        <p class="sub-combine-title">场景通用TOP，盲选不踩雷</p>
      </div>
      <div class="body">
        <div class="box">
          <div class="left">
            <input type="checkbox" />
            <p>S6云服务器</p>
          </div>
          <select name="mirror" id="mirror" class="right">
            <option value="1">1核2G/年</option>
            <option value="1">1核2G/6月</option>
            <option value="1">2核4G/年</option>
            <option value="1">2核4G/月</option>
            <option value="1">4核8G/年</option>
            <option value="1">4核8G/月</option>
          </select>
        </div>
        <div class="box mt20">
          <div class="left">
            <input type="checkbox" />
            <p>云服务器备份CBR</p>
          </div>
          <select name="mirror" id="mirror" class="right">
            <option value="1">540G/1年</option>
            <option value="1">540G/6月</option>
            <option value="1">1064G/1年</option>
            <option value="1">1064G/6月</option>
            <option value="1">2088G/1年</option>
            <option value="1">2088G/6月</option>
          </select>
        </div>
        <div class="box mt20">
          <div class="left">
            <input type="checkbox" />
            <p>企业主机安全HSS</p>
          </div>
          <select name="mirror" id="mirror" class="right">
            <option value="1">企业版/1年</option>
            <option value="1">企业版/6月</option>
            <option value="1">旗舰版/1年</option>
            <option value="1">旗舰版/6月</option>
            <option value="1">主机安全专业版/1年</option>
            <option value="1">主机安全专业版/6月</option>
          </select>
        </div>
        <div class="box mt20">
          <div class="left">
            <input type="checkbox" />
            <p>RDS for MySQL</p>
          </div>
          <select name="mirror" id="mirror" class="right">
            <option value="1">单机版 1核2G/年</option>
            <option value="1">单机版 1核2G/6月</option>
            <option value="1">单机版 2核4G/年</option>
            <option value="1">单机版 2核4G/月</option>
            <option value="1">单机版 4核8G/年</option>
            <option value="1">单机版 4核8G/月</option>
            <option value="1">主备版 1核2G/年</option>
            <option value="1">主备版 1核2G/6月</option>
            <option value="1">主备版 2核4G/年</option>
            <option value="1">主备版 2核4G/月</option>
            <option value="1">主备版 4核8G/年</option>
            <option value="1">主备版 4核8G/月</option>
          </select>
        </div>
        <div class="box mt20">
          <div class="left">
            <input type="checkbox" />
            <p>分布式缓存Redis</p>
          </div>
          <select name="mirror" id="mirror" class="right">
            <option value="1">主备1G/1年</option>
            <option value="1">主备1G/6月</option>
            <option value="1">主备2G/1年</option>
            <option value="1">主备2G/6月</option>
          </select>
        </div>
      </div>
      <div class="footer mt20">
    <div class="line-fir">
      <span class="price">￥{{ product.price }}</span>
      <p class="discount ml10">优惠后￥{{ product.discountPrice }}</p>
    </div>
    <div class="line-sec">
      <button class="im-afford" @click="addToCart">
        立即购买<span class="area-afford">已购40%</span>
      </button>
    </div>
  </div>
    </div>
    <div class="product-box mt10">
      <div class="top">
        <img src="/src/assets/imgs/phone3.webp" alt="通用上云必备（通用版）" />
        <h5 class="combine-title">通用上云必备（通用版）</h5>
        <p class="sub-combine-title">场景通用TOP，盲选不踩雷</p>
      </div>
      <div class="body">
        <div class="box">
          <div class="left">
            <input type="checkbox" />
            <p>S6云服务器</p>
          </div>
          <select name="mirror" id="mirror" class="right">
            <option value="1">1核2G/年</option>
            <option value="1">1核2G/6月</option>
            <option value="1">2核4G/年</option>
            <option value="1">2核4G/月</option>
            <option value="1">4核8G/年</option>
            <option value="1">4核8G/月</option>
          </select>
        </div>
        <div class="box mt20">
          <div class="left">
            <input type="checkbox" />
            <p>云服务器备份CBR</p>
          </div>
          <select name="mirror" id="mirror" class="right">
            <option value="1">540G/1年</option>
            <option value="1">540G/6月</option>
            <option value="1">1064G/1年</option>
            <option value="1">1064G/6月</option>
            <option value="1">2088G/1年</option>
            <option value="1">2088G/6月</option>
          </select>
        </div>
        <div class="box mt20">
          <div class="left">
            <input type="checkbox" />
            <p>企业主机安全HSS</p>
          </div>
          <select name="mirror" id="mirror" class="right">
            <option value="1">企业版/1年</option>
            <option value="1">企业版/6月</option>
            <option value="1">旗舰版/1年</option>
            <option value="1">旗舰版/6月</option>
            <option value="1">主机安全专业版/1年</option>
            <option value="1">主机安全专业版/6月</option>
          </select>
        </div>
        <div class="box mt20">
          <div class="left">
            <input type="checkbox" />
            <p>RDS for MySQL</p>
          </div>
          <select name="mirror" id="mirror" class="right">
            <option value="1">单机版 1核2G/年</option>
            <option value="1">单机版 1核2G/6月</option>
            <option value="1">单机版 2核4G/年</option>
            <option value="1">单机版 2核4G/月</option>
            <option value="1">单机版 4核8G/年</option>
            <option value="1">单机版 4核8G/月</option>
            <option value="1">主备版 1核2G/年</option>
            <option value="1">主备版 1核2G/6月</option>
            <option value="1">主备版 2核4G/年</option>
            <option value="1">主备版 2核4G/月</option>
            <option value="1">主备版 4核8G/年</option>
            <option value="1">主备版 4核8G/月</option>
          </select>
        </div>
        <div class="box mt20">
          <div class="left">
            <input type="checkbox" />
            <p>分布式缓存Redis</p>
          </div>
          <select name="mirror" id="mirror" class="right">
            <option value="1">主备1G/1年</option>
            <option value="1">主备1G/6月</option>
            <option value="1">主备2G/1年</option>
            <option value="1">主备2G/6月</option>
          </select>
        </div>
      </div>
      <div class="footer mt20">
    <div class="line-fir">
      <span class="price">￥{{ product.price }}</span>
      <p class="discount ml10">优惠后￥{{ product.discountPrice }}</p>
    </div>
    <div class="line-sec">
      <button class="im-afford" @click="addToCart">
        立即购买<span class="area-afford">已购40%</span>
      </button>
    </div>
  </div>
    </div>
    <div class="product-box mt10">
      <div class="top">
        <img src="/src/assets/imgs/phone3.webp" alt="通用上云必备（通用版）" />
        <h5 class="combine-title">通用上云必备（通用版）</h5>
        <p class="sub-combine-title">场景通用TOP，盲选不踩雷</p>
      </div>
      <div class="body">
        <div class="box">
          <div class="left">
            <input type="checkbox" />
            <p>S6云服务器</p>
          </div>
          <select name="mirror" id="mirror" class="right">
            <option value="1">1核2G/年</option>
            <option value="1">1核2G/6月</option>
            <option value="1">2核4G/年</option>
            <option value="1">2核4G/月</option>
            <option value="1">4核8G/年</option>
            <option value="1">4核8G/月</option>
          </select>
        </div>
        <div class="box mt20">
          <div class="left">
            <input type="checkbox" />
            <p>云服务器备份CBR</p>
          </div>
          <select name="mirror" id="mirror" class="right">
            <option value="1">540G/1年</option>
            <option value="1">540G/6月</option>
            <option value="1">1064G/1年</option>
            <option value="1">1064G/6月</option>
            <option value="1">2088G/1年</option>
            <option value="1">2088G/6月</option>
          </select>
        </div>
        <div class="box mt20">
          <div class="left">
            <input type="checkbox" />
            <p>企业主机安全HSS</p>
          </div>
          <select name="mirror" id="mirror" class="right">
            <option value="1">企业版/1年</option>
            <option value="1">企业版/6月</option>
            <option value="1">旗舰版/1年</option>
            <option value="1">旗舰版/6月</option>
            <option value="1">主机安全专业版/1年</option>
            <option value="1">主机安全专业版/6月</option>
          </select>
        </div>
        <div class="box mt20">
          <div class="left">
            <input type="checkbox" />
            <p>RDS for MySQL</p>
          </div>
          <select name="mirror" id="mirror" class="right">
            <option value="1">单机版 1核2G/年</option>
            <option value="1">单机版 1核2G/6月</option>
            <option value="1">单机版 2核4G/年</option>
            <option value="1">单机版 2核4G/月</option>
            <option value="1">单机版 4核8G/年</option>
            <option value="1">单机版 4核8G/月</option>
            <option value="1">主备版 1核2G/年</option>
            <option value="1">主备版 1核2G/6月</option>
            <option value="1">主备版 2核4G/年</option>
            <option value="1">主备版 2核4G/月</option>
            <option value="1">主备版 4核8G/年</option>
            <option value="1">主备版 4核8G/月</option>
          </select>
        </div>
        <div class="box mt20">
          <div class="left">
            <input type="checkbox" />
            <p>分布式缓存Redis</p>
          </div>
          <select name="mirror" id="mirror" class="right">
            <option value="1">主备1G/1年</option>
            <option value="1">主备1G/6月</option>
            <option value="1">主备2G/1年</option>
            <option value="1">主备2G/6月</option>
          </select>
        </div>
      </div>
      <div class="footer mt20">
    <div class="line-fir">
      <span class="price">￥{{ product.price }}</span>
      <p class="discount ml10">优惠后￥{{ product.discountPrice }}</p>
    </div>
    <div class="line-sec">
      <button class="im-afford" @click="addToCart">
        立即购买<span class="area-afford">已购40%</span>
      </button>
    </div>
  </div>
    </div>
  </div>
  <div class="more mt5">
    <span>
      展开更多<svg class="icon" aria-hidden="true">
        <use xlink:href="#icon-xiangxia"></use>
      </svg>
    </span>
  </div>
  <!-- 更多精品推荐 -->
  <div class="title-info backgroundSize">
    <div class="title">
      <span>更多活动推荐</span>
    </div>
    <div class="summary">
      <span>精选相关活动，满足更多上云需求</span>
    </div>
  </div>
  <div class="recommondation-container backgroundSize">
    <div class="recommondation-box">
      <div class="left">
        <img src="/src/assets/imgs/企业应用.jpg" alt="企业应用" />
      </div>
      <div class="right">
        <h5 class="top">企业应用</h5>
        <p class="footer">
          一站选购精选应用，限时<span style="color: rgb(199, 0, 11)">5折</span>
          起
        </p>
      </div>
    </div>
    <div class="recommondation-box">
      <div class="left">
        <img src="/src/assets/imgs/安全合规.jpeg" alt="安全和合规" />
      </div>
      <div class="right">
        <h5 class="top">安全和合规</h5>
        <p class="footer">全面解决上云安全难题，满足等保合规</p>
      </div>
    </div>
    <div class="recommondation-box">
      <div class="left">
        <img src="/src/assets/imgs/域名建设.jpeg" alt="域名建站" />
      </div>
      <div class="right">
        <h5 class="top">域名建站</h5>
        <p class="footer">
          域名建站一站式服务低至<span style="color: rgb(199, 0, 11)">1元</span>
          起
        </p>
      </div>
    </div>
    <div class="recommondation-box">
      <div class="left">
        <img src="/src/assets/imgs/CDN和视频云.jpeg" alt="CDN和视频云" />
      </div>
      <div class="right">
        <h5 class="top">CDN和视频云</h5>
        <p class="footer">
          CDN全站加速<span style="color: rgb(199, 0, 11)">1折</span>
          起
        </p>
      </div>
    </div>
    <div class="recommondation-box">
      <div class="left">
        <img src="/src/assets/imgs/企业和互联网.jpeg" alt="企业和互联网" />
      </div>
      <div class="right">
        <h5 class="top">企业和物联网</h5>
        <p class="footer">
          物联网流量服务低至<span style="color: rgb(199, 0, 11)">1.5折</span>
        </p>
      </div>
    </div>
    <div class="recommondation-box">
      <div class="left">
        <img src="/src/assets/imgs/云数据库.jpg" alt="云数据库" />
      </div>
      <div class="right">
        <h5 class="top">云数据库</h5>
        <p class="footer">
          数据库1年<span style="color: rgb(199, 0, 11)">199元</span>
          起
        </p>
      </div>
    </div>
    <div class="recommondation-box">
      <div class="left">
        <img src="/src/assets/imgs/大数据.jpeg" alt="AI&大数据" />
      </div>
      <div class="right">
        <h5 class="top">AI&大数据</h5>
        <p class="footer">
          AI和大数据像限时<span style="color: rgb(199, 0, 11)">5折</span>
          起
        </p>
      </div>
    </div>
    <div class="recommondation-box">
      <div class="left">
        <img src="/src/assets/imgs/场景上折.jpeg" alt="场景组合" />
      </div>
      <div class="right">
        <h5 class="top">场景组合购折上折</h5>
        <p class="footer">
          所有组合<span style="color: rgb(199, 0, 11)">折上95折</span>
          起！
        </p>
      </div>
    </div>
  </div>
  <!-- 渐变标题及其联系部分 -->
  <div class="graint-link backgroundSize">
    <div class="graint-title-box">
      <h6>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;联系我们&nbsp;&nbsp;享更多优惠</h6>
    </div>
    <p class="sub-graint-title">
      专属技术顾问为您提供免费售前咨询、解决方案推荐等一对一服务
    </p>
    <a href="#">立即联系</a>
  </div>
  <div class="bottom-choice backgroundSize">
    <div class="bottom-choice-box">
      <i style="background-image: url(/src/assets/imgs/active01.png)"></i>
      <div class="bottom-choice-info-box">
        <div class="title">7*24</div>
        <div class="sub-title">多渠道服务支持</div>
      </div>
    </div>
    <div class="bottom-choice-box">
      <i style="background-image: url(/SRC/ASSETS/imgs/active01.png)"></i>
      <div class="bottom-choice-info-box">
        <div class="title">ICP备案</div>
        <div class="sub-title">提供免费备案服务</div>
      </div>
    </div>
    <div class="bottom-choice-box">
      <i style="background-image: url(/SRC/ASSETS/imgs/active01.png)"></i>
      <div class="bottom-choice-info-box">
        <div class="title">专业服务</div>
        <div class="sub-title">云业务全流程支持</div>
      </div>
    </div>
    <div class="bottom-choice-box">
      <i style="background-image: url(/SRC/ASSETS/imgs/active01.png)"></i>
      <div class="bottom-choice-info-box">
        <div class="title">退订</div>
        <div class="sub-title">享无忧退订服务</div>
      </div>
    </div>
    <div class="bottom-choice-box">
      <i style="background-image: url(/SRC/ASSETS/imgs/active01.png)"></i>
      <div class="bottom-choice-info-box">
        <div class="title">建议反馈</div>
        <div class="sub-title">优化改进建议</div>
      </div>
    </div>
  </div>
  <div class="hr"></div>
  <!-- 底部信息栏 -->
  <div class="footer-info">
    <div class="app-logo">
      <svg class="icon-logo" aria-hidden="true">
        <use xlink:href="#icon-huaweiyun"></use>
      </svg>
      <a href="#">华为APP</a>
    </div>
    <div class="info-box">
      <div class="left">
        <p>售前咨询热线</p>
        <p>950808转1</p>
        <p class="other">技术服务咨询</p>
        <p class="other">售前咨询</p>
        <p class="other">备案服务</p>
        <p class="other" style="margin-bottom: 24px">云商店咨询</p>
        <p>关注华为云</p>
        <div class="icon-other-platform">
          <svg class="icon-logo" aria-hidden="true">
            <use xlink:href="#icon-weixin"></use>
          </svg>
          <svg class="icon-logo" aria-hidden="true">
            <use xlink:href="#icon-weibo"></use>
          </svg>
          <svg class="icon-logo" aria-hidden="true">
            <use xlink:href="#icon-app"></use>
          </svg>
        </div>
      </div>
      <div class="right">
        <dl>
          <dt>关于华为云</dt>
          <dd>了解华为云</dd>
          <dd>客户案例</dd>
          <dd>信任中心</dd>
          <dd>法律协议</dd>
          <dd>新闻报道</dd>
          <dd>华为云直播</dd>
        </dl>
        <dl>
          <dt>热门产品</dt>
          <dd>免费试用</dd>
          <dd>云服务器</dd>
          <dd>盘古大模型</dd>
          <dd>SSL证书</dd>
          <dd>华为云WeLink</dd>
          <dd>云速建站</dd>
        </dl>
        <dl>
          <dt>支持与服务</dt>
          <dd>自助服务</dd>
          <dd>售前咨询</dd>
          <dd>服务公告</dd>
          <dd>支持计划</dd>
          <dd>智能客服</dd>
          <dd>联系我们</dd>
        </dl>
        <dl>
          <dt>实用工具</dt>
          <dd>文字识别</dd>
          <dd>漏洞扫描</dd>
          <dd>域名注册</dd>
          <dd>华为云会议</dd>
          <dd>定制建站</dd>
          <dd>云服务健康看板</dd>
        </dl>
        <dl>
          <dt>快速链接</dt>
          <dd>华为官网</dd>
          <dd>华为消费者业务</dd>
          <dd>华为开发者联盟</dd>
          <dd>华为企业业务</dd>
          <dd>华为商城</dd>
          <dd>花粉俱乐部</dd>
        </dl>
      </div>
    </div>
    <div class="hr"></div>
    <div class="beian">
      <div class="top">
        <span class="left">©2023 Huaweicloud.com 版权所有
          <span class="ICP">黔ICP备20004760号-14</span> 苏B2-20130048号
          A2.B1.B2-20070312 代理域名注册服务机构：新网、西数</span>
        <span class="right"><span class="law">法律声明</span> |
          <span class="per">隐私政策</span></span>
      </div>
      <div class="footer">
        <div class="yinye">
          <i style="background-image: url(/src/assets/imgs/大数据.jpeg)"></i>
          <a href="#">电子营业执照</a>
        </div>
        <div class="yinye">
          <i style="background-image: url(/src/assets/imgs/背景.jpg)"></i>
          <a href="#">电子营业执照</a>
        </div>
      </div>
    </div>
  </div>
</div>
</template>

<script setup>
  import{ref} from "vue";
  import { precProductListApi } from "@/utils/api.js";//从后台获取数据不需要权限的接口
  import {  useRouter } from "vue-router";



const router = useRouter();

const product = ref({
  id: 1, // 实际产品 ID
  productName: "示例商品", // 实际商品名称
  price: 660.36,
  discountPrice: 89.9 // 示例折扣价
});

const addToCart = () => {
  const newProduct = {
    id: product.value.id,
    productName: product.value.productName,
    price: product.value.price,
    quantity: 1, // 默认数量为1
  };
  // 从 localStorage 中获取购物车数据
  let cart = JSON.parse(localStorage.getItem("cart")) || [];
  
  // 检查购物车中是否已有该商品，如果有则增加数量
  const existingProduct = cart.find(item => item.id === newProduct.id);
  if (existingProduct) {
    existingProduct.quantity += 1;
  } else {
    cart.push(newProduct);
  }

  // 更新 localStorage
  localStorage.setItem("cart", JSON.stringify(cart));

  // 跳转到购物车页面
  router.push("/cart");
};

  let topNavs=ref([]);
  const getTopNavs=()=>{
    //模拟发送网络请求，从后台数据库动态加载数据
    topNavs=[
      {
        name:"活动",
        link:"https://activity.huaweicloud.com/"
      },
      {
        name:"产品",
        link:"https://www.huaweicloud.com/product/"
      },
      {
        name:"解决方案",
        link:"https://www.huaweicloud.com/solution/"
      },
      {
        name:"定价",
        link:"https://www.huaweicloud.com/pricing/index.html"
      },
      {
        name:"云商店",
        link:"https://marketplace.huaweicloud.com/"
      },
      {
        name:"合作伙伴",
        link:"https://www.huaweicloud.com/partners/"
      },
      {
        name:"开发者",
        link:"https://developer.huaweicloud.com/"
      },
      {
        name:"支持与服务",
        link:"https://www.huaweicloud.com/service/"
      },
    ]
  };
  //调用网络获取数据
  getTopNavs();

  

  let phonelist = ref([]);
  const getPhonelist = () => {
    // 调用网络请求
    precProductListApi({})
        .then((res) => { 
            phonelist.value = res.data.list;
        })
        .catch((err) => { });
};
getPhonelist();

  const getAssetURL=(url)=>{
    return new URL('/src/assets/imgs/${url}',import.meta.url).href;
  };

  let toDetail=(phone)=>{
    //将产品信息携带到详情页面
    router.push({
      path:"/prev/pdetail",
      query:{
        id:phone.id
      }
    });
  };
</script>

<style scoped>
* {
    padding: 0;
    margin: 0;
    box-sizing: border-box;
}
div.main {
    background-color: #F7F8F9;
}
.ml5 {
    margin-left: 5px;
}
.ml10 {
    margin-left: 10px;
}
.ml20 {
    margin-left: 20px;
}
.ml40 {
    margin-left: 40px;
}
.mr5 {
    margin-right: 5px;
}
.mr10 {
    margin-right: 10px;
}
.mr40 {
    margin-right: 40px;
}
.mt10 {
    margin-top: 10px;
}
.mt20 {
    margin-top: 20px;
}
.mt30 {
    margin-top: 30px;
}
/*  加个通用样式把，不然引入贼大。 */
.icon {
    width: 1em;
    height: 1em;
    vertical-align: -0.15em;
    color: #47b6ff;
    overflow: hidden;
    vertical-align: middle;
}
.backgroundSize {
    width: 1332px;
    margin: 0 auto;
    min-height: 80px;
    background-color: #F7F8F9;
}
.tag {
    display: inline-block;
    height: 18px;
    background-color: rgba(89, 89, 89, .1);
    border-radius: 4px;
    padding: 0 4px;
    font-size: 13px;
    line-height: 18px;
}
.new-active {
    border-bottom: 3px solid #191919;
    font-weight: 700;
}
.tip-flag {
    position: absolute;
    top: 0;
    right: 0;
    width: auto;
    height: auto;
    padding: 0 10px 0 14px;
    background: #f5ebde;
    border-radius: 0 10px 0 10px;
    font-size: 12px;
    color: #a64d00;
    line-height: 18px;
    -webkit-transform: skewX(30deg);
    transform: skewX(30deg);
}
.tip {
    color: #a64d00;
    -webkit-transform: skewX(-30deg);
    transform: skewX(-30deg);
}
.hr {
    width: 1332px;
    height: 1px;
    background-color: #ccc;
    margin: 5px auto;
}
.other {
    color: #595959;
    font-size: 12px;
    line-height: 24px;
    white-space: nowrap;
}
.other:hover {
    text-decoration: underline;
    -webkit-transition: .2s;
    transition: .2s;
    cursor: pointer;
}
dt {
    color: #191919;
    font-weight: 700;
    line-height: 18px;
    margin-bottom: 12px;
}
dd {
    color: #595959;
    font-size: 14px;
    line-height: 24px;
    margin-top: 8px;
}
dd:hover {
    text-decoration: underline;
    transition: all 0.2s;
    cursor: pointer;
}
/* 顶部导航 */
.top-nav {
  height: 30px;
  background-color: #333;
  display: flex;
  justify-content: right;
  align-items: center;
}

.top-nav span {
  font-size: 12px;
  color: #ccc;
}

.top-nav span:hover {
  color: #fff;
  cursor: pointer;
}

/* 导航栏 */
.navs {
  height: 100px;
  background-color: #fff;
  display: flex;
  justify-content: space-around;
  align-items: center;
}

/* 图标logo */
.logo {
  width: 180px;
  height: 50px;
  position: static;
  display: flex;
  justify-content: right;
  align-items: center;
}
.icon-logo {
  width: 3em;
  height: 3em;
  color: #47b6ff;
  overflow: hidden;
  vertical-align: middle;
  margin-right: 5px;
}

.logo-info a {
  position:static;
  height: 3em;
  font-size: 20px;
  font-weight: 900;
  line-height: 3em;
  text-align: right;
  text-decoration: none;
  color: #000;
}

/* 导航具体实现 */
.nav {
  min-width: 800px;
  height: 94px;
  background-color: #fff;
}

.nav ul {
  width: 100%;
  height: 100%;
  display: flex;
  justify-content: space-around;
  align-items: center;
}

.nav ul li {
  width: auto;
  height: 94px;
  list-style: none;
}

.nav ul li a {
  text-decoration: none;
  color: #191919;
  text-align: center;
  line-height: 94px;
  font-size: 15px;
  font-weight: inherit;
}

.nav ul li:hover {
  border-bottom: 3px solid #333;
}

/* 搜索注册 */
.others {
  display: flex;
  justify-content: right;
  align-items: center;
}

.others .search {
  width: 30px;
  height: 50px;
}

.others .search .icon-search {
  width: 1.4em;
  height: 1.4em;
  color: #47b6ff;
  overflow: hidden;
  vertical-align: -1.2em;
  cursor: pointer;
}

.login {
  width: 480px;
  height: 50px;
}

.login ul {
  width: 100%;
  height: 100%;
  display: flex;
  justify-content: left;
  align-items: center;
}

.login ul li {
  display: inline-block;
  width: 70px;
  height: 100%;
  list-style: none;
}
.login ul li a {
  display: block;
  width: 100%;
  height: 100%;
  text-decoration: none;
  color: #191919;
  text-align: center;
  line-height: 50px;
  font-size: 14px;
}
.login ul li:last-child {
  width: 60px;
  height: 33px;
  border-radius: 15px;
  background-color: #c7000b;
}
.login ul li:last-child:hover {
  background-color: #d64a52;
}
.login ul li:last-child a {
  display: block;
  width: 100%;
  height: 100%;
  text-align: center;
  line-height: 33px;
  /* font-size: 17px; */
  font-weight: 600;
  color: white;
}
.login ul li .front:hover {
  color: #c7000b;
}
.cloud {
  width: auto;
  height: 400px;
  background-image: url(/src/assets/imgs/云图片.jpeg);
  background-size: 100% 100%;
  background-repeat: no-repeat;
  position: relative;
  animation: cloud1 9s infinite;
  animation-direction: alternate;
}
@keyframes cloud1{
  0%{
    background-image: url(/src/assets/imgs/云图片.jpeg);
    background-size: 100% 100%;
  }
  50%{
    background-image: url(/src/assets/imgs/美丽风景3.jpg);
    background-size: 100% 100%;
  }
  100%{
    background-image: url(/src/assets/imgs/美丽风景1.jpg);
    background-size: 100% 100%;
  }
}
.cloud .container {
  width: 800px;
  height: 400px;
  position: absolute;
  left: 100px;
  top: 0;
  padding-top: 110px;
  /* background-color: #000; */
}
.cloud .container .cloud-title {
  display: block;
  height: 90px;
  line-height: 90px;
  font-size: 60px;
  color: #191919;
  font-weight: 800;
}
.cloud .container .summary {
  display: block;
  color: #191919;
  font-size: 17px;
}
.banners ul {
  /* background-color: #ccc; */
  width: 1332px;
  height: 80px;
  display: flex;
  border-radius: 16px;
  justify-content: space-around;
  align-items: center;
}
.banners ul .small-banner {
  width: 333px;
  height: 100%;
  background-color: #fff;
  /* background-color: #ccc; */
  border-radius: 16px;
  list-style: none;
  padding: 5px;
  cursor: pointer;
}
.banners ul .small-banner:hover {
  background-image: url(/src/assets/imgs/active01.png);
  background-size: 100% 100%;
  background-repeat: no-repeat;
  box-shadow: 0 4px 16px 0 rgba(0, 0, 0, 0.12);
  transition: all 0.3s;
}
.small-banner span {
  display: block;
  width: 100%;
  height: 30px;
  text-align: center;
  line-height: 40px;
  font-size: 14px;
  color: #595959;
}
.small-banner span:first-child {
  display: block;
  width: 100%;
  height: 40px;
  text-align: center;
  line-height: 50px;
  font-size: 17px;
  color: #191919;
  font-weight: 700;
}
/* 限时秒杀区 */
.title-info {
  height: 150px;
  padding: 10px 5px;
}
.title-info .title {
  width: 100%;
  height: 80px;
  position: relative;
}
.title-info .title span {
  display: block;
  width: 100%;
  height: 100%;
}
.title-info .title span:first-child {
  text-align: center;
  font-size: 36px;
  font-weight: 400;
  line-height: 80px;
  color: #191919;
}
.title-info .title .ps-lim {
  width: 230px;
  height: 32px;
  position: absolute;
  top: 30%;
  right: 0;
}
.ps-lim {
  text-align: center;
  color: #595959;
  line-height: 32px;
  background-color: #fff;
  border-radius: 50px;
}
.ps-lim:hover {
  cursor: pointer;
  box-shadow: 0 4px 16px 0 rgba(0, 0, 0, 0.12);
}
.title-info .summary {
  width: 100%;
  height: auto;
  text-align: center;
}
.title-info .summary a {
  display: inline-block;
  color: rgb(37, 43, 58);
  outline: #000;
}
.title-info .summary a:hover {
  font-weight: 800;
}
.title-info .summary a:last-child {
  outline: #000;
}
.title-info .summary a:last-child:hover {
  font-weight: 400;
  font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
  font-size: large;
  text-shadow: 0px 2px;
}

.product-container {
  height: auto;
  display: flex;
  justify-content: space-around;
  flex-wrap: wrap;
}

.product-container .product-box {
  width: 321px;
  height: 520px;
  position: relative;
  background-color: #fff;
  border-radius: 16px;
  display: flex;
  flex-direction: column;
  justify-content: space-around;
  overflow: hidden;
}

.product-box:hover {
  box-shadow: 0 4px 16px 0 rgba(0, 0, 0, 0.12);
}

.product-box .top {
  width: 100%;
  height: 162px;
  padding: 32px;
}

.product-box .top span {
  width: 100%;
  display: block;
}

.product-box .top .title {
  height: 28px;
  font-size: 18px;
  color: #191919;
  letter-spacing: 1px;
  font-weight: 700;
  line-height: 28px;
}

.product-box .top .info {
  width: 100%;
  height: 66px;
  margin-top: 4px;
  font-size: 12px;
  color: #595959;
  letter-spacing: 0;
  line-height: 30px;
}
.product-box .top .info .summary {
  font-size: 12px;
}

.product-box .body {
  width: 321px;
  height: 144px;
  padding: 5px 32px;
}
.body .box {
  width: 100%;
  height: 30px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  border-bottom: 1px solid rgba(0, 0, 0, 0.1);
}
.body label {
  font-size: 12px;
  color: #595959;
}
.body select {
  border: none;
  font-size: 17px;
}
.body select:focus {
  outline: none;
}
.product-container .product-box .footer {
  width: 321px;
  height: 158px;
  /* background-color: #ccc; */
  padding: 20px;
}
.product-container .product-box .footer .line-fir {
  width: 100%;
  height: 36px;
  margin: 0 auto;
  display: flex;
  justify-content: left;
  align-items: center;
  padding-left: 32px;
}
.product-container .product-box .footer .line-sec {
  width: 100%;
  height: 38px;
  text-align: center;
}
.line-fir .price {
  font-style: normal;
  font-size: 20px;
  color: #595959;
  font-weight: 400;
}
.line-fir .discount {
  height: 26px;
  padding: 0 8px;
  text-align: center;
  border: 1px solid #c7000b;
  border-radius: 4px;
  font-size: 14px;
  color: #c7000b;
  line-height: 26px;
  font-weight: 900;
}
.line-sec .im-afford {
  position: relative;
  width: 257px;
  height: 38px;
  box-shadow: none;
  background-color: #fff;
  border: 1px solid #595959;
  text-align: center;
  border-radius: 40px;
  line-height: 36px;
  overflow: hidden;
  color: #191919 !important;
  background-image: none !important;
  font-weight: bold;
  font-size: 16px;
  cursor: pointer;
}
.line-sec .im-afford .area-afford {
  display: inline;
  margin-left: 8px;
  font-size: 12px;
  color: #595959;
  text-align: center;
}
.line-sec .im-afford::before {
  content: "";
  height: 100%;
  width: 40%;
  position: absolute;
  top: 0;
  left: 0;
  background-color: rgba(0, 0, 0, 0.05);
}
.more {
  width: 100%;
  height: 30px;
  text-align: center;
  line-height: 30px;
  position: relative;
}
.more span {
  cursor: pointer;
}
.more #yi {
  display: none;
  position: absolute;
  border: 2px solid rgb(50, 49, 49);
}
.more:hover #yi {
  display: inline-block;
}
.more ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  background-color: #928585;
  width: 80px;
  height: 32px;
  overflow-y: scroll;
}
.more a {
  text-decoration: none;
  font-size: large;
  font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
}
.more a:hover {
  background-color: #47b6ff;
  color: #595959;
}
.new-user-banner {
  height: 50px;
}
.new-user-banner ul {
  width: 100%;
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: top;
}
.new-user-banner ul li {
  width: 88px;
  height: 50px;
  list-style: none;
  text-align: center;
  min-width: 24px;
  width: auto;
  padding: 0;
  font-size: 18px;
}
.new-user-banner ul li a {
  display: block;
  width: 100%;
  height: 50px;
  text-decoration: none;
  color: #191919;
}
/* 最新服务器 */
.new_ {
  height: 435px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  border-radius: 16px;
  overflow: hidden;
  background-color: #d4d4d4;
  /* border: 1px solid #ccc; */
}

.new_ .left {
  width: 666px;
  height: 100%;
  background-color: #fff;
}

.new_ .right {
  width: 50%;
  height: 100%;
  background-image: url(/src/assets/imgs/背景.jpg);
  background-size: initial;
  background-repeat: unset;
  background-position: 100%;
  overflow: hidden;
  animation: right1 15s infinite;
  animation-delay: 3s;
  animation-direction: alternate;

}
@keyframes right1{
  0%{
    background-image: url(/SRC/ASSETS/imgs/企业应用.jpg);
    background-size: 100% 100%;
  }
  20%{
    background-image: url(/SRC/ASSETS/imgs/场景上折.jpeg);
    background-size: 100% 100%;
  }
  40%{
    background-image: url(/SRC/ASSETS/imgs/场景组合图.jpg);
    background-size: 100% 100%;
  }
  60%{
    background-image: url(/SRC/ASSETS/imgs/云数据库.jpg);
    background-size: 100% 100%;
  }
  80%{
    background-image: url(/SRC/ASSETS/imgs/域名建设.jpeg);
    background-size: 100% 100%;
  }
  100%{
    background-image: url(/SRC/ASSETS/imgs/大数据.jpeg);
    background-size: 100% 100%;
  }
}
.new_ .left .header {
  width: 100%;
  height: 160px;
  padding: 48px 80px 32px;
  -webkit-box-pack: start;
  -ms-flex-pack: start;
  justify-content: start;
  text-align: left;
}
.new_ .left .header .text {
  font-size: 18px;
  color: #191919;
  letter-spacing: 1px;
  font-weight: 700;
  line-height: 28px;
}
.new_ .left .header .sub-title {
  margin-top: 4px;
  font-size: 12px;
  color: #595959;
  letter-spacing: 0;
  line-height: 18px;
}
.new_ .left .header .sub-title a {
  cursor: pointer;
  -webkit-transition: 0.2s;
  transition: 0.2s;
  color: #191919;
  text-decoration: underline;
}
.new_ .left .body {
  width: 100%;
  height: 157px;
  padding: 0 80px;
  display: flex;
  flex-wrap: wrap;
}
.new_ .left .body .box {
  width: 253px;
  height: 30px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  border-bottom: 1px solid rgba(0, 0, 0, 0.1);
}
.new_ .left .body .box:nth-of-type(2n) {
  width: 233px;
  margin-left: 20px;
}
.new_ .left .body select {
  border: none;
  font-size: 15px;
}
.add {
  width: 100%;
  height: 30px;
  display: flex;
  justify-content: left;
  align-items: center;
}
.add input {
  width: 15px;
  height: 15px;
}
.add .add_text {
  font-size: 12px;
  color: #595959;
  line-height: 30px;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
.add a {
  font-size: 12px;
  line-height: 30px;
  color: #595959;
  border-bottom: 1px dashed #595959;
}
.new_ .footer {
  width: 100%;
  height: 117px;
  padding: 0 80px;
}
.new_ .footer .line-fir {
  height: 100%;
  width: 100%;
  margin: 0 auto;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.new_ .footer .line-fir .pp {
  display: flex;
  justify-content: center;
  align-items: center;
}
.new_ .footer .line-fir .pp .price {
  font-style: normal;
  font-size: 20px;
  color: #595959;
  font-weight: 400;
}

.new_ .footer .line-fir .pp .discount {
  height: 26px;
  padding: 0 8px;
  text-align: center;
  border: 1px solid #c7000b;
  border-radius: 4px;
  font-size: 14px;
  color: #c7000b;
  line-height: 26px;
}
.new_ .footer .line-fir .pp .discount {
  width: 136px;
  font-weight: 800;
}
.new_ .footer .line-fir .line-sec .im-buy {
  width: 130px;
  height: 38px;
  box-shadow: none;
  background-color: #fff;
  border: 1px solid #595959;
  text-align: center;
  border-radius: 40px;
  line-height: 36px;
  overflow: hidden;
  color: #191919 !important;
  background-image: none !important;
  font-weight: bold;
  font-size: 16px;
  cursor: pointer;
}
/* 优惠卷专区 */
.coupon {
  height: 114px;
  margin-top: 20px;
}
.coupon .coup-title {
  color: #191919;
  font-size: 36px;
  letter-spacing: 2px;
  height: 54px;
  line-height: 54px;
  text-align: center;
  font-weight: 400 !important;
}
.coupon .sub-coup-box {
  width: 100%;
  height: 24px;
  -webkit-box-orient: vertical;
  color: #595959;
  display: -webkit-box;
  font-size: 16px;
  letter-spacing: 1px;
  line-height: 24px;
  overflow: hidden;
  text-align: center;
}
.coupon .sub-coup-box .sub-coup-title a {
  color: #191919;
  margin-left: 8px;
  white-space: nowrap;
}
.coupon .sub-coup-box .sub-coup-title a:hover {
  font-weight: bold;
}
.coupon-info-box {
  height: 151px;
  display: flex;
  justify-content: center;
  align-items: top;
}
.coupon-info-box .coupon-item {
  width: 300px;
  height: 151px;
}
.coupon-info-box .coupon-item .card-outer {
  width: 284px;
  height: 135px;
  background-image: url(/src/assets/imgs/active01.png);
  background-size: 100% 100%;
  background-repeat: no-repeat;
}
.coupon-info-box .coupon-item .card-inner {
  width: 100%;
  height: 100%;
  padding: 12px 20px;
}
.coupon-info-box .coupon-item .card-inner .fir {
  width: 100%;
  display: flex;
  justify-content: space-between;
}
.coupon-info-box .coupon-item .card-inner .fir .coup-account {
  width: 122px;
  height: 44px;
  font-size: 30px;
  font-weight: 700;
  line-height: 44px;
  color: #563500;
}
.coupon-info-box .coupon-item .card-inner .fir .upgrade-coup {
  width: 80px;
  height: 22px;
  max-width: 50%;
  overflow: hidden;
  /* text-overflow: ellipsis; */
  white-space: nowrap;
  border: 1px solid;
  border-radius: 11px;
  font-size: 12px;
  height: 22px;
  line-height: 20px;
  padding: 0 8px;
}
.coupon-info-box .coupon-item .card-inner .sec {
  width: 100%;
  height: 18px;
}
.coupon-info-box .coupon-item .card-inner .warn {
  font-size: 12px;
  line-height: 18px;
  margin-bottom: 14px;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
.coupon-info-box .coupon-item .card-inner .thr {
  width: 100%;
  height: 33px;
  overflow: hidden;
  margin-top: 20px;
}
.coupon-info-box .coupon-item .card-inner .thr .im-get {
  display: block;
  min-width: 40px;
  width: 100px;
  height: auto;
  margin: 3px auto;
  cursor: pointer;
  font-size: 16px;
  line-height: 25px;
  color: #ffffff;
  cursor: pointer;
}
/* 新老用户同享 */
.new-and-old .sub-coup-box .sub-coup-title a:hover:last-of-type {
  font-weight: 400;
}
/* 组合购劵 */
.combine-buy-discount .title .ps-lim {
  width: 116px;
}
.combine-buy-banner-box {
  height: 50px;
}
.combine-buy-banner-box ul {
  width: 100%;
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: start;
}
.combine-buy-banner-box ul li {
  width: 104px;
  height: 50px;
  text-align: center;
  /* line-height: 50px; */
  list-style: none;
  font-size: 18px;
  color: #191919;
  line-height: 28px;
  cursor: pointer;
}
.combine-buy-banner-box ul li a {
  font-size: 18px;
  color: #191919;
  line-height: 28px;
  cursor: pointer;
  text-decoration: none;
}
/* 组合购折上折 商品信息 */
.combine-product-container {
  display: flex;
  justify-content: space-around;
  flex-wrap: wrap;
}
.combine-product-container .product-box {
  width: 441px;
  border-radius: 16px;
}
.combine-product-container .product-box .top {
  width: 541px;
  height: 290px;
  text-align: center;
}
.combine-product-container .product-box .top img {
  width: 160px;
  height: 160px;
}
.combine-product-container .product-box .top .combine-title {
  font-size: 18px;
  color: #191919;
  letter-spacing: 1px;
  font-weight: 700;
  line-height: 28px;
}
.combine-product-container .product-box .top .sub-combine-title {
  margin-top: 4px;
  font-size: 12px;
  color: #595959;
  letter-spacing: 0;
  line-height: 18px;
}
.combine-product-container .product-box .body {
  width: 441px;
  height: 262px;
  padding: 0 32px;
}
.combine-product-container .product-box .body .left input {
  width: 16px;
  height: 16px;
  vertical-align: middle;
}
.combine-product-container .product-box .body .left p {
  font-size: 14px;
  color: #191919;
  font-weight: 400;
  display: inline-block;
}
.combine-product-container .product-box select {
  width: 188px;
  background-color: #f7f8f9;
}
/*  */
.combine-product-container .product-box .footer {
  width: 441px;
  height: 137px;
  padding: 0 32px;
}
.combine-product-container .product-box .footer .line-fir {
  width: 100%;
  height: 36px;
  display: flex;
  justify-content: left;
  align-items: center;
}
.combine-product-container .product-box .footer .line-sec {
  width: 100%;
}
.combine-product-container .product-box .footer .line-sec .im-buy {
  width: 100%;
  height: 38px;
  box-shadow: none;
  background-color: #fff;
  border: 1px solid #595959;
  text-align: center;
  border-radius: 40px;
  line-height: 36px;
  overflow: hidden;
  color: #191919 !important;
  background-image: none !important;
  font-weight: bold;
  font-size: 16px;
  cursor: pointer;
}
/* 场景组合背景图 */
.section-combine img {
  width: 20%;
  height: 80%;
  display: flex;
  justify-content: center;
  align-items: center;
}
/* 更多精品推荐 */
.recommondation-container {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  /* 四列 */
  grid-template-rows: repeat(2, 1fr);
  /* 两行 */
  gap: 10px;
  /* 可选项，设置列与列之间的间距 */
}
.recommondation-container .recommondation-box {
  width: 337px;
    height: 112px;
    padding: 8px;
    display: flex;
    justify-content: space-evenly;
    align-items: center;
    background-color: #fff;
    border-radius: 16px;
    align-content: flex-start;
    flex-wrap: nowrap;
    flex-direction: row;
}
.recommondation-container .recommondation-box:hover {
  box-shadow: 0 4px 16px 0 rgba(0, 0, 0, 0.12);
  cursor: pointer;
}
.recommondation-container .recommondation-box .left {
  width: 48px;
  height: 48px;
  border-radius: 10px;
  overflow: hidden;
}
.recommondation-container .recommondation-box .left img {
  width: 100%;
  height: 100%;
}
.recommondation-container .recommondation-box .right {
  width: 213px;
  height: 44px;
  margin-left: 16px;
}
.recommondation-container .recommondation-box .right .top {
  color: #191919;
  font-size: 14px;
  font-weight: 700;
  letter-spacing: 1px;
  line-height: 22px;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
.recommondation-container .recommondation-box .right .footer {
  color: #595959;
  font-size: 12px;
  font-weight: inherit;
}
.graint-link {
  height: 300px;
  margin-top: 60px;
  padding-top: 60px;
  padding-bottom: 60px;
}
.graint-link .graint-title-box {
  width: 450px;
  height: 72px;
  margin: 0 auto;
  color: #191919;
  font-size: 48px;
  font-weight: 600;
}
.graint-link .graint-title-box .graint-title {
  background-image: url(/src/assets/imgs/云图片.jpeg);
  -webkit-text-fill-color: transparent;
  background-repeat: no-repeat;
  background-size: cover;
  color: #fff;
  line-height: 72px;
  display: inline-block;
}
.graint-link .sub-graint-title {
  font-size: 16px;
  line-height: 24px;
  margin-top: 36px;
  color: #595959;
  text-align: center;
}
.graint-link a {
  display: block;
  width: 153px;
  height: 47px;
  margin: 0 auto;
  margin-top: 36px;
  text-align: center;
  line-height: 47px;
  text-decoration: none;
  color: #191919;
  border: 1px solid #191919;
  border-radius: 48px;
}
/**/
.bottom-choice {
  height: 100px;
  display: flex;
  justify-content: center;
  align-items: center;
}
.bottom-choice .bottom-choice-box {
  width: 266px;
  height: 100px;
  display: flex;
  justify-content: left;
  align-items: center;
  cursor: pointer;
}
.bottom-choice .bottom-choice-box i {
  display: inline-block;
  width: 40px;
  height: 40px;
}
.bottom-choice .bottom-choice-box .bottom-choice-info-box {
  padding-left: 20px;
}
.bottom-choice .bottom-choice-box:hover .bottom-choice-info-box .title {
  font-weight: 800;
  text-decoration: underline;
}
.bottom-choice .bottom-choice-box .bottom-choice-info-box .title {
  color: #191919;
  font-size: 16px;
  line-height: 20px;
  margin-bottom: 5px;
}
.bottom-choice .bottom-choice-box .bottom-choice-info-box .sub-title {
  color: #595959;
  font-size: 12px;
  line-height: 18px;
}
.footer-info {
  width: 1301px;
  height: 348px;
  padding-bottom: 20px;
  padding-top: 20px;
  margin: 0 auto;
}
.footer-info .app-logo {
  margin-bottom: 20px;
}
.footer-info .app-logo .icon-logo {
  width: 40px;
  height: 40px;
}
.footer-info .app-logo a {
  color: #191919;
  font-weight: 600;
  margin-bottom: 20px;
  text-decoration: none;
}
.footer-info .app-logo a:hover {
  text-decoration: underline;
}
.footer-info .info-box {
  display: flex;
  justify-content: left;
  align-items: center;
  width: 1301px;
}
.footer-info .info-box .left {
  width: 242px;
  border-right: 1px solid #e2e2e2;
}
.footer-info .info-box p:nth-of-type(1) {
  color: #191919;
  font-size: 14px;
  line-height: 18px;
  margin-bottom: 12px;
}
.footer-info .info-box p:nth-of-type(2) {
  font-size: 20px;
  color: #191919;
  font-weight: 600;
}
.footer-info .info-box p:nth-of-type(2):hover {
  text-decoration: underline;
  transition: all 2s;
  cursor: pointer;
}
.footer-info .info-box p:nth-last-of-type(1) {
  color: #252b3a;
  font-size: 14px;
  line-height: 18px;
  text-align: left;
}
.footer-info .info-box .left .icon-other-platform {
  display: flex;
  justify-content: left;
  align-items: center;
  padding-top: 12px;
}
.footer-info .info-box .left .icon-other-platform .icon-logo {
  width: 34px;
  height: 34px;
  margin-right: 20px;
  cursor: pointer;
}
.footer-info .info-box .right {
  width: 1059px;
  padding-left: 54px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.beian {
  width: 100%;
  height: 85px;
  padding-top: 20px;
  /* background-color: #000; */
}
.beian .top {
  width: 100%;
  height: 18px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  font-size: 14px;
  line-height: 18px;
  color: #595959;
}
.beian .top .left .ICP:hover {
  color: #191919;
  text-decoration: underline;
  cursor: pointer;
}
.beian .top .right .law:hover,
.beian .top .right .per:hover {
  color: #191919;
  text-decoration: underline;
  cursor: pointer;
}
.beian .footer {
  display: flex;
  justify-content: left;
  align-items: center;
  padding-top: 5px;
}
.beian .footer i {
  background-size: 100% 100%;
  display: inline-block;
  height: 18px;
  margin-right: 5px;
  vertical-align: middle;
  width: 18px;
}
.beian .footer a {
  font-size: 12px;
  line-height: 18px;
  margin-right: 5px;
  vertical-align: middle;
  color: #595959;
  text-decoration: none;
}
.beian .footer a:hover {
  text-decoration: underline;
}

.shouji-text {
            height: 64px;
            width: 1212px;
            margin: 0 auto;
            /* background-color: red; */
        }

        .shouji-text p {
            color: black;
            line-height: 64px;
            font-size: 25px;
            font-weight: bold;
            float: left;
        }

        .shouji-text p:first-child {
            margin-left: 50px;
        }

        .shouji-text span {
            float: right;
            margin-top: 30px;
            margin-right: 0px;
            font-size: 14px;
            color: #888;
        }

        .shouji-text i {
            float: right;
            margin-right: 60px;
            color: #888;
            font-size: medium;
            margin-top: 31px;
        }


        ul.shouji-flex {
            width: 1212px;
            height: 748px;
            margin: 10px auto;
            display: flex;
            /* background-color: red; */
        }

        ul.shouji-flex li {
            width: 291px;
            height: 374px;
            background-color: white;
            margin-left: 10px;
            margin-bottom: 10px;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        ul.shouji-flex li:hover {
            /* x 偏移量 | y 偏移量 | 阴影模糊半径 | 阴影颜色 */
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            /* 图片向上平移5px */
            transform: translateY(-5px);
        }



        ul.shouji-flex li img {
            height: 192.97px;
            width: 180.41px;
            margin-top: 40px;
            margin-left: 60px;
            margin-bottom: 40px;

        }

        ul.shouji-flex li h5 {
            text-align: center;
            color: #333;
        }

        ul.shouji-flex li p {
            text-align: center;
        }

        ul.shouji-flex li .descr {
            font-size: 13px;
            color: #aaa;
        }

        ul.shouji-flex li .price {
            font-size: 14px;
            color: #333;
            margin: 10px;
        }


        .shouji-flex {
            width: 1212px;
            height: 374px;
            margin: 10px auto;
            display: flex;
            /* background-color: red; */
            flex-wrap: wrap;
        }
</style>