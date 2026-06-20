import { webview } from '@kit.ArkWeb';

interface Params {
  detailUrl: string
}

//实现一个页面，多种呈现
@Entry
@Component
struct DiscountDetails {
  _ctr: webview.WebviewController = new webview.WebviewController();
  @State _detailUrl: string | Resource = $rawfile('loading.html');

  aboutToAppear() {
    let params = this.getUIContext().getRouter().getParams() as Params
    this._detailUrl = params.detailUrl

  }

  build() {

    Column() {
      Text('优惠详情页' + this._detailUrl)
      //是一个独立的进程
      Web({
        controller: this._ctr,
        src: this._detailUrl
      })
    }
    .height('100%')
    .width('100%')
  }
}