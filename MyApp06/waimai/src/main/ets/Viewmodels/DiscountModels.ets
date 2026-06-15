import axios, { AxiosResponse } from "@ohos/axios"
import { APIConstants } from "../Constants/APIConstants"

export interface discountData{
  did:string,
  pictureUrl:string,
  title:string,
  target:string
}
//ctrl+R替换快捷键
interface discountAll{
  responseCode:string,
  conversationId:string,
  data:discountData[]
}
class DiscountModels{
  async getDiscount(){
    try {
      let resp:AxiosResponse=await axios.post(APIConstants.DISCOUNT_LIST)
      let discountall:discountAll=resp.data
      let discountdata:discountData[]=discountall.data
      return discountdata
    }catch (e){
      console.log(e)
      return []
    }

  }
}
//不加 const → 变量可以被重新赋值，TS/JS 认为可能是 undefined，会报错
//加 const → 变量永远指向这个实例，不会变，所以安全，不报错
export  const  dicountModels=new DiscountModels()