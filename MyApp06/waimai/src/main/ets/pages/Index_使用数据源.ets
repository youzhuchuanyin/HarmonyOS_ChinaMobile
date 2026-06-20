import { APIConstants } from '../Constants/APIConstants'
import { dicountModels, discountData } from '../Viewmodels/DiscountModels'

class DiscountSource implements IDataSource {
  //自定义属性:
  dataSource: discountData[] = []
  dataListener?: DataChangeListener

  //自定义函数：外部得到的一大堆数据，放到这里来接收处理
  inject(_discountdata: discountData[]) {
    this.dataSource = _discountdata //接收外来数据
    this.dataListener?.onDataReloaded() //内部赋值
  }

  //数据总数量
  totalCount(): number {
    return this.dataSource.length
    //throw new Error('Method not implemented.')
  }

  //获取第index个数据
  getData(index: number): discountData {
    return this.dataSource[index]
    //throw new Error('Method not implemented.')
  }

  //监听数据源的改变
  registerDataChangeListener(listener: DataChangeListener): void {
    //throw new Error('Method not implemented.')
    //不能这样写，一定要有一个真实的实参 listener.onDataReloaded()
    this.dataListener = listener
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    //throw new Error('Method not implemented.')
    this.dataListener = undefined
  }
}

@Entry
@Component
  //优惠界面
struct page08 {
  @State _discountdata: discountData[] = []
  //实例化一个数据源对象
  ds: DiscountSource = new DiscountSource()

  async onPageShow() {
    //获得一堆数据
    this._discountdata = await dicountModels.getDiscount()
    //要把一堆数据放到数据源里去，怎么放？在类DiscountSource中定义一个属性变量来接收
    this.ds.inject(this._discountdata) //这样就把数据传递到类里了
  }

  build() {
    List() {
      ListItem() {
        Text('优惠列表').width('100%').textAlign(TextAlign.Center)
      }.width('100%').height(40)

      //如果数据太多，会导致丢帧卡顿现象。
      //优化方案 ：懒加载=lazyforeach+数据源(一个类)
      LazyForEach(this.ds, (data: discountData, i: number) => {
        ListItem() {
          Column() {
            Image(APIConstants.HOST + data.pictureUrl).width('100%')
            Text(data.title).width('100%').padding(5)
          }
        }.padding(5)
        .onAppear(() => {
          console.log(i + '挂载到组件树')
        })
        .onDisAppear(() => {
          console.log(i + '从组件树卸载')
        })

        /*ForEach(this._discountdata,(data:discountData,i:number)=>{
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
      })*/


      })
    }.lanes(1).width('100%').height('100%')
  }
}