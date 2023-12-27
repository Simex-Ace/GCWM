// 导入对应组件
import Notify from '@vant/weapp/notify/notify';
Page({
// 初始化页面数据
  data: {
    count: '',
    pwd: '',
    user: {},
    show: true,
    code: '',
    _code: '',
  },
// 登录检查
  login() {
    let count = this.data.count;
    let pwd = this.data.pwd;
    if (!count) {
      Notify({
        type: 'warning',
        message: '账号不能为空'
      });
      return;
    }
    if(!this.validatePhoneNumber(count)){
      Notify({
        type: 'warning',
        message: '手机号码格式有误'
      });
      return;
    }
    if (!pwd) {
      Notify({
        type: 'warning',
        message: '密码不能为空'
      });
      return;
    }
    this.getUser(count, pwd);
  },
// 切换注册登录状态
show() {
  this.updateCaptcha();
  let show = !this.data.show;
  this.setData({
    show,
  });
},
// 注册检查
  sign() {
    let count = this.data.count;
    let pwd = this.data.pwd;
    let code = this.data.code;
    let _code = this.data._code;
    if (!count) {
      Notify({
        type: 'warning',
        message: '账号不能为空'
      });
      return;
    }
    if(!this.validatePhoneNumber(count)){
      Notify({
        type: 'warning',
        message: '手机号码格式有误'
      });
      return;
    }
    if (!pwd) {
      Notify({
        type: 'warning',
        message: '密码不能为空'
      });
      return;
    }
    if (!code) {
      Notify({
        type: 'warning',
        message: '验证码不能为空'
      });
      this.updateCaptcha();
      return;
    }
    if (code != _code) {
      Notify({
        type: 'warning',
        message: '验证码错误'
      });
      this.updateCaptcha();
      return;
    }
    this.setUser(count, pwd);
  },
// 登录判断,返回设置登录结果
  getUser(count, pwd) {
    var that = this;
    wx.request({
      url: 'http://kdst:8076/user',
      header: {
        'content-type': 'application/json'
      },
      data: {
        "tel": count,
        "password": pwd,
      },
      method: 'get',
      success(ret) {
        console.log(ret.data)
        let msg = ret.data.msg
        if (msg != '') {
          Notify({
            type: 'danger',
            message: msg
          });
        } else {
          Notify({
            type: 'success',
            message: '登录中'
          });
          console.log(55)
          wx.setStorageSync('userInfo', ret.data.user[0]);
          console.log(5555)
          setTimeout(function () {
            wx.switchTab({
              url: '/pages/user/index',
            })
          }, 2000)
        }
        that.setData({
          user: ret.data.user
        })
      }
    })
  },
// 提交注册信息,返回注册结果
  setUser(count, pwd) {
    wx.request({
      url: 'http://kdst:8076/user/sign',
      header: {
        'content-type': 'application/json'
      },
      data: {
        "tel": count,
        "password": pwd,
      },
      method: 'post',
      success(ret) {
        let msg = ret.data.msg;
        if (msg != '') {
          Notify({
            type: 'danger',
            message: msg
          });
        } else {
          Notify({
            type: 'success',
            message: '注册成功...登录中'
          });
          wx.setStorageSync('userInfo', ret.data.user[0]);
          setTimeout(function () {
            wx.switchTab({
              url: '/pages/user/index',
            })
          }, 2000)
        }
      }
    })
  },
// 手机号码校验规则
  validatePhoneNumber(phoneNumber) {
    var regex = /^1[3456789]\d{9}$/;
    return regex.test(phoneNumber);
  },
// 更新验证码
  updateCaptcha() {
    var chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    var _code = '';
    for (var i = 0; i < 4; i++) {
      var randomIndex = Math.floor(Math.random() * chars.length);
      _code += chars.charAt(randomIndex);
    }
    this.setData({
      _code,
    });
  },
// 更新账号输入信息
  save_count(e) {
    let count = e.detail.value
    this.setData({
      count,
    })
  },
  // 更新密码输入信息
  save_pwd(e) {
    let pwd = e.detail.value
    this.setData({
      pwd,
    })
  },
  // 更新验证码输入信息
  save_code(e) {
    let code = e.detail.value
    this.setData({
      code,
    })
  },
// 返回首页
  Tohome(){
    wx.switchTab({
      url: '/pages/user/index',
    })
  },
})