// 导入百度地图组件
var bmap = require('../../libs/bmap-wx.min.js');
var bmap2 = require('../../libs/bmap-wx.js');
var wxMarkerData = [];
Page({
  // 初始化页面数据
  data: {
    name: "",
    phone: "",
    address: "",
    status: false,
    user: {},
    markers: [],
    latitude: '',
    longitude: '',
    rgcData: {}
  },
  // 设置姓名
  nameinput(e) {
    const {
      name
    } = e.currentTarget.dataset;
    this.setData(
      name
    )
  },
  // 设置电话
  phoreinput(e) {
    const {
      phone
    } = e.currentTarget.dataset;
    this.setData(
      phone
    )
  },
  // 设置地址
  addressinput(e) {
    const {
      address
    } = e.currentTarget.dataset;
    this.setData(
      address
    )
    this.mapshow()
  },
  // 保存新增地址信息
  saveTo() {
    var newaddress = {
      name: null,
      phone: null,
      address: null,
      status: null,
    }
    if (this.data.name == "" || this.data.phone == "" || this.data.address == "") {
      wx.showModal({
        title: '请输入必要信息！',
        content: '',
        showCancel: false,
      })
    } else {
      newaddress.name = this.data.name;
      newaddress.phone = this.data.phone;
      newaddress.address = this.data.address;
      newaddress.status = this.data.status ? 1 : 0;
      newaddress.user_id = this.data.user.user_id;
      wx.request({
        url: 'http://kdst:8076/address/add',
        header: {
          'content-type': "application/json"
        },
        data: {
          "address": JSON.stringify(newaddress)
        },
        method: "post",
        success() {
          wx.navigateTo({
            url: '/pages/address/index',
          })
        }
      });
    }
  },
  // 设置默认地址
  setdefault() {
    let status = !this.data.status;
    console.log(status)
    this.setData({
      status
    })
  },
  // 页面加载时获取数据
  onLoad(options) {
    let user = wx.getStorageSync('userInfo');
    if (!user) {
      wx.redirectTo({
        url: '/pages/login/index',
      })
    }
    this.setData({
      user,
    })
    this.beginmapshow()
  },
  // 通过输入地址检索显示周边地址
  mapshow() {
    var that = this;
    var BMap = new bmap.BMapWX({
      ak: 'GAAFcxvr2TkfNM3Xd6WY2k7bsZCiUBGq'
    });
    var fail = function (data) {
      console.log(data)
    };
    var success = function (data) {
      wxMarkerData = data.wxMarkerData;
      that.setData({
        markers: wxMarkerData
      });
      that.setData({
        latitude: wxMarkerData[0].latitude
      });
      that.setData({
        longitude: wxMarkerData[0].longitude
      });
    }
    // 发起geocoding检索请求 
    BMap.geocoding({ 
      address: this.data.address, 
      fail: fail, 
      success: success, 
      iconPath: '../../img/marker_red.png', 
      iconTapPath: '../../img/marker_red.png' 
  }); 
  },
// 显示大概默认地址(定位到市)
  beginmapshow() {
    var that = this;
    var BMap = new bmap2.BMapWX({
      ak: 'GAAFcxvr2TkfNM3Xd6WY2k7bsZCiUBGq'
    });
    var fail = function (data) {
      console.log(data)
    };
    var success = function (data) {
      wxMarkerData = data.wxMarkerData;
      that.setData({
        markers: wxMarkerData
      });
      that.setData({
        latitude: wxMarkerData[0].latitude
      });
      that.setData({
        longitude: wxMarkerData[0].longitude
      });
    }
    BMap.regeocoding({ 
      fail: fail, 
      success: success, 
      iconPath: '../../img/marker_red.png', 
      iconTapPath: '../../img/marker_red.png' 
  });
  },
})