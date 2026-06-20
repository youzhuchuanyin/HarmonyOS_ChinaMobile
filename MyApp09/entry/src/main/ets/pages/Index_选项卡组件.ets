import { discount } from '../components/discount';
import {Home} from  '../components/Home'

@Entry
@Component
struct Index {
  @State _num:number=0;
  @Builder tabbar(num:number,image:string,activeImage:string,text:string ){//这是一个方法，但该方法内部全部是UI组件
    Column(){
      Image((this._num==num)?activeImage:image).width(20)
      Text(text).fontColor(this._num==num?'#0085d0':'#003333')
    }.width('100%').height('100%')
  }
  //tabs=(tabcontent+tabbar)*n
  build() {
    Tabs(){
      TabContent(){
        //Text('num0首页')
        Home()
      }.tabBar(this.tabbar(0,'/images/home (1).png','/images/home_active.png','首页'))
      TabContent(){
        //Text('num1商城')
        //这个part是页面跳转的

      }.tabBar(this.tabbar(1,'/images/cart.png','/images/cart.png','商城'))
      TabContent(){
        //Text('num2优惠')
        discount()
      }.tabBar(this.tabbar(2,'/images/discount.png','/images/discount_active.png','优惠'))
      TabContent(){
        //Text('num3个人中心')
        //这一part是页面跳转
      }.tabBar(this.tabbar(3,'/images/personal.png','/images/personal.png','个人中心'))
    }
      .onChange(num=>{this._num=num})
      .onContentWillChange((from,to):boolean=>{
        if(to==3){
          this.getUIContext().getRouter().pushUrl({url:'pages/personal'})
          return false;//代表不让你切换
        }
        if(to==1){
          this.getUIContext().getRouter().pushUrl({url:'pages/cart'})
          return false;
        }
        return true;//代表你可以切换
      })
      .height('100%').width('100%')
      .barPosition(BarPosition.End)
  }
}