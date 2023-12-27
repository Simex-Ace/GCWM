export const request=(params)=>{
    let ajaxTimes=0;
    wx.showLoading({
      title: '加载中',
      mask:true,
    })


    const baseUrl="http://kdst:8076";
    return new Promise((resolve,reject)=>{
        ajaxTimes++;
        wx.request({
            ...params,
            url:baseUrl+params.url,
            success:(result)=>{
                resolve(result);
            },
            fail:(err)=>{
                reject(err); 
            },
            complete:()=>{
                ajaxTimes--;
                if(ajaxTimes<=0){
                    wx.hideLoading();
                }
            }
        });
    })
}