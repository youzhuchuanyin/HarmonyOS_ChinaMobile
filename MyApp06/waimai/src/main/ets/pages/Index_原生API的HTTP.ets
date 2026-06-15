//静态页面：每个人每个时刻来看都是一样的，不管有没有动画效果
//动态页面：反之
import { http } from '@kit.NetworkKit'
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
  build() {
    Column() {
      Button('点击可以使用鸿蒙原生API发起HTTP请求')
        .onClick(async  _ => {
          //使用鸿蒙原生API发起HTTP请求
          //xhr=http.createHrttp()//创建一个发起http请求的“小黄人对象”
          try {
            //👇使用小黄人发起请求,response接收响应消息
            let response =
              await http.createHttp().request('https://www.codeboy.com/chinamobileapi/index/appRecommend.do',
                { method: http.RequestMethod.POST })
            console.log('获得http消息：'+response.result)//json字符串
            //如果想读取其中的数据咋整--》逆向转成对象
            let obj:appRecommendResponseBody=JSON.parse(response.result as string)
            console.log('id：'+obj.conversationId)
            console.log('data个数：'+obj.data.length)

          }catch(err) {
            console.log('http请求发生错误！'+JSON.stringify(err))

          }
        })


    }
  }
}