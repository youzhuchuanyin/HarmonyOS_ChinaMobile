//使用web组件在app里内嵌网页
import { webview } from '@kit.ArkWeb'

//目的是为了直接加载服务器发来的html页面 直接采用的chorme内核+显示器V8
@Component
@Entry
struct page10{
  @State _webctrl:webview.WebviewController=new webview.WebviewController()
  build() {
    Column(){
      Button('在ARKTS页面中加载tmooc首页').onClick(_=>{
        this._webctrl.loadUrl('www.tmooc.cn')
      })
      Web({
        src: 'www.baidu.com',
        controller:this._webctrl
      })
    }
    .width('100%').height('100%')
  }
}