import { AbilityConstant, ConfigurationConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';

const DOMAIN = 0x0000;

//EntryAbility（应用组件）--windowStage（窗口舞台）--window（窗口）--page*n（页面）
// UIAbity：带用户界面的应用组件--带窗口的
//ExtrnsionAbility：不带用户界面的应用组件--不带窗口的（比如微信没打开但是能收到语音消息）
export default class EntryAbility extends UIAbility {
  //onCreate：冷启动（在后台并没有这个程序时，会加载startWindow）
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    try {
      this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
    } catch (err) {
      hilog.error(DOMAIN, 'testTag', 'Failed to set colorMode. Cause: %{public}s', JSON.stringify(err));
    }
    //hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onCreate');
    console.log('应用组件冷启动')
  }
  //onNewWant：热启动
  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    console.log('应用组件在热启动')
  }
  //onDestroy 销毁进程
  onDestroy(): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onDestroy');
  }
//创建窗口舞台
  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    console.log('窗口舞台被创建')
    let w=windowStage.getMainWindowSync();
    w.setWindowLayoutFullScreen(true);//侵占到最顶部
    //w.setPreferredOrientation(window.Orientation.LANDSCAPE)//横向
    w.setPreferredOrientation(window.Orientation.PORTRAIT)//横向
    windowStage.loadContent('pages/Index');//加载默认首页
  }
//窗口舞台被销毁
  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }
//应用组件被调入前台
  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onForeground');
  }
//应用组件被调入后台
  onBackground(): void {
    // Ability has back to background
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onBackground');
  }

}