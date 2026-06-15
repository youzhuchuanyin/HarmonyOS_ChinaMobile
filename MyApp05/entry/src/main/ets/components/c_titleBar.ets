@Component
@Preview
export struct c_titleBar {
  //像下面这种只能固定是text或者image
  //但有时候页面是文字，有时候页面是图标，怎么做
  @State _leftText:string =''
  @State _middleText:string=''
  @State _rightText:string=''
  //使用@builder解释器，定义多个UI组件函数，父组件通过给变量赋不同的值，从而调用不同的函数，达到所要的效果
  //@buildparam其实本质就是@State
 // @BuilderParam _leftarea:()=>void=this.leftfunc
  @BuilderParam _middlearea:()=>void=this.middlefunc
  //@BuilderParam _rightarea:()=>void=this.rightfunc

  @Builder
  leftfunc(){
    Text('后退').onClick(_=>{})
    Text('<').onClick(_=>{})
  }
  @Builder
  middlefunc(){
    Text('首页')
  }
  @Builder
  rightfunc(){
    Text('设置')
  }
  build() {
    //Row() {//普通的row做不到让中间的内容始终居中，所以要用relativecontainer
    RelativeContainer() {
      //left
      Row() {
        //this._leftarea()//带上括号代表调用
        //Text('首页')
      }
      .alignRules({
        center: { anchor: '__container__', align: VerticalAlign.Center }
      })

      //middle
      Row() {
        this._middlearea()
      }
      .alignRules({
      middle: { anchor: '__container__', align: HorizontalAlign.Center },
      center: { anchor: '__container__', align: VerticalAlign.Center }
      })
      //right
      Row() {
        //this._rightarea()
        //Text('我的')
       // Text('用户中心')
      }.alignRules({
        end:{anchor:'__container__',align:HorizontalAlign.End}
      ,center:{anchor:'__container__',align:VerticalAlign.Center}})
    }.padding({ left: 5, right: 5 })
    .width('100%')
    .height(45)
    .backgroundColor('#f2f2f2')
  }
}