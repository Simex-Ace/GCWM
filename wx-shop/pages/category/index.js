//初始化页面数据
Page({
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
// 点餐栏
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
  // 评分栏
  score() {
    let booking = false;
    let score = true;
    let shop_detail = false;
    let Scores = {};
    let that = this;
    wx.request({
      url: 'http://kdst:8076/score',
      header: {
        'content-type': "application/json"
      },
      data: {
        "shop_id": that.data.shop[0].shop_id,
      },
      method: "post",
      success(ret) {
        Scores = ret.data.reverse();
        that.setData({
          Scores,
        })
      },
    })
    this.setData({
      booking,
      score,
      shop_detail,
    })
  },
  // 商家详情栏
  shop_detail() {
    let booking = false;
    let score = false;
    let shop_detail = true;

  },
// 获取所有分类下的美食信息并设置
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
  // 选择对应口味
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
// 选择对应规格
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
// 取消选择口味时记录上次选择，存入缓存表，方便下次读取
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
// 切换分类显示
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
// 选购美食数量+1
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
// 选购带有口味选择的美食数量+1
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
// 选购美食数量-1
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
// 选购带有口味选择的美食数量-1
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
  // 计算当前选购美食总价
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
// 计算当前选择口味规格的美食总价
  total_style() {
    let tmp_food = this.data.foodStyle;
    let view_total = tmp_food.price * tmp_food.num;
    view_total = view_total.toFixed(2);
    this.setData({
      view_total,
    })
    this.total();
  },
  // 载入页面所有美食信息
  onLoad(options) {
    this.getCategory(options.shop_id);
  },
})