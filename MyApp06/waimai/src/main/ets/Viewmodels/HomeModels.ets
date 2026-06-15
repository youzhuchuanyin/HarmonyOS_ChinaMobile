//为首页提供模型数据的文件
import axios, { AxiosResponse } from "@ohos/axios"
import { APIConstants } from "../Constants/APIConstants"

//这是一个模型
export  interface dataInterface{
  itemId:string,
  goodsId:string,
  dataType:string,
  pictureUrl:string,
  subhead:string,
  title:string ,
  skuId:string,
}
//猜你喜欢 接口的响应消息主体
interface appRecommendResponseBody{
  responseCode:string,
  responseDesc:string,
  conversationId:string,
  data:dataInterface[]//因为传来了两组data。所以是数组
}
class HomeModels{
  //获取‘猜你喜欢’必须的数据
  //自己给它取个方法名:这个方法主要是用来请求服务器，并将接收到的数据返回给调用者
  async appRecommend(){
   try {
     let response:AxiosResponse= await axios.post(APIConstants.APP_RECOMMEND)
     let body:appRecommendResponseBody=response.data
     return body.data
   } catch (err) {
     console.log('接口请求失败：'+err)
     return []
   }
  }
  //获取‘商品推荐’必须的数据

}
//单例设计模式：只导出该类的实例。
//多例：导出该类
export  const  homeModels=new HomeModels()