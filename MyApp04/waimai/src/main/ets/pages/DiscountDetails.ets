//接口是一种特殊的类，在java中只能有方法，但在JS中，它可以有属性和方法，但不能有值
//类：属性和方法必须有初始化（实现）
interface paramRules{
islogin:boolean,
  did:number,
  location:string
}
@Component
@Entry
struct chilePage{
  onPageShow(): void {
    //可以用来接收上个页面的参数(强转为我规定的接口)
    let obj=this.getUIContext().getRouter().getParams() as paramRules
    //console.log('接收到的参数为：'+obj)//不能直接这样，这样只会显示[object Object]
   // console.log('接收到的参数为：'+JSON.stringify(obj))//使变为json字符串
    //可是我现在想看到每个单独的参数是什么值，试试obj.islogin？会报错说不存在，
    // 所以要给他们一个规范(就像c语言里面给他们规定好类型)
    console.log('是否登录：'+obj.islogin)
    console.log('是否登录：'+obj.location)
    console.log('是否登录：'+obj.did)

  }
  onPageHide(): void {
    console.log('details is hiding...')
  }
  build() {
    Column() {
      Text('超级大优惠101').width('100%').height('100%').textAlign(TextAlign.Center)
      Button('返回上一页').onClick(_ => {
        this.getUIContext().getRouter().back()
      })
    }
  }
}
