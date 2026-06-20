//import { storage } from '../jumpability/jumpAbility';


@Entry
@Component
struct JumpPage {

  @State message: string = 'jump';
  @StorageLink('receivedParam') urlFromEntry: string = '';
  aboutToAppear(): void {
    console.info('获取到的参数：' + this.urlFromEntry);
  }
  build() {
    RelativeContainer() {
      Text(this.message)
        .id('JumpPageHelloWorld')
        .fontSize($r('app.float.page_text_font_size'))
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .onClick(() => {
          console.log('======='+this.urlFromEntry+'=====')
          this.message=this.urlFromEntry
        })
    }
    .height('100%')
    .width('100%')
  }
}