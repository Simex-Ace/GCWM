Page({
// 初始化页面数据
  data: {
    order:0,
    orderDetail:[],
    address:{}
  },
// 载入页面时读取订单详情和地址信息
  onLoad(options) {
    let order=JSON.parse(options.order);
    this.setData({
      order,
    })
    this.getOrderDetail();
    this.getaddress();
  },
// 获取默认地址
  getaddress() {
    var that = this;
    wx.request({
      url: 'http://kdst:8076/address/get',
      header: {
        'content-type': 'application/json'
      },
      data:{
        'user_id':wx.getStorageSync('userInfo').user_id,
        'address_id':this.data.order.address_id,
      },
      method: 'POST',
      success(ret) {
        console.log(ret.data)
        that.setData({
          address: ret.data
        })
      }
    })
  },
  // 获取订单详情
  getOrderDetail() {
    var that=this;
    wx.request({
      url: 'http://kdst:8076/order/getDetail',
      header: {
        'content-type': 'application/json'
      },
      data:{
        order:that.data.order.order_no
      },
      method: 'post',
      success(ret) {
        that.setData({
          orderDetail:ret.data
        })
      }
    })
  },
})