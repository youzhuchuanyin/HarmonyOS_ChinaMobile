@Entry
@Component
struct page07 {
  build() {
    Column({ space: 6 }) {
      Button('submit').width(30).height(30) //按钮是个有边框的东西
      Button('cancle').borderRadius(0).enabled(false)

      Button() { //它同时是一个容器
        Row() {
          Image('/images/cart.svg').width(20).fillColor('#ffffff') //只有svg图片的可一用fillcolor
          Text(' 购物').fontColor('#ffffff')
        }
      }.width(100).height(50)

      Button() {
        Text('hello')
      }.type(ButtonType.Circle).width(50).height(50)

      Row() {
        Button() {
          Text('立即登录').fontSize(16).fontColor('#fff')
        }.width(335).height(45).borderRadius(4)
      }
    }.width('100%').height('100%')
  }
}