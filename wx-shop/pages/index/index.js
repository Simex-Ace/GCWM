//导入组件
import Notify from '@vant/weapp/notify/notify';
//初始化数据
Page({
  data: {
    shopList: [],
    user: {},
    show: true,
    foods: {},
    styles: {},
    checkhasNull: false,
    saveButtonDisabled: false,
  },
  //展示点击
  onClickShow() {
    this.setData({
      show: true
    });
  },
  //显示美食栏
  onshowFood(e) {
    const {
      index
    } = e.currentTarget.dataset;
    let foods = this.data.foods
    console.log(index)
    foods[index].showFood = !foods[index].showFood
    this.setData({
      foods,
    });
  },
  //显示口味栏
  onshowSize(e) {
    console.log(55);
    const {
      index,
      index2,
      index3
    } = e.currentTarget.dataset;
    let foods = this.data.foods
    console.log(index)
    foods[index].foods[index2].style[index3].showSize = !foods[index].foods[index2].style[index3].showSize;
    this.setData({
      foods,
    });
  },
  //更改分类名
  onChangeCategory(event) {
    const {
      index
    } = event.currentTarget.dataset;
    let foods = this.data.foods
    foods[index].name = event.detail;
    this.setData({
      foods,
    })
  },
  //更改美食名
  onChangeFood(event) {
    const {
      index,
      index2
    } = event.currentTarget.dataset;
    let foods = this.data.foods
    foods[index].foods[index2].name = event.detail;
    this.setData({
      foods,
    })
  },
  //更改美食介绍
  onChangeChara(event) {
    const {
      index,
      index2
    } = event.currentTarget.dataset;
    let foods = this.data.foods
    foods[index].foods[index2].chara = event.detail;
    this.setData({
      foods,
    })
  },
  //更改美食价格
  onChangePrice(event) {
    const {
      index,
      index2
    } = event.currentTarget.dataset;
    let foods = this.data.foods
    foods[index].foods[index2].price = event.detail;
    this.setData({
      foods,
    })
  },
  //更改美食口味
  onChangeStyle(event) {
    const {
      index,
      index2,
      index3,
    } = event.currentTarget.dataset;
    let foods = this.data.foods
    foods[index].foods[index2].style[index3].name = event.detail;
    this.setData({
      foods,
    })
  },
  //更改口味规格
  onChangeSize(event) {
    const {
      index,
      index2,
      index3,
      index4,
    } = event.currentTarget.dataset;
    let foods = this.data.foods
    foods[index].foods[index2].style[index3].sizes[index4].name = event.detail;
    this.setData({
      foods,
    })
  },
  //增加分类
  addcategory() {
    let foods = this.data.foods;
    foods.push({
        category: '',
        shop_id: '',
        showFood: false,
        name: '',
        foods: [],
      }),
      this.setData({
        foods,
      })
  },
  //增加美食
  addfood(event) {
    const {
      index
    } = event.currentTarget.dataset;
    let foods = this.data.foods;
    foods[index].foods.push({
      category: '',
      chara: '',
      fileList: [],
      food_id: '',
      img: '',
      name: '',
      price: '',
      sale: '',
      score: '',
      style: [],
    })
    foods[index].showFood = true;
    this.setData({
      foods,
    })
  },
  //增加口味
  addStyle(event) {
    const {
      index,
      index2,
    } = event.currentTarget.dataset;
    let foods = this.data.foods;
    if (!foods[index].foods[index2].style) {
      foods[index].foods[index2].style = [];
    }
    foods[index].foods[index2].style.push({
      style_id: '',
      food_id: '',
      name: '',
      showSize: true,
      sizes: [],
    })
    this.setData({
      foods,
    })
  },
  // 增加规格
  addSize(event) {
    const {
      index,
      index2,
      index3,
    } = event.currentTarget.dataset;
    let foods = this.data.foods;
    if (!foods[index].foods[index2].style[index3].sizes) {
      foods[index].foods[index2].style[index3].sizes = [];
    }
    foods[index].foods[index2].style[index3].sizes.push({
      style_id: '',
      size_id: '',
      name: '',
    })
    foods[index].foods[index2].style[index3].showSize = true;
    this.setData({
      foods,
    })
  },
  //删除分类
  del_category(event) {
    const {
      index
    } = event.currentTarget.dataset;
    let foods = this.data.foods;
    let that = this;
    wx.showModal({
      title: '确认删除',
      content: '确定要删除该分类吗？',
      success: function (res) {
        if (res.confirm) {
          foods.splice(index, 1);
          that.setData({
            foods,
          })
        } else if (res.cancel) {
          console.log('用户点击取消');
        }
      }
    })
  },
  //删除口味
  del_style(event) {
    const {
      index,
      index2,
      index3,
    } = event.currentTarget.dataset;
    let foods = this.data.foods;
    let that = this;
    wx.showModal({
      title: '确认删除',
      content: '确定要删除该口味吗？',
      success: function (res) {
        if (res.confirm) {
          foods[index].foods[index2].style.splice(index3, 1);
          that.setData({
            foods,
          })
        } else if (res.cancel) {
          console.log('用户点击取消');
        }
      }
    })
  },
  // 删除规格
  del_size(event) {
    const {
      index,
      index2,
      index3,
      index4,
    } = event.currentTarget.dataset;
    let foods = this.data.foods;
    let that = this;
    wx.showModal({
      title: '确认删除',
      content: '确定要删除该规格吗？',
      success: function (res) {
        if (res.confirm) {
          foods[index].foods[index2].style[index3].sizes.splice(index4, 1);
          that.setData({
            foods,
          })
        } else if (res.cancel) {
          console.log('用户点击取消');
        }
      }
    })
  },
  // 删除美食
  del_food(event) {
    const {
      index,
      index2
    } = event.currentTarget.dataset;
    let foods = this.data.foods;
    let that = this;
    wx.showModal({
      title: '确认删除',
      content: '确定要删除该美食吗？',
      success: function (res) {
        if (res.confirm) {
          foods[index].foods.splice(index2, 1);
          that.setData({
            foods,
          })
        } else if (res.cancel) {
          console.log('用户点击取消');
        }
      }
    })
  },
  //前往设置店铺
  onClickHide() {
    wx.navigateTo({
      url: '/pages/updata/index',
    })
  },

  //获取店铺信息
  getShop() {
    let that = this;
    wx.request({
      url: 'http://kdst:8076/category/shop',
      header: {
        'content-type': 'application/json'
      },
      data: {
        id: this.data.user.shop_id,
      },
      method: "POST",
      success(ret) {
        console.log(ret.data);
        let foods = ret.data.foods;
        foods.forEach(item => {
          item.showFood = false;
          item.foods.forEach(item => {
            item.fileList = [];
            if (item.style) {
              item.style.forEach(item => {
                item.showSize = false;
              })
            }
          })
        });
        that.setData({
          foods: ret.data.foods
        })
      }
    })
  },
  //获取商家信息
  getUser() {
    var that = this;
    wx.request({
      url: 'http://kdst:8076/user/shoper',
      header: {
        'content-type': 'application/json'
      },
      data: {
        "tel": this.data.user.tel,
        "password": this.data.user.password,
      },
      method: 'POST',
      success(ret) {
        console.log(55)
        if (!ret.data.user) {
          return;
        }
        wx.setStorageSync('userInfo', ret.data.user[0]);
        let show = ret.data.user[0].shop_id != null ? false : true;
        that.setData({
          user: ret.data.user[0],
          show,
        })
      }
    })
  },
  //更新上传美食照片
  afterRead(event) {
    const {
      file
    } = event.detail;
    const {
      index,
      index2
    } = event.currentTarget.dataset;
    console.log(event, index, index2)
    const that = this;
    const uuid = this.generateUUID();
    const repo = 'Simex1746/myfiles'; // 填你的仓库 repo
    const Token = '86c2c9a59aa875f7f2e6343e841b6fec'; // 填你的 Token
    const imageUrl = 'https://gitee.com/api/v5/repos/' + repo + '/contents/' + uuid + '.png';
    wx.getFileSystemManager().readFile({
      filePath: file.url,
      encoding: 'base64',
      success: function (res) {
        const base64Data = res.data;
        console.log(base64Data);
        const body = {
          access_token: Token,
          branch: 'master',
          message: 'score_img',
          content: base64Data,
        };
        wx.request({
          url: imageUrl,
          method: 'POST',
          data: body,
          success: function (res) {
            console.log(res.data.content);
            let foods = that.data.foods;
            let img = res.data.content;
            let fileList = foods[index].foods[index2].fileList;
            if (fileList.length != 0) {
              that.delete(index, index2);
            }
            fileList.push({
              deletable: true,
              isImage: true,
              url: img.download_url,
              name: img.name,
              sha: img.sha,
            });
            foods[index].foods[index2].img = img.download_url;
            that.setData({
              fileList,
              foods,
            });
          },
          fail: function (error) {
            console.log(error);
          }
        });
      },
      fail: function (error) {
        console.log(error);
      }
    });
  },
  //删除美食照片
  delete(index, index2) {
    let foods = this.data.foods;
    let fileList = foods[index].foods[index2].fileList;
    this.delete_img(fileList[0]);
    fileList.splice(0, 1);
    console.log(fileList);
    this.setData({
      foods,
    });
  },
  //获取uuid
  generateUUID() {
    const timestamp = new Date().getTime().toString(16); // 获取当前时间戳并转换为16进制
    const randomStr = Math.random().toString(16).substr(2, 6); // 生成一个6位的随机字符串
    return timestamp + randomStr;
  },
  //删除远程仓库的美食照片
  delete_img(img) {
    const name = img.name;
    const repo = 'Simex1746/myfiles'; // 填你的仓库 repo
    const imgurl = 'https://gitee.com/api/v5/repos/' + repo + '/contents/' + name;
    const sha = img.sha;
    console.log(img);
    const Token = '86c2c9a59aa875f7f2e6343e841b6fec';
    const body = {
      access_token: Token,
      branch: 'master',
      message: 'score_img_delete',
      sha: sha,
    };
    console.log(body);
    wx.request({
      url: imgurl,
      method: 'DELETE',
      data: body,
      success: function (res) {
        console.log(res);
      },
      fail: function (error) {
        console.log(error);
      }
    })
  },
  //保存店铺内容信息
  save() {
    this.dealwith();
    let checkhasNull = this.data.checkhasNull;
    if (checkhasNull) {
      return;
    }
    this.setData({
      saveButtonDisabled: true
    });
    Notify({
      color: '#ad0000',
      background: '#ffe1e1',
      message: '资料更新中',
    });
    let that = this;
    wx.request({
      url: 'http://kdst:8076/category/save',
      header: {
        'content-type': 'application/json'
      },
      data: {
        "foods": JSON.stringify(this.data.foods),
        "shop_id": this.data.user.shop_id,
      },
      method: 'POST',
      success(ret) {
        console.log(ret);
        setTimeout(() => {
          Notify({
            type: 'success',
            message: '资料已更新'
          });
          that.setData({
            saveButtonDisabled: false
          });
        }, 3000);
      },
    })
  },
  //判断更新信息是否完整
  removeEmptyItems(arr) {
    return arr.filter(item => {
      if (item.name) {
        if (item.foods) {
          item.foods = this.removeEmptyItems(item.foods);
        }
        if (item.style) {
          if (!item.chara || !item.price || !item.img) {
            console.log("信息尚未录入完整");
            this.setData({
              checkhasNull: true,
            })
            Notify({
              type: 'warning',
              message: '信息尚未录入完整'
            });
          }
          item.style = this.removeEmptyItems(item.style);
        }
        if (item.sizes) {
          item.sizes = this.removeEmptyItems(item.sizes);
        }
        return true;
      } else {
        return false;
      }
    });
  },
  //保存更新检查(排掉添加的空项)
  dealwith() {
    let foods = this.data.foods;
    // foods[0].foods.splice(2,3);
    // foods[0].foods.splice(0,1);
    // foods.splice(0,4);
    console.log(foods);
    this.setData({
      checkhasNull: false,
    })
    foods = this.removeEmptyItems(foods);
    this.setData({
      foods,
    });
  },
  //载入读取商家数据，店铺数据，判断是否登录
  //载入页面获取商家最新信息
  onLoad() {
    const user = wx.getStorageSync('userInfo');
    this.setData({
      user,
    })
    if (!user) {
      wx.navigateTo({
        url: '/pages/login/index',
      });
      return;
    }
    this.getUser();
    this.getShop();
  },
  onShow() {
    const user = wx.getStorageSync('userInfo');
    this.setData({
      user,
    })
    if (!user) {
      wx.navigateTo({
        url: '/pages/login/index',
      });
      return;
    }
    this.getUser();
    this.getShop();
  },
});