// pages/address/index.js
Page({
  // 页面数据
  data: {
    orders: {},
    user: {},
    distap: true,
    order_detail: 'order_detail',
    showConfirmModal: false,
    tabs: [
      {
        id: 0,
        value: "全部订单",
        isActive: true
      },
      {
        id: 1,
        value: "待处理",
        isActive: false
      },
    ],
  },
  // 更换订单tab标签
  handleTabsItemChange(e) {
    const { index } = e.detail;
    let { tabs } = this.data;
    tabs = tabs.map((v, i) => {
      return {
        ...v,
        isActive: i === index
      };
    });
    this.setData({ tabs });
  },
  // 获取商家所有订单
  getOrder() {
    wx.request({
      url: 'http://kdst:8076/order/shop', // 仅为示例，并非真实的接口地址
      header: {
        'content-type': 'application/json' // 默认值
      },
      data: {
        id: this.data.user.shop_id,
      },
      method: 'post',
      success: (ret) => {
        this.setData({
          orders: ret.data.reverse()
        });
      }
    });
  },
  // 弹出确认框
  ensure() {
    this.setData({
      distap: false,
      showConfirmModal: true,
    });
  },
  // 再来一单
  again_order(e) {
    const { order } = e.currentTarget.dataset;
    let mystyle = null;
    let mychoice = [...order.orders, order.shop, order.orders[0].totalPrice];
    mychoice = JSON.stringify(mychoice);
    wx.navigateTo({
      url: '/pages/pay/index?mychoice=' + mychoice + '&mystyle=' + mystyle,
    });
  },
  // 确认改变订单状态
  confirmArrival(e) {
    const { order, status, msg } = e.currentTarget.dataset;
    wx.showToast({
      title: msg
    });
    wx.request({
      url: 'http://kdst:8076/order/status',
      header: {
        'content-type': "application/json"
      },
      data: {
        "id": order.order_no,
        "status": status, // 订单状态
      },
      method: "post",
      success: (ret) => {
        console.log(ret);
      }
    });
    this.setData({
      distap: true,
      showConfirmModal: false
    });
    this.onLoad();
  },
  // 取消更改订单状态
  cancelArrival() {
    this.setData({
      distap: true,
      showConfirmModal: false
    });
  },
  // 查看订单详情
  order_detail(e) {
    const { order } = e.currentTarget.dataset;
    console.log(order);
    wx.navigateTo({
      url: '/pages/order_detail/index?order=' + JSON.stringify(order),
    });
  },
  // 刷新页面更新数据
  onShow() {
    let user = wx.getStorageSync('userInfo');
    if (!user) {
      wx.navigateTo({
        url: '/pages/login/index',
      });
      return;
    }
    this.setData({
      user,
    });
    this.getOrder();
  },
})
