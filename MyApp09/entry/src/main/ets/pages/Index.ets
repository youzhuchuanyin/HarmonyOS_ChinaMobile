import { common } from '@kit.AbilityKit'
import { url } from '@kit.ArkTS'


@Entry
@Component
struct Index {
aboutToAppear(): void {
  console.log('页面组件即将挂载')
}
onPageShow(): void {
  console.log('首页即将显示')
}
onPageHide(): void {
  console.log('首页即将隐藏')
}
  build() {
  Column(){
    Text('head')
    Button().onClick(_=>{
      //这次不是页面跳转了。而是应用组件间的跳转。一起看看吧
      let newAbility=this.getUIContext().getHostContext() as common.UIAbilityContext
      newAbility.startAbility({
        bundleName:'fei.home.myapp09',//必需参数，指定启动哪个应用下面的组件.root下的AppScope下的app.json5里有
        moduleName:'entry',//可选参数  module(entry)下的src/main/module.json5
        abilityName:'jumpAbility',//必需参数，指定启动哪个ability 依然是 module.json5 里面ability的name
        parameters:{
          info:'来自首页',
          testurl:'www.baidu.com'
        }
      })
    })
    Text('body')
    Button().onClick(_=>{
      let newAbility=this.getUIContext().getHostContext() as common.UIAbilityContext
      newAbility.startAbility({
        bundleName:'fei.home.myapp09',//必需参数，指定启动哪个应用下面的组件.root下的AppScope下的app.json5里有
      })
    })
  }
  }
}