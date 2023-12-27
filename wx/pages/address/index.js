Page({
  // 初始化页面数据
  data: {
    address: [],
    editAddress: {}, // 用于存储当前编辑的地址信息
    showDialog: false, // 
    decide: false,
    user: {},
  },
  // 前往添加地址
  add() {
    wx.navigateTo({
      url: '/pages/addaddress/index'
    })
  },
  // 删除确认
  delete(res) {
    let address = res.currentTarget.dataset.address;
    console.log(address)
    let that = this;
    wx.showModal({
      title: '是否删除该地址？',
      content: '',
      complete: (res) => {
        console.log(address.id);
        if (res.cancel) {
          return;
        }
        if (res.confirm) {
          if (address.status == 1) {
            wx.showToast({
              title: '默认地址不可删除',
            })
            return;
          } else {
            wx.request({
              url: 'http://kdst:8076/address/delete',
              header: {
                'content-type': "application/json"
              },
              data: {
                "address": JSON.stringify(address)
              },
              method: "post",
              success(ret) {
                console.log(ret);
                wx.redirectTo({
                  url: '/pages/address/index',
                })
              }
            });
          }
        }
      }
    })
  },
  // 修改默认地址
  changeStatus(res) {
    let address = res.currentTarget.dataset.address;
    let that = this;
    wx.showModal({
      title: '是否设置为默认地址？',
      content: '',
      complete: (res) => {
        if (res.cancel) {
          return;
        }
        if (res.confirm) {
          wx.request({
            url: 'http://kdst:8076/address/status',
            header: {
              'content-type': "application/json"
            },
            data: {
              "address": JSON.stringify(address),
              "id": this.data.user.user_id
            },
            method: "post",
            success(ret) {
              console.log(ret);
            }
          });
          wx.redirectTo({
            url: '/pages/address/index',
          })
        }
      }
    })
  },
  //获取用户所有地址
  getAddress() {
    var that = this;
    wx.request({
      url: 'http://kdst:8076/address',
      header: {
        'content-type': 'application/json'
      },
      data: {
        'user_id': this.data.user.user_id,
      },
      method: "POST",
      success(ret) {
        console.log(ret.data)
        that.setData({
          address: ret.data
        })
      }
    })
  },
  // 显示地址编辑窗口
  showEditDialog(e) {
    var index = e.currentTarget.dataset.index;
    var address = this.data.address[index];
    this.setData({
      editAddress: address,
      showDialog: true // 显示弹窗
    });
  },
  // 保存编辑地址
  saveEdit(data) {
    const id = this.data.editAddress.address_id;
    const address = this.data.address;
    let Nowaddress = null;
    address.forEach(item => {
      if (item.address_id === id) {
        item.name = data.detail.value.name;
        item.phone = data.detail.value.phone;
        item.address = data.detail.value.address;
        Nowaddress = item;
      }
    });
    this.setData({
      address: address,
      showDialog: false,
      editIndex: -1,
      editAddress: {
        name: '',
        phone: '',
        address: ''
      }
    });
    wx.request({
      url: 'http://kdst:8076/address/save',
      header: {
        'content-type': "application/json"
      },
      data: {
        "address": JSON.stringify(Nowaddress)
      },
      method: "post",
      success(ret) {
        console.log(ret);
      }
    });
  },
  // 隐藏弹窗
  hideEditDialog() {
    this.setData({
      showDialog: false
    });
  },
  // 页面刷新时获取用户数据
  onShow() {
    let user = wx.getStorageSync('userInfo');
    if (!user) {
      wx.navigateTo({
        url: '/pages/login/index',
      })
    }
    this.setData({
      user,
    })
    this.getAddress();
  }
});