Page({
  //初始化页面数据
  data: {
    leftMenuList: [],
    rightContent: [],
    currentIndex: 0,
    scrolltop: 0,
    shop: {},
    total: 0,
    total_on: 0,
    foodStyle: {},
    Style: {},
    choice: false,
    view_total: 0,
    Styles: [],
    booking: true,
    score: false,
    shop_detail: false,
    Scores: {},
    coll: false,
  },
  // 获取收藏状态
  getcollect(shop_id) {
    let user = wx.getStorageSync('userInfo');
    let that = this;
    console.log(shop_id,user.user_id);
    wx.request({
      url: 'http://kdst:8076/category/getcollect',
      header: {
        'content-type': "application/json"
      },
      data: {
        "shop_id": shop_id,
        "user_id": user.user_id,
      },
      method: "post",
      success(ret) {
        console.log(ret.data);
        that.setData({
          coll: ret.data
        })
      },
    })
  },
  // 设置收藏状态
  setcollect() {
    let user = wx.getStorageSync('userInfo');
    if (!user) {
      wx.navigateTo({
        url: '/pages/login/index',
      })
      return;
    }
    let that = this;
    wx.request({
      url: 'http://kdst:8076/category/setcollect',
      header: {
        'content-type': "application/json"
      },
      data: {
        "shop_id": this.data.shop[0].shop_id,
        "user_id": user.user_id,
      },
      method: "post",
      success(ret) {
        console.log(ret.data);
        that.setData({
          coll: ret.data
        })
      },
    })
  },
// 切换点餐
  booking() {
    let booking = true;
    let score = false;
    let shop_detail = false;
    this.setData({
      booking,
      score,
      shop_detail,
    })
  },
  // 切换评价
  score() {
    let booking = false;
    let score = true;
    let shop_detail = false;
    this.setData({
      booking,
      score,
      shop_detail,
    })
  },
  // 获取评价
  getscore(shop_id) {
    let Scores = {};
    let that = this;
    wx.request({
      url: 'http://kdst:8076/score',
      header: {
        'content-type': "application/json"
      },
      data: {
        "shop_id": shop_id,
      },
      method: "post",
      success(ret) {
        Scores = ret.data.reverse();
        that.setData({
          Scores,
        })
      },
    })
  },
  // 切换商家详情
  shop_detail() {
    let booking = false;
    let score = false;
    let shop_detail = true;
    this.setData({
      booking,
      score,
      shop_detail,
    })
  },
// 获取所有分类美食
  getCategory(id) {
    var that = this;
    wx.request({
      url: 'http://kdst:8076/category',
      header: {
        'content-type': "application/json"
      },
      data: {
        "id": id
      },
      method: "POST",
      success(res) {
        var leftMenuList = res.data.foods;
        leftMenuList.forEach(item => {
          item.foods.forEach(item1 => {
            item1.num = 0;
          })
        })
        that.setData({
          shop: res.data.shop,
          leftMenuList,
          Cates: res.data.foods,
        })
        let rightContent = that.data.leftMenuList[0].foods;
        that.setData({
          rightContent,
        })
      }
    })
  },
  // 获取当前美食包含口味和规格
  choiceStyle(e) {
    let Styles = this.data.Styles;
    if (this.data.choice) {
      return;
    }
    const {
      index
    } = e.currentTarget.dataset;
    let Now_foods = index;
    var that = this;
    wx.request({
      url: 'http://kdst:8076/category/style',
      header: {
        'content-type': "application/json"
      },
      data: {
        "id": Now_foods.food_id
      },
      method: "post",
      success(ret) {
        let Y = true;
        Styles.forEach((item, index) => {
          if (item[0].food_id == ret.data[0].food_id) {
            ret.data = item;
            Y = false;
          }
        })
        if (Y) {
          ret.data.forEach(item => {
            item.sizes.forEach((item, key) => {
              if (key == 0) {
                item.choice = true;
              } else {
                item.choice = false;
              }
            })
          });
        }
        that.setData({
          Style: ret.data,
          foodStyle: Now_foods
        })
      }
    });
    let view_total = Now_foods.price * Now_foods.num;
    view_total = view_total.toFixed(2);
    this.setData({
      view_total,
      choice: true,
    })
  },
// 选择设置口味 
  chocieSize(e) {
    const {
      index
    } = e.currentTarget.dataset;
    const {
      size
    } = e.currentTarget.dataset;
    let newStyle = this.data.Style;
    newStyle[index].sizes.forEach(item => {
      item.choice = false
    })
    newStyle[index].sizes[size].choice = true;
    this.setData({
      Style: newStyle,
    })
  },
// 取消口味选择窗口同时更新口味选择，生成一个表纪录上一次选择口味
  cancel() {
    let choice = this.data.choice;
    let foodStyle = this.data.foodStyle;
    let Style = this.data.Style;
    let Styles = this.data.Styles;
    let Y = true;
    let index;
    if (Styles.length == 0 && foodStyle.num != 0) {
      Styles.push(Style);
    }
    Styles.forEach((item, index) => {
      if (item[0].food_id == Style[0].food_id && foodStyle.num != 0) {
        Y = false;
        index = index;
      }
    })
    if (Y) {
      Styles.push(Style);
    } else {
      Styles[index] = Style;
    }
    choice = false;
    this.setData({
      Styles,
      choice,
      Style,
    })
  },
// 切换美食分类
  handleItemTap(e) {
    const {
      index
    } = e.currentTarget.dataset;
    let rightContent = this.data.leftMenuList[index].foods;
    this.setData({
      currentIndex: index,
      rightContent,
      scrolltop: 0
    })
  },
// 增加美食数量
  addnum(e) {
    const {
      index
    } = e.currentTarget.dataset;
    var rightContent = this.data.rightContent;
    if (rightContent[index].num < 99) {
      rightContent[index].num++;
      this.setData({
        rightContent,
      })
    }
    this.total();
  },
// 增加带有口味的美食数量
  addnum_style() {
    let tmp_food = this.data.foodStyle;
    if (tmp_food.num < 99) {
      tmp_food.num++;
      this.setData({
        foodStyle: tmp_food,
      })
    }
    this.total_style();
  },
  // 减少美食数量
  desnum(e) {
    const {
      index
    } = e.currentTarget.dataset;
    var rightContent = this.data.rightContent;
    if (rightContent[index].num > 0) {
      rightContent[index].num--;
      this.setData({
        rightContent,
      })
    }
    this.total();
  },
  // 减少带有口味的美食数量
  desnum_style() {
    let tmp_food = this.data.foodStyle;
    if (tmp_food.num > 0) {
      tmp_food.num--;
      this.setData({
        foodStyle: tmp_food,
      })
    }
    this.total_style();
  },
  // 所选购美食总价
  total() {
    let leftMenuList = this.data.leftMenuList;
    let rightContent = this.data.rightContent;
    let foodStyle = this.data.foodStyle;
    let total = 0;
    let total_on = 0;
    leftMenuList.forEach(item => {
      item.foods.forEach(item => {
        if (foodStyle.food_id == item.food_id) {
          item.num = foodStyle.num;
        }
        total += item.num * item.price;
      })
    })
    total = total.toFixed(2);
    total_on = (this.data.shop[0].qs_fee - total).toFixed(2)
    this.setData({
      rightContent,
      leftMenuList,
      total,
      total_on,
    })
  },
// 当前所选口味的美食总价
  total_style() {
    let tmp_food = this.data.foodStyle;
    let view_total = tmp_food.price * tmp_food.num;
    view_total = view_total.toFixed(2);
    this.setData({
      view_total,
    })
    this.total();
  },

  // 前往付款
  gotoPay() {
    if (this.data.choice) {
      return;
    }
    let mychoice = [];
    let mystyle = this.data.Styles;
    this.data.leftMenuList.forEach(item => {
      item.foods.forEach(item => {
        if (item.num > 0) {
          mychoice.push(item);
        }
      })
    })
    mychoice.push(this.data.shop);
    mychoice.push(this.data.total);
    mychoice = JSON.stringify(mychoice);
    mystyle = JSON.stringify(mystyle);
    console.log(mychoice);
    wx.navigateTo({
      url: '/pages/pay/index?mychoice=' + mychoice + '&mystyle=' + mystyle,
    });
  },
// 保存浏览记录
  setRecord(id) {
    let user = wx.getStorageSync('userInfo');
    if (!user) {
      return;
    }
    let record = {};
    record.shop_id = id;
    record.scan_time = new Date().toJSON().substring(0, 10);
    record.user_id = user.user_id;
    console.log(record);
    wx.request({
      url: 'http://kdst:8076/record/add',
      header: {
        'content-type': 'application/json'
      },
      data: {
        record: JSON.stringify(record)
      },
      method: 'post',
      success(ret) {
      }
    })
  },
  // 页面加载时调用获取页面信息
  onLoad(options) {
    this.getCategory(options.shop_id);
    this.setRecord(options.shop_id);
    this.getcollect(options.shop_id);
    this.getscore(options.shop_id);
  },
})