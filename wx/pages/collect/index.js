Page({
  // 初始化页面数据
  data: {
    collect:[],
  },
// 获取收藏信息
  getcollect() {
    let user = wx.getStorageSync('userInfo');
    let that = this;
    wx.request({
      url: 'http://kdst:8076/category/collect',
      header: {
        'content-type': "application/json"
      },
      data: {
        "user_id": user.user_id,
      },
      method: "post",
      success(ret) {
        console.log(ret.data);
        that.setData({
          collect: ret.data
        })
      },
    })
  },
// 展示首页结果
  onShow() {
    const collect=wx.getStorageSync('collect')||[];
    this.setData({
      collect
    });
    this.getcollect();
  },
})