//引入组件
import Notify from '@vant/weapp/notify/notify';
import {
  areaList
} from '@vant/weapp/area-data/dist/data';
//初始数据
Page({
  data: {
    user: {},
    sex: ['男', '女'],
    Region: '',
    show: false,
    _showSex: false,
    _showRegion: false,
    _showPassword: false,
    areaList,
    fileList: [],
    shop: {
      name: '',
      img: 'https://hbimg.huabanimg.com/0cb90f5923cd688013de1473a651ca7a438762532c992c-9PFYeZ_fw658',
      time: '',
      distance: '',
      chara: '',
      qs_fee: '',
      ps_fee: '',
      tel: '',
    },
  },
  //载入页面读取用户信息
  onLoad(options) {
    let user = wx.getStorageSync('userInfo');
    this.setData({
      user,
    })
    this.getshop();
  },
  //获取店铺信息
  getshop() {
    var that = this;
    wx.request({
      url: 'http://kdst:8076/shop/get',
      header: {
        'content-type': 'application/json'
      },
      data: {
        'id': this.data.user.shop_id,
      },
      method: 'post',
      success(ret) {
        console.log(ret.data);
        let shop = ret.data[0];
        if (shop) {
          that.setData({
            shop,
          })
        } else {
          console.log('店铺未设置')
        }
      }
    })
  },
  //修改店铺名
  onChangeName(e) {
    let shop = this.data.shop
    shop.name = e.detail;
    this.setData({
      shop,
    })
  },
  //修改店铺介绍
  onChangeChara(e) {
    let shop = this.data.shop
    shop.chara = e.detail;
    this.setData({
      shop,
    })
  },
  //修改配送距离
  onChangeDis(e) {
    let shop = this.data.shop
    shop.distance = e.detail;
    this.setData({
      shop,
    })
  },
  //修改起送费
  onChangeQs(e) {
    let shop = this.data.shop
    shop.qs_fee = e.detail;
    this.setData({
      shop,
    })
  },
  //修改配送费
  onChangePs(e) {
    let shop = this.data.shop
    shop.ps_fee = e.detail;
    this.setData({
      shop,
    })
  },
  //修改电话号码
  onChangeTel(e) {
    let shop = this.data.shop
    shop.tel = e.detail;
    this.setData({
      shop,
    })
  },
  //修改配送时间
  onChangeTime(e) {
    let shop = this.data.shop
    shop.time = e.detail;
    this.setData({
      shop,
    })
  },
  //门店头像上传
  afterRead(event) {
    const {
      file
    } = event.detail;
    console.log(event)
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
            let img = res.data.content;
            let fileList = that.data.fileList;
            if (fileList.length != 0) {
              that.delete();
            }
            fileList.push({
              deletable: true,
              isImage: true,
              url: img.download_url,
              name: img.name,
              sha: img.sha,
            });
            let shop = that.data.shop;
            shop.img = img.download_url;
            that.setData({
              fileList,
              shop,
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
  //删除原来的店铺头像
  delete() {
    let fileList = this.data.fileList;
    this.delete_img(fileList[0]);
    fileList.splice(0, 1);
    console.log(fileList);
    this.setData({
      fileList
    });
  },
  //获取uuid
  generateUUID() {
    const timestamp = new Date().getTime().toString(16); // 获取当前时间戳并转换为16进制
    const randomStr = Math.random().toString(16).substr(2, 6); // 生成一个6位的随机字符串
    return timestamp + randomStr;
  },
  //删除远程仓库原来的店铺头像
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
  //保存店铺设置
  save() {
    let shop=this.data.shop;
    if(!(shop.name&&shop.chara&&shop.distance&&shop.img&&shop.ps_fee&&shop.qs_fee&&shop.tel&&shop.time)){
      Notify({
        type: 'danger',
        message: '请输入完整店铺信息！'
      });
      return;
    }
    let user = this.data.user;
    let that = this;
    wx.request({
      url: 'http://kdst:8076/shop/save',
      header: {
        'content-type': 'application/json'
      },
      data: {
        'shop': JSON.stringify(shop),
        'shop_id': this.data.user.shop_id,
        'user_id': this.data.user.id,
      },
      method: 'post',
      success(ret) {
        console.log(ret.data);
        user.shop_id = ret.data;
        that.setData({
          user,
        })
        wx.setStorageSync('userInfo', user);
        Notify({
          type: 'success',
          message: '提交店铺信息成功~请等待审核'
        });
      }
    })
  },
})