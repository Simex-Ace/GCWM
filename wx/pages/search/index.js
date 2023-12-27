Page({
  // 初始化页面数据
  data: {
    isFocus: false,
    inputValue: ""
  },
  TimeId: -1,
  // 处理输入搜索内容
  handleInput(e) {
    const {
      value
    } = e.detail;
    if (!value.trim()) {
      this.setData({
        goods: [],
        isFocus: false
      })
      return;
    }
    this.setData({
      isFocus: true
    })
    // 清除定时器
    clearTimeout(this.TimeId);
    // 每隔一秒定自动搜索搜索框内容
    this.TimeId = setTimeout(() => {
      this.qsearch(value);
    }, 1000)
  },
  // 取消搜索 清空搜索框
  handleCancel() {
    this.setData({
      inputValue: '',
      isFocus: false,
      goods: []
    })
  },

  //查询店铺名称
  qsearch(query) {
    let that = this;
    wx.request({
      url: 'http://kdst:8076/shop/search',
      header: {
        'content-type': 'application/json'
      },
      data: {
        'shop_name': query,
      },
      method: 'post',
      success(ret) {
        console.log(ret.data);
        that.setData({
          shops: ret.data,
        })
      }
    })
  },
})