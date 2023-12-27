Page({
// 初始化页面数据
  data: {
    tabs:[
      {
        id:0,
        value:"体验问题",
        isActive:true
      },
      {
        id:1,
        value:"商品、商家投诉",
        isActive:false
      }
    ],
    chooseImgs:[],
    textVal:""
  },
  UpLoadImgs:[],
// 选择反馈照片
  handleChooseImg(){
    wx.chooseImage({
      count: 9,
      sizeType: ['original','compressed'],
      sourceType: ['album','camera'],
      success: (result) => {
        console.log(result);
        this.setData({
          chooseImgs:this.data.chooseImgs.concat(result.tempFilePaths)
        })
        console.log(this.data.chooseImage);
      },
    })
  },
// 移除对应上传照片
  handleRemoveImg(e){
    const {index}=e.currentTarget.dataset;
    let {chooseImgs}=this.data;
    chooseImgs.splice(index,1)
    this.setData({
      chooseImgs
    })
  },
// 输入反馈信息
  handleTextInput(e){
    this.setData({
      textVal:e.detail.value
    })
  },
// 提交反馈意见
  handleFormSubmit(){
    const {textVal,chooseImgs}=this.data;
    if(!textVal.trim()){
      wx.showToast({
        title: '输入不合法',
        icon: 'none',
        mask: true,
      });
      return;
    }
    wx-wx.showLoading({
      title: '正在上传中',
      mask: true,
    })
    if(chooseImgs.length!=0){
    chooseImgs.forEach((v,i)=>{
      wx.uploadFile({
        filePath: v,
        name: 'Filedata',
        url: 'https://huaban.com/upload/',
        formData:{},
        success:(result)=>{
          console.log(result);
          let url=result.cookis;
          this.UpLoadImgs.push(url);
          console.log(this.UpLoadImgs);
          if(i===chooseImgs.length-1){
            wx.hideLoading();
            console.log("正在提交");
            this.setData({
              textVal:"",
              chooseImgs:[]
            })
            wx.navigateBack({
              delta:1
            })
          }
        }
      })
    })}else{
      wx.hideLoading();
      console.log("只提交文本");
      wx.navigateBack({
        delta:1
      })

    }
  },
// 选择反馈类型
  handleTabsItemChange(e){
    const {index}=e.detail;
    let {tabs}=this.data;
    tabs.forEach((v,i) =>i===index?v.isActive=true:v.isActive=false);
      this.setData({
        tabs
      })
    },
})