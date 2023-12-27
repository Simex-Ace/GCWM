Page({
// 初始化页面数据
  data: {
    show: false,
    submit: false,
    viewHeight: 140,
    view2Height: 140,
    view2top: 220,
    uploading_view_height: 75,
    food_reason_height: 300,
    tagcolor: "nochoice",
    nosatitag: [0, 0, 0, 0, 0, 0, 0, 0, 0],
    satitag: [0, 0, 0, 0, 0, 0],
    color1: 'rgb(246,246,246)',
    color2: 'rgb(255,251,209)',
    colortext1: 'rgb(140,140,140)',
    colortext2: 'rgb(202,148,75)',
    currentDate: '12:00',
    nosati: false,
    sati: false,
    minHour: 0,
    maxHour: 23,
    checked: false,
    extend: true,
    star: 0,
    star2: 0,
    star3: 0,
    placeholder: '',
    fileList: [],
    content: '',
    Ifclu: false,
    gus1: false,
    gus2: false,
    order: {},
    commit_content: '',
  },
// 提交评价
  submit_score() {
    let score = {};
    score.message = this.data.commit_content;
    score.img1 = '';
    score.img2 = '';
    score.img3 = '';
    this.data.fileList.forEach((item, key) => {
      if (key == 0) {
        score.img1 = item.url;
      }
      if (key == 1) {
        score.img2 = item.url;
      }
      if (key == 2) {
        score.img3 = item.url;
      }
    })
    score.time = new Date().toJSON().substring(0, 10);
    score.user_id = this.data.order.user_id;
    score.score = parseInt((this.data.star + this.data.star2 + this.data.star3) / 3);
    score.shop_id = this.data.order.shop_id;
    score.order_on = this.data.order.orders[0].order_no;
    console.log(score);
    let that=this;
    wx.request({
      url: 'http://kdst:8076/score/add', 
      header: {
        'content-type': 'application/json' 
      },
      data: {
        "score": JSON.stringify(score)
      },
      method: 'post',
      success(ret) {
        console.log(ret.data)
        that.order_status();
        setTimeout(() => {
          wx.switchTab({
            url: '/pages/index/index',
          })
        }, 500)
      },
      fail(error) {
        console.log(error);
      }
    })
  },
// 评价后改变订单状态
  order_status(){
    wx.request({
      url: 'http://kdst:8076/order/status',
      header: {
        'content-type': "application/json"
      },
      data: {
        "id": this.data.order.order_no,
        "status": 3
      },
      method: "post",
      success(ret) {
        console.log(ret);
      }
    });
  },
// 提交前检查
  check_submit() {
    let t = true;
    if (this.data.sati) {
      if (this.data.star && this.data.star2 && this.data.star3) {
        this.setData({
          submit: true
        })
        return;
      }
    }
    if (this.data.nosati) {
      this.data.nosatitag.forEach(item => {
        if (item == 1) {
          if (this.data.star && this.data.star2 && this.data.star3) {
            t = false;
            this.setData({
              submit: true
            })
            return;
          }
        }
      })
    }
    if (t) {
      this.setData({
        submit: false
      })
    }
  },
  //满意和不满意
  changeViewHeight1() {
    if (this.data.nosati) {
      let satitag = this.data.satitag;
      satitag = [0, 0, 0, 0, 0, 0];
      this.setData({
        viewHeight: 285,
        view2top: 360,
        satitag,
      });
    } else {
      let nosatitag = this.data.nosatitag;
      nosatitag = [0, 0, 0, 0, 0, 0, 0, 0, 0];
      this.setData({
        viewHeight: 190,
        view2top: 265,
        nosatitag,
      });
    }
  },
  //写评价
  changeViewHeight2() {
    if (this.data.satitag[5] == 0) {
      this.setData({
        viewHeight: 190,
        view2top: 270,
      });
    } else {
      this.setData({
        viewHeight: 280,
        view2top: 360,
      });
    }
  },
  //总体
  changeView2Height1() {
    let view2Height = 220 + this.data.view2Height + 80;
    if (true) {
      this.setData({
        // view2Height: 285,
        view2Height,
      });
    }
  },
  //图片超两张
  changeView2Height2() {
    let view2Height = this.data.view2Height + 75;
    let uploading_view_height = 160;
    let food_reason_height = 375;
    console.log(this.data.fileList.length)
    if (this.data.fileList.length == 2) {
      this.setData({
        view2Height,
        uploading_view_height,
        food_reason_height,
      });
    }
  },
  //小于两张
  changeView2Height3() {
    let view2Height = this.data.view2Height - 75;
    let uploading_view_height = 75;
    let food_reason_height = 300;
    console.log(this.data.fileList.length)
    if (this.data.fileList.length == 1) {
      this.setData({
        view2Height,
        uploading_view_height,
        food_reason_height,
      });
    }
  },
// 星星改变默认文本随之改变
  choice_placeholder(star2, star3) {
    let placeholder;
    if (star2 < 3 && star3 < 3) {
      placeholder = "对口味、包装不满意？可描述问题，帮助商家改善";
    }
    if (star2 < 3 && star3 > 3) {
      placeholder = "对口味不满意？可描述问题，帮助商家改善";
    }
    if (star2 > 3 && star3 < 3) {
      placeholder = "对包装不满意？可描述问题，帮助商家改善";
    }
    if (star2 > 3 && star3 > 3) {
      placeholder = "✍说说味道怎么样，给大家参考";
    }
    return placeholder;
  },
  // 评价星星1
  score_star(event) {
    let star = event.detail;
    let placeholder = "✍说说味道怎么样，给大家参考";
    let checked = false;
    if (star < 3) {
      checked = true;
      placeholder = "对口味、包装不满意？可描述问题，帮助商家改善";
    }
    this.setData({
      star,
      checked,
      placeholder,
    })
    console.log(this.data.star);
    let extend = this.data.extend;
    if (extend) {
      this.changeView2Height1();
      this.setData({
        extend: false,
      })
    }
  },
  // 评价星星2
  score_star2(event) {
    let star2 = event.detail;
    let star3 = this.data.star3;
    let placeholder = this.choice_placeholder(star2, star3);
    this.setData({
      star2,
      placeholder,
    })
    this.check_submit();
  },
  // 评价星星3
  score_star3(event) {
    let star2 = this.data.star2;
    let star3 = event.detail;
    let placeholder = this.choice_placeholder(star2, star3);
    this.setData({
      star3,
      placeholder,
    })
    this.check_submit();
  },
  // 修改达到时间
  onInput(v) {
    this.replaceTime(this.data.order.create_time, v.detail);
    this.setData({
      show: false
    });
  },
 // 处理到达时间格式
  replaceTime(timeString, newTime) {
    let order = this.data.order;
    var regex = /(\d{2}):(\d{2})/;
    order.create_time = timeString.replace(regex, newTime);
    this.setData({
      order
    })
  },
// 显示时间弹窗
  showPopup() {
    this.setData({
      show: true
    });
  },
// 关闭时间弹窗
  onClose() {
    this.setData({
      show: false
    });
  },
  // 配送不满意
  nosati() {
    this.setData({
      sati: false,
      nosati: true,
    });
    this.changeViewHeight1();
    this.check_submit();
  },
  // 配送满意
  sati() {
    this.setData({
      sati: true,
      nosati: false,
    });
    this.changeViewHeight1();
    this.check_submit();
  },
// 选中评价标签
  choiceTag(e) {
    if (this.data.nosati) {
      const {
        index
      } = e.currentTarget.dataset;
      let nosatitag = this.data.nosatitag;
      nosatitag[index] = nosatitag[index] ? 0 : 1;
      this.setData({
        nosatitag,
      })
      this.check_submit();
    } else {
      const {
        index
      } = e.currentTarget.dataset;
      let satitag = this.data.satitag;
      satitag[index] = satitag[index] ? 0 : 1;
      this.setData({
        satitag,
      })
      this.changeViewHeight2();
    }
  },
// 是否匿名提交
  onChange() {
    let checked = !this.data.checked;
    console.log(checked);
    this.setData({
      checked,
    });
  },
// 生成上传照片的uuid
  generateUUID() {
    const timestamp = new Date().getTime().toString(16); // 获取当前时间戳并转换为16进制
    const randomStr = Math.random().toString(16).substr(2, 6); // 生成一个6位的随机字符串
    return timestamp + randomStr;
  },
// 上传评价图片
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
            fileList.push({
              deletable: true,
              isImage: true,
              url: img.download_url,
              name: img.name,
              sha: img.sha,
            });
            that.setData({
              fileList
            });
            that.changeView2Height2();
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
// 删除评价图片
  delete(event) {
    let fileList = this.data.fileList;
    console.log(fileList);
    console.log(event.detail.index);
    this.delete_img(fileList[event.detail.index]);
    fileList.splice(event.detail.index, 1);
    console.log(fileList);
    this.setData({
      fileList
    });
    this.changeView2Height3();
  },
// 删除远程仓库上传图片
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
// 点踩
  food_rec_gus1() {
    let gus1 = !this.data.gus1;
    let gus2 = this.data.gus2;
    if (gus1) {
      gus2 = false;
    }
    this.setData({
      gus1,
      gus2,
    });
  },
  // 点赞
  food_rec_gus2() {
    let gus1 = this.data.gus1;
    let gus2 = !this.data.gus2;
    if (gus2) {
      gus1 = false;
    }
    this.setData({
      gus1,
      gus2,
    });
  },
// 载入页面时获取订单信息
  onLoad(options) {
    this.getOrder(JSON.parse(options.order));
  },
// 获取订单信息 并处理时间格式
  getOrder(order) {
    order.create_time = this.editordertime(order.create_time);
    this.setData({
      order,
    })
  },
  // 时间格式处理
  editordertime(timeString) {
    var time = timeString.replace(/^\d{4}-/, '').replace(/:\d{2}$/, '').replace(/(\d{2})-(\d{2})/, '$1月$2日');
    return time;
  },
// 增加菜品评论
  add_commit() {
    let commit_content = this.data.commit_content;
    commit_content += '#' + this.data.order.orders[0].food_name+' ';
    this.setData({
      commit_content,
    })
  },
  // 更新评价内容
  save_commit(e) {
    let commit_content = e.detail.value;
    this.setData({
      commit_content,
    })
  },
})