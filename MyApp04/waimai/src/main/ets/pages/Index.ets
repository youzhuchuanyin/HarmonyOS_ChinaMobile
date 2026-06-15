import { copyrightBar } from '../components/copyrightBar'
import { discountItem } from '../components/discountItem'
import { welcomeBar } from '../components/welcomeBar'

//可复用组件（自定义组件）
@Component
@Entry
struct pages10 {
  //页面对象生命周期方法
  @State _id: string = '首页'

  onPageShow(): void {
    console.log('主页面即将显示。。。')
  }

  onPageHide(): void {
    console.log('主页面即将消失。。。')
  }

  build() {
    List() {
      ListItem() {
        Row() {
          Text('<')
          Text('优惠')
          Text('北京🔻')
        }.width('100%').justifyContent(FlexAlign.SpaceBetween)
        .margin(5).backgroundColor(Color.White).height(30)
      }

      ListItem() {
        welcomeBar({ _username: 'huangfei', _welcomeText: '热烈欢迎到' + this._id + '' })
      }
      ListItem(){
        discountItem({_image:'discount101.png',_imageText:'爱家专区'})
      }

      ListItem(){
        discountItem({_image:'discount204.jpg',_imageText:'境外流量'})
      }

      ListItem(){
        discountItem({_image:'discount308.png',_imageText:'宝藏卡'})
      }

      ListItem() {
        copyrightBar()
      }
    }.backgroundColor(Color.Blue)
  }
}