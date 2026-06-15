import { APIConstants } from '../Constants/APIConstants'
import { dicountModels, discountData } from '../Viewmodels/DiscountModels'

@Entry
@Component
  //优惠界面
struct page08 {
  @State _discountdata:discountData[]=[]
  async aboutToAppear(){
    this._discountdata=await dicountModels.getDiscount()
  }
  build() {
    List() {
      ListItem() {
        Text('优惠列表').width('100%').textAlign(TextAlign.Center)
      }.width('100%').height(40)
      //如果数据太多，会导致丢帧卡顿现象。
      ForEach(this._discountdata,(data:discountData,i:number)=>{
      ListItem(){
        Column() {
          Image(APIConstants.HOST + data.pictureUrl).width('100%')
          Text(data.title).width('100%').padding(5)
        }
      }.padding(5)
        .onAppear(()=>{
          console.log(i+'挂载到组件树')})
        .onDisAppear(()=>{
          console.log(i+'从组件树卸载')
        })
    })


    }.lanes(1).width('100%').height('100%')
  }
}