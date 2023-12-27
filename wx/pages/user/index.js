import Toast from '@vant/weapp/toast/toast';
Page({
  // 初始化页面数据
  data: {
    collectNums: 0,
    recordNums: 0,
    user: {},
    showShare: false,
    options: [{
        name: '微信',
        icon: 'wechat',
        openType: 'share'
      },
      {
        name: '微博',
        icon: 'weibo'
      },
      {
        name: '复制链接',
        icon: 'link'
      },
      {
        name: '分享海报',
        icon: 'poster'
      },
      {
        name: '二维码',
        icon: 'qrcode'
      },
    ],
  },
  // 刷新页面时获取用户信息 收藏信息 浏览信息
  onShow() {
    const user = wx.getStorageSync('userInfo');
    this.setData({
      user,
    });
    this.getrecordtNums();
    this.getcollectNums();
  },
  // 用户登出
  logout() {
    wx.removeStorageSync('userInfo');
    this.onShow();
  },
  // 前往更新用户信息
  updata() {
    wx.navigateTo({
      url: '/pages/updata/index',
    })
  },
  // 获取浏览记录数
  getrecordtNums() {
    var that = this
    wx.request({
      url: 'http://kdst:8076/record/num',
      header: {
        'content-type': 'application/json'
      },
      data: {
        id: this.data.user.user_id,
      },
      method: 'post',
      success(ret) {
        that.setData({
          recordNums: ret.data
        })
      }
    })
  },
  // 获取收藏数
  getcollectNums() {
    var that = this
    wx.request({
      url: 'http://kdst:8076/user/collectnum',
      header: {
        'content-type': 'application/json'
      },
      data: {
        id: this.data.user.user_id,
      },
      method: 'post',
      success(ret) {
        that.setData({
          collectNums: ret.data
        })
      }
    })
  },
  // 前往地址管理
  toAddress() {
    wx.navigateTo({
      url: '/pages/address/index',
    })
    wx.showToast({
      title: '加载中',
      icon: 'loading',
      duration: 500
    })
  },
  // 前往查看浏览记录
  toRecord() {
    wx.showToast({
      title: '加载中',
      icon: 'loading',
      duration: 500
    })
  },
  // 前往查看订单
  toOrder() {
    wx.showToast({
      title: '加载中',
      icon: 'loading',
      duration: 500
    })
  },
  // 分享应用
  onClick() {
    this.setData({
      showShare: true
    });
  },
  // 取消分享
  onClose() {
    this.setData({
      showShare: false
    });
  },
  // 选择分享应用
  onSelect(event) {
    Toast(event.detail.name);
    this.onClose();
  },
})