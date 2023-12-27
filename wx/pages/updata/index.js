// 导入组件
import Notify from '@vant/weapp/notify/notify';
import {
  areaList
} from '@vant/weapp/area-data/dist/data';
Page({
  // 初始化页面数据
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

  },
  // 载入页面时获取用户信息
  onLoad() {
    let user = wx.getStorageSync('userInfo');
    this.setData({
      user,
    })
  },
  // 切换性别选择
  showSex() {
    let _showSex = !this.data._showSex
    this.setData({
      _showSex,
      _showRegion: false,
      _showPassword: false,
    })
  },
  // 切换地区选择
  showRegion() {
    let _showRegion = !this.data._showRegion
    this.setData({
      _showSex: false,
      _showRegion,
      _showPassword: false,
    })
  },
  // 切换密码可见
  showPwd() {
    let _showPassword = !this.data._showPassword
    this.setData({
      _showSex: false,
      _showRegion: false,
      _showPassword,
    })
  },
  // 修改密码
  onChangePwd(e) {
    let user = this.data.user
    user.password = e.detail;
    this.setData({
      user,
    })
  },
  // 修改性别
  onChangeSex(e) {
    let user = this.data.user
    user.sex = e.detail.value;
    this.setData({
      user,
    })
  },
  // 修改昵称
  onChangeName(e) {
    let user = this.data.user
    user.name = e.detail;
    this.setData({
      user,
    })
  },
  // 修改地区
  onChangeRegion(e) {
    console.log(e)
    let Arry = e.detail.values;
    let user = this.data.user;
    var region = '';
    var Region = '';
    Arry.forEach((item, index) => {
      console.log(item);
      if (index != 2) {
        region += item.name + '-';
      } else {
        region += item.name;
        Region = item.code;
      }
      console.log(region);
      console.log(Region);
    })
    user.region = region;
    this.setData({
      user,
      Region,
      _showRegion: false,
    })
  },
  // 关闭地区选择
  onClose() {
    this.setData({
      _showRegion: false
    });
  },
  // 上传用户头像
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
            let user = that.data.user;
            user.img = img.download_url;
            that.setData({
              fileList,
              user,
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
  // 删除用户头像
  delete() {
    let fileList = this.data.fileList;
    this.delete_img(fileList[0]);
    fileList.splice(0, 1);
    console.log(fileList);
    this.setData({
      fileList
    });
  },
  // 获取头像随机id
  generateUUID() {
    const timestamp = new Date().getTime().toString(16); // 获取当前时间戳并转换为16进制
    const randomStr = Math.random().toString(16).substr(2, 6); // 生成一个6位的随机字符串
    return timestamp + randomStr;
  },
  // 删除远程仓库的头像
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
  // 保存用户信息
  save() {
    let user = this.data.user;
    let that = this;
    wx.request({
      url: 'http://kdst:8076/user/save',
      header: {
        'content-type': 'application/json'
      },
      data: {
        'user': JSON.stringify(user),
      },
      method: 'post',
      success(ret) {
        console.log(ret.data[0]);
        wx.setStorageSync('userInfo', ret.data[0]);
        that.setData({
          user,
        })
        Notify({
          type: 'success',
          message: '资料更新成功'
        });
      }
    })
  },
})