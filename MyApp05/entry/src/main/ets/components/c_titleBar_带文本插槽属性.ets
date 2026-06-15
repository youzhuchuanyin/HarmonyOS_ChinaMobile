@Component
@Preview
export struct c_titleBar {
  //自定义组件中的属性：插槽属性（slot）
  @State _leftText:string =''
  @State _middleText:string=''
  @State _rightText:string=''
  build() {
    //Row() {//普通的row做不到让中间的内容始终居中，所以要用relativecontainer
    RelativeContainer() {
      //left
      Row() {
        Text(this._leftText)
        //Text('首页')
      }
      .alignRules({
        center: { anchor: '__container__', align: VerticalAlign.Center }
      })

      //middle
      Row() {Text(this._middleText).fontSize(18).fontWeight(FontWeight.Bold)}
      .alignRules({
      middle: { anchor: '__container__', align: HorizontalAlign.Center },
      center: { anchor: '__container__', align: VerticalAlign.Center }
      })
      //right
      Row() {
        Text(this._rightText)
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