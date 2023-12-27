import QR from '@vant/weapp/wxapp-qrcode/utils/qrcode';
import QRCode from '@vant/weapp/qrcode-npm/qrcode';

Page({
  //  页面数据初始化
  data: {
    mychoice: [],
    mystyle: [],
    myfoods: [],
    modalHidden: true,
    defaultAddress: {},
    orders: {},
    to_time: "",
    note: "",
    Order: {},
    user: {},
    isPay: true
  },
  // 页面刷新时获取数据
  onShow() {
    let user = wx.getStorageSync('userInfo');
    if (!user) {
      wx.navigateTo({
        url: '/pages/login/index',
      })
    }
    this.setData({
      modalHidden: true,
      user,
    })
    this.getDefaultAddress();
  },
  // 载入页面时获取默认地址,选购的美食信息
  onLoad(options) {
    // this.getDefaultAddress();
    console.log(options);
    let mychoice = JSON.parse(options.mychoice);
    let mystyle = JSON.parse(options.mystyle);
    let myfoods = JSON.parse(JSON.stringify(mychoice));
    myfoods.splice(myfoods.length - 2, 2);
    //重新设置参数名
    if (myfoods[0].category_id == null) {
      var newFoodlist = [];
      myfoods.forEach(item => {
        var newFoods = {
          food_id: '',
          img: '',
          name: '',
          num: '',
          price: '',
          choiceSize: '',
        }
        newFoods.food_id = item.food_id;
        newFoods.img = item.food_image;
        newFoods.name = item.food_name;
        newFoods.num = item.food_num;
        newFoods.price = item.food_price;
        newFoods.choiceSize = item.choiceSizes;
        newFoodlist.push(newFoods);
      })
      myfoods = newFoodlist;
      mychoice[mychoice.length - 1] = (parseFloat(mychoice[mychoice.length - 1]) - parseFloat(mychoice[mychoice.length - 2][0].ps_fee)).toFixed(2);
    }
    mychoice[mychoice.length - 1] = (parseFloat(mychoice[mychoice.length - 1]) + parseFloat(mychoice[mychoice.length - 2][0].ps_fee)).toFixed(2);
    this.setData({
      myfoods,
      mychoice,
      mystyle,
    })
    this.setStyle();
    let to_time = this.getTime();
    console.log(myfoods[0].chocieSize);
    this.setData({
      to_time,
    })
  },
  // 重新设置口味显示内容的格式,以/连接
  setStyle() {
    if (this.data.mychoice[0].category_id == null) {
      return null;
    }
    let choiceSize = [];
    let myfoods = this.data.myfoods;
    myfoods.forEach(item => {
      if (item.food_id) {
        this.data.mystyle.forEach(item2 => {
          item2.forEach(item3 => {
            if (item3.food_id == item.food_id) {
              item3.sizes.forEach(item4 => {
                if (item4.choice) {
                  choiceSize.push(item4.name);
                }
              })
            }
          })
        })
        // item.choiceSize={"choiceSize":choiceSize.join("/")};
        item.choiceSize = "" + choiceSize.join("/");
        choiceSize = [];
      }
    })
    this.setData({
      myfoods,
    })
  },
  // 生成下单时间
  getTime() {
    var newDateTime = new Date().getTime();
    var date = new Date(newDateTime)
    var hour = date.getHours();
    var minute = date.getMinutes() + this.data.mychoice[this.data.mychoice.length - 2][0].time;
    var u = false;
    while (minute > 59) {
      minute = minute - 60;
      hour = hour + 1;
    }
    if (minute < 10) {
      minute = "0" + minute;
    }
    while (hour > 23) {
      hour = hour - 24;
      u = true;
    }
    if (u) {
      hour = "明日" + hour;
    }
    return hour + ":" + minute;
  },
  // 设置备注
  getNote(e) {
    let note = e.detail.value;
    this.setData({
      note,
    })
  },
  // 获取默认地址
  getDefaultAddress() {
    var that = this;
    wx.request({
      url: 'http://kdst:8076/address/defaultAddress',
      header: {
        'content-type': 'application/json'
      },
      data: {
        'user_id': this.data.user.user_id,
      },
      method: 'POST',
      success(ret) {
        console.log(ret.data)
        that.setData({
          defaultAddress: ret.data
        })
      }
    })
  },
  // 提交订单,显示支付码
  buttonTap() {
    this.getqrcode();
    if (!this.data.defaultAddress[0]) {
      this.tochange();
      return;
    }
    this.setData({
      modalHidden: false
    })
  },
  // 前往设置地址
  tochange() {
    wx.navigateTo({
      url: '/pages/address/index',
    })
    wx.showToast({
      title: '加载中',
      icon: 'loading',
      duration: 500
    })
  },
  //取消并查询支付结果
  modalCandel() {
    this.surePay()
    this.setData({
      modalHidden: true,
    })
    wx.showLoading({
      title: '支付结果查询中',
    })
    setTimeout(() => {
      if (this.data.isPay) {
        wx.showToast({
          title: '支付已支付',
        })
      } else {
        wx.showToast({
          title: '支付未支付',
        })
      }
    }, 2000)
  },
  //确认并查询支付结果
  modalConfirm() {
    this.surePay()
    this.setData({
      modalHidden: true
    })
    wx.showLoading({
      title: '支付结果查询中',
    })
    setTimeout(() => {
      if (this.data.isPay) {
        wx.showToast({
          title: '支付已支付',
        })
        let shop = this.data.mychoice[this.data.mychoice.length - 2];
        shop = JSON.stringify(shop);
        setTimeout(() => {
          wx.navigateTo({
            url: '/pages/pay_success/index?shop=' + shop,
          })
        }, 2000)
      } else {
        wx.showToast({
          title: '支付未支付',
        })
      }
    }, 2000)
  },
  // 生成订单号
  randomNumber() {
    let orderCode = '';
    for (var i = 0; i < 6; i++) {
      orderCode += Math.floor(Math.random() * 10);
    }
    orderCode = 'D' + new Date().getTime() + orderCode;
    return orderCode;
  },
  // 获取支付码
  getqrcode() {
    let Order = {};
    let Order_detail_list = [];
    //生成订单模板
    Order.create_time = new Date().toJSON().substring(0, 10) + ' ' + new Date().toTimeString().substring(0, 8);
    Order.order_no = this.randomNumber();
    Order.shop_id = this.data.mychoice[this.data.mychoice.length - 2][0].shop_id;
    Order.notes = this.data.note;
    Order.address_id = this.data.defaultAddress[0].address_id;
    Order.user_id = this.data.user.user_id;
    this.setData({
      Order,
    })
    Order_detail_list.push(Order);
    // 订单详情
    this.data.myfoods.forEach((item, index) => {
      var Order_detail = {}
      Order_detail.food_id = item.food_id;
      Order_detail.food_name = item.name;
      Order_detail.food_image = item.img;
      Order_detail.food_price = item.price;
      Order_detail.food_num = item.num;
      Order_detail.order_no = Order.order_no;
      Order_detail.totalPrice = this.data.mychoice[this.data.mychoice.length - 1];
      Order_detail.choiceSizes = item.choiceSize;
      Order_detail_list.push(Order_detail);
    });
    let that = this;
    wx.request({
      url: 'http://kdst:8076/order/pay',
      header: {
        'content-type': 'application/json'
      },
      data: {
        'shop': that.data.mychoice[that.data.mychoice.length - 2][0].name,
        'total': that.data.mychoice[that.data.mychoice.length - 1],
        "order_detail": JSON.stringify(Order_detail_list)
      },
      method: 'post',
      success(ret) {
        that.createQrCode(ret.data.qr_code, 'mycanvas', 200, 200)
        console.log(ret)
      }
    })
  },
  // 生成支付码 
  createQrCode(content, canvasId, cavW, cavH) {
    QR.api.draw(content, canvasId, cavW, cavH, this);
  },
  //回调查询数据库确认订单是否生成
  surePay() {
    let that = this;
    wx.request({
      url: 'http://kdst:8076/order/surepay',
      header: {
        'content-type': 'application/json'
      },
      data: {
        'order_no': that.data.Order.order_no
      },
      method: 'post',
      success(ret) {
        that.setData({
          isPay: ret.data
        })
      }
    })
  }
})