// pages/user/index.js
import Toast from '@vant/weapp/toast/toast';
Page({
//页面数据
  data: {
    collectNums: 0,
    recordNums: 0,
    user: {},
    showShare: false,
    options: [
      { name: '微信', icon: 'wechat', openType: 'share' },
      { name: '微博', icon: 'weibo' },
      { name: '复制链接', icon: 'link' },
      { name: '分享海报', icon: 'poster' },
      { name: '二维码', icon: 'qrcode' },
    ],
  },
  //刷新页面获取设置商家信息
  onShow() {
    const user = wx.getStorageSync('userInfo');
    this.setData({
      user,
    });
  },
//商家登出
  logout(){
    wx.removeStorageSync('userInfo');
    this.onShow();
  },
//前往更新店铺信息
  updata(){
    wx.navigateTo({
      url: '/pages/updata/index',
    })
  },
})