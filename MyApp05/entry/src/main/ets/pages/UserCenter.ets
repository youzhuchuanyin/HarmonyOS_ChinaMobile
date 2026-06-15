import { c_titleBar } from '../components/c_titleBar'

@Entry
@Component
struct UserCenter {

  build() {
Column(){
  c_titleBar({_middleText:'用户中心',_leftText:'返回',_rightText:'设置'})
  Text('用户中心')
    .padding(20)
    .id('HelloWorld')
    .fontSize($r('app.float.page_text_font_size'))
    .fontWeight(FontWeight.Bold)
  Button('返回上一页')
    .onClick(_ => {
      this.getUIContext().getRouter().back(
        { url: 'pages/Index' }
      )
    })
}
.height('100%')
.width('100%')
.backgroundColor('#ffdddd')
}


}