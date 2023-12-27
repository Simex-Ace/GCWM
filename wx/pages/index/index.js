Page({
  //初始化页面数据
  data: {
    shopList:[],
  },
  // 载入页面时获取首页信息
  onLoad(){
    this.getSwiperList();
  },
  // 获取首页信息
  getSwiperList(){
  let that = this;
  wx.request({
    url: 'http://kdst:8076/shop',
    header: {
      'content-type': "application/json"
    },
    method: "get",
    success(ret) {
      console.log(ret.data);
      that.setData({
        shopList:ret.data
      })
    },
  })
},
});