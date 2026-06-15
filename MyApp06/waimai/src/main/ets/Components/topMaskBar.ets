@Component
@Preview
export struct topMaskBar{
  build() {
    Row(){
      Text('北京').fontColor('#ffffff')
      Blank()
      Text('未登录').fontColor('#ffffff')
    }
    //.backgroundColor('rgba(0,0,0,1)')
    .padding({left:10,right:10})
    .width('100%').height(45)
    .linearGradient({angle:180,colors:[['rgba(0,0,0,1)',0],['rgba(0,0,0,0)',1]]})
    //线性渐变不能与背景颜色同时共存，不然他会失效
  }
}