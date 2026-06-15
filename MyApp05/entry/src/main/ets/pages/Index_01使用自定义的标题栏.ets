import { url } from '@kit.ArkTS';
import { c_titleBar } from '../components/c_titleBar';

@Entry
@Component
struct Index {
  @State message: string = '首页';

  build() {
    Column() {
      c_titleBar({ _middleText: '首页',_rightText:'登录' })
      Text(this.message)
        .padding(20)
        .id('HelloWorld')
        .fontSize($r('app.float.page_text_font_size'))
        .fontWeight(FontWeight.Bold)
      Button('跳转到用户中心')
        .onClick(_ => {
          this.getUIContext().getRouter().pushUrl(
            { url: 'pages/UserCenter' }
          )
        })
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#ddffdd')
  }
}