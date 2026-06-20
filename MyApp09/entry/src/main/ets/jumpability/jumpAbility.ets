import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';


const DOMAIN = 0x0000;
//缓存从上一个ability来的数据

export default class jumpAbility extends UIAbility {
  //App=new AppStorage();
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {

    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onCreate');
    // 从want.parameters中获取index页面传递的参数
    let paraminfo = want.parameters?.info as string
    let paramtesturl = want.parameters?.testurl as string;
    console.log('========='+paramtesturl+'==========')
    //缓存
    AppStorage.setOrCreate('receivedParam', paramtesturl);
  }

  onDestroy(): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onWindowStageCreate');
    //console.log( storage.get('receivedParam'))
    windowStage.loadContent('pages/jumpPage',(err) => {
      if (err.code) {
        hilog.error(DOMAIN, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err));
        return;
      }
      hilog.info(DOMAIN, 'testTag', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
