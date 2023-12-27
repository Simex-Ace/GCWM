Page({
  //初始号页面数据
  data: {
    orders: {},
    user: {},
    distap: true,
    order_detail: 'order_detail',
    showConfirmModal: false,
    tabs: [{
        id: 0,
        value: "全部订单",
        isActive: true
      },
      {
        id: 1,
        value: "待评价",
        isActive: false
      },
    ],
  },

  // 载入页面读取订单数据
  onLoad(options) {
    this.getOrder();
  },
// 切换tab标签，显示不同订单
  handleTabsItemChange(e) {
    const {
      index
    } = e.detail;
    let {
      tabs
    } = this.data;
    tabs.forEach((v, i) => i === index ? v.isActive = true : v.isActive = false);
    this.setData({
      tabs
    })
  },
// 获取订单
  getOrder() {
    var that = this;
    wx.request({
      url: 'http://kdst:8076/order', //仅为示例，并非真实的接口地址
      header: {
        'content-type': 'application/json' // 默认值
      },
      data: {
        id: this.data.user.user_id,
      },
      method: 'post',
      success(ret) {
        that.setData({
          orders: ret.data.reverse()
        })
      }
    })
  },
// 显示确认订单是否送达
  arrive() {
    this.setData({
      distap: false,
      showConfirmModal: true,
    });
  },
// 再来一单
  again_order(e) {
    const {
      order
    } = e.currentTarget.dataset;
    let mystyle = null;
    let mychoice = [];
    console.log(order)
    order.orders.forEach(item => {
      mychoice.push(item);
    })
    mychoice.push(order.shop);
    mychoice.push(order.orders[0].totalPrice);
    mychoice = JSON.stringify(mychoice);
    console.log(mychoice);
    wx.navigateTo({
      url: '/pages/pay/index?mychoice=' + mychoice + '&mystyle=' + mystyle,
    });
  },
  // 前往评价
  To_score(e) {
    const {
      order
    } = e.currentTarget.dataset;
    wx.showToast({
      title: '正在前往评价',
      icon: 'loading',
      duration: 2000
    })
    wx.navigateTo({
      url: '/pages/score/index?order=' + JSON.stringify(order),
    })
  },
// 确认订单是否送达
  confirmArrival(e) {
    const {
      order,
      change,
    } = e.currentTarget.dataset;
    if (change == 0) {
      this.ensureCancel(order);
    }
    if (change == 1) {
      this.ensureArrival(order);
    }
  },
// 取消订单
  ensureCancel(order) {
    wx.showToast({
      title: '订单已取消',
    })
    wx.request({
      url: 'http://kdst:8076/order/status', //仅为示例，并非真实的接口地址
      header: {
        'content-type': "application/json"
      },
      data: {
        "id": order.order_no,
        "status": 4,
      },
      method: "post",
      success(ret) {
        console.log(ret);
      }
    });
    this.setData({
      distap: true,
      showConfirmModal: false
    });
    this.onLoad();
  },
// 确定订单已完成
  ensureArrival(order) {
    wx.showToast({
      title: '订单已完成',
    })
    wx.request({
      url: 'http://kdst:8076/order/status', //仅为示例，并非真实的接口地址
      header: {
        'content-type': "application/json"
      },
      data: {
        "id": order.order_no,
        "status": 2,
      },
      method: "post",
      success(ret) {
        console.log(ret);
      }
    });
    this.setData({
      distap: true,
      showConfirmModal: false
    });
    this.onLoad();
  },
// 取消确认
  cancelArrival() {
    this.setData({
      distap: true,
      showConfirmModal: false
    });
  },
  // 前往对应店家
  To_shop(e) {
    const {
      order
    } = e.currentTarget.dataset;
    console.log(order);
    wx.navigateTo({
      url: '/pages/category/index?shop_id=' + order.shop_id,
    })
  },
// 前往查看订单详情
  order_detail(e) {
    const {
      order
    } = e.currentTarget.dataset;
    console.log(order);
    wx.navigateTo({
      url: '/pages/order_detail/index?order=' + JSON.stringify(order),
    })
  },
  // 刷新页面时重新获取订单
  onShow() {
    this.getOrder();
    let user = wx.getStorageSync('userInfo');
    if (!user) {
      wx.navigateTo({
        url: '/pages/login/index',
      })
    }
    this.setData({
      user,
    })
    this.getOrder();
  },
})