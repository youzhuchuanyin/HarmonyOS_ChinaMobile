//使用web组件在app里内嵌本地网页
import { webview } from '@kit.ArkWeb'

@Component
@Entry
struct page10{
  @State _webctrl:webview.WebviewController=new webview.WebviewController()
  build() {
    Column(){
      Button('在ARKTS页面中加载tmooc首页').onClick(_=>{
        this._webctrl.loadUrl($rawfile('notfound.html'))
      })
      Web({
        src: $rawfile('loading.html'),
        controller:this._webctrl
      })
    }
    .width('100%').height('100%')
  }
}