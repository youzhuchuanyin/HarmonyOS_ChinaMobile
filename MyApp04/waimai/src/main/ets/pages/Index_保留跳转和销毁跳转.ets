//路由跳转：
// 路由：经由某条路径，可以达到指定目的地
//import { router, Router } from '@kit.ArkUI'

// 跳转：指定一个目标页面（URL）地址，系统会查找路由词典，根据该地址查找对应的页面对象
@Component
@Entry
struct pages6 {
  build() {
    List() {
      ListItem() {
        Row() {
          Text('<')
          Text('优惠')
          Text('北京🔻')
        }.width('100%').justifyContent(FlexAlign.SpaceBetween)
        .margin(5).backgroundColor(Color.White)
      }

      ListItem() {
        Column() {
          Image('/Images/discount101.png')
          Text('优惠101').width('100%')
        }.margin(5).backgroundColor(Color.White)
      }

      ListItem() {
        Column() {
          Image('/Images/discount204.jpg')
          Text('优惠204').width('100%')
        }.margin(5).backgroundColor(Color.White)
        .onClick(_=>{//海洋是鱼的上下文，天空是鸟的上下文
          //router.pushUrl({url:'pages/DiscountDetails'})
          //直接使用UI上下文，只要是界面里就可以用
          this.getUIContext().getRouter().pushUrl({
            url: 'pages/DiscountDetails'
          })
          /*this.getUIContext().getRouter().replaceUrl({
            url: 'pages/DiscountDetails'//跳转到这个url。
            // 但返回时，在栈中直接取代当前页（也就是点返回，直接退出应用了。因为index这个页被取代了）
            //同时页面不像滑动效果，而是直接pa覆盖
          })*/
        })
      }

      ListItem() {
        Column() {
          Image('/Images/discount308.png')
          Text('优惠308').width('100%')
        }.margin(5).backgroundColor(Color.White)

      }
    }.backgroundColor(Color.Blue)
  }
}