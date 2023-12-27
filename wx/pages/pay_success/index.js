Page({
// 初始化页面信息
  data: {
    imgs: ["https://pic2.zhimg.com/v2-febc9228d18886a29c68a66536279dfb_r.jpg?source=1940ef5c", "https://ts1.cn.mm.bing.net/th/id/R-C.a367db57d278ea79c5be717a8a78566c?rik=gPmoK%2bp%2b5j9VPg&riu=http%3a%2f%2fpic.bizhi360.com%2fbbpic%2f5%2f9705_4.jpg&ehk=qqJwbJt382LfJAnEHn516QqUXTS1s2IK2hp7xFgFP8Y%3d&risl=&pid=ImgRaw&r=0", "https://pic1.zhimg.com/v2-274bd4faff6aa980eff527c2fe288797_r.jpg", "https://ts1.cn.mm.bing.net/th/id/R-C.2a5cb21e95d37dc74ae142ed6201e92c?rik=n3v82FY0aF70Vg&riu=http%3a%2f%2fpic.bizhi360.com%2fbbpic%2f85%2f9585_7.jpg&ehk=M6esrkq9sRZTGR5iduLvhWjLYTHY2qAu6M02yrPqVdc%3d&risl=&pid=ImgRaw&r=0", "https://p.qqan.com/up/2021-1/16098342448596876.jpg", "https://p.qqan.com/up/2021-1/16098342459342299.jpg", "https://p.qqan.com/up/2021-1/16098342451464002.jpg", "https://pic1.zhimg.com/v2-38ba4d308de729f62a2c334ce874be83_r.jpg?source=1940ef5c", "http://img.netbian.com/file/2023/0920/small230133LQlGl1695222093.jpg", "http://img.netbian.com/file/2023/0918/small001315UKK471694967195.jpg"],
    img: "http://img.netbian.com/file/2023/0521/small232529o83Or1684682729.jpg",
    shop: {},
  },
// 载入页面时获取内置照片资源信息
  onLoad(options) {
    let shop = options.shop;
    shop = JSON.parse(shop);
    this.setData({
      shop,
    })
    this.getImg();
  },
  // 获取背景图片信息并设置
  getImg() {
    console.log(parseInt(Math.random() * 11));
    let img = this.data.imgs[parseInt(Math.random() * 11)];
    this.setData({
      img,
    })
  },
  // 返回到首页
  return() {
    setTimeout(() => {
      wx.switchTab({
        url: '/pages/index/index',
      })
    }, 500)
  },
})