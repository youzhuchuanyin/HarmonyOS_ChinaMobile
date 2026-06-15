
import { http } from '@kit.NetworkKit'
import axios, { Axios, AxiosResponse } from '@ohos/axios'

interface dataInterface{
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

//动态页面=静态页面+动态数据
@Component
@Entry
struct pages07 {
  @State _imageDetail:dataInterface[]=[]
  build() {
    Column() {
      Text(JSON.stringify(this._imageDetail))
      Button('点击可以使用AXIOS发起HTTP请求')
        .onClick(async  _ => {
          try {
            let res: AxiosResponse = await axios.post('https://www.codeboy.com/chinamobileapi/index/appRecommend.do')
            let data:appRecommendResponseBody=res.data
            this._imageDetail=data.data
            console.log(data.conversationId) //data相当于result但是是OBJECT，status相当于码
          }catch (err) {
            console.log('err'+err)
          }
        })
      if (this._imageDetail.length!=0) {
        Text(this._imageDetail[0].skuId)
        Image('https://www.codeboy.com/chinamobileapi/' + this._imageDetail[0].pictureUrl)
          .width(60)
      }
    }
  }
}