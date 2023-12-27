Page({
// 初始化页面信息
  data: {
    record: {},
    user: {},
  },
// 载入页面时获取浏览记录信息
  onLoad(options) {
    this.setuser();

    this.getRecord();
  },
// 获取浏览记录
  getRecord() {
    var that = this;
    wx.request({
      url: 'http://kdst:8076/record',
      header: {
        'content-type': 'application/json'
      },
      data: {
        id: that.data.user.user_id,
      },
      method: 'post',
      success(ret) {
        that.setData({
          record: ret.data
        })
      }
    })
  },
  // 删除对应浏览记录
  delRecord(e) {
    var that = this;
    var id = e.currentTarget.dataset.id;
    console.log(id);
    wx.showModal({
      title: '是否删除该记录？',
      content: '',
      complete: (res) => {
        if (res.cancel) {
          return;
        }
        if (res.confirm) {
          wx.request({
            url: 'http://kdst:8076/record/del',
            header: {
              'content-type': "application/json"
            },
            data: {
              "id": id
            },
            method: "post",
            success() {
              wx.redirectTo({
                url: '/pages/record/index',
              })
            }
          });
        }
      }
    })
  },
  // 清空浏览记录
  del_all() {
    var that = this;
    wx.showModal({
      title: '是否删除全部浏览记录？',
      content: '',
      complete: (res) => {
        if (res.cancel) {
          return;
        }
        if (res.confirm) {
          wx.request({
            url: 'http://kdst:8076/record/del_all',
            header: {
              'content-type': 'application/json'
            },
            data: {
              id: this.data.user.user_id,
            },
            method: 'post',
            success(ret) {
              that.setData({
                record: null
              })
            }
          })
        }
      },
    })
  },
  // 首页刷新设置用户信息
  onShow() {
    this.setuser();
  },
  // 获取用户信息
  setuser() {
    let user = wx.getStorageSync('userInfo');
    if (!user) {
      wx.navigateTo({
        url: '/pages/login/index',
      })
    }
    this.setData({
      user,
    })
  },
})