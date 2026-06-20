import myAPI from 'libwaimai.so'; //shared object  import后面的可以随便改
//此项目在新建时选择的是C++

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        Button('1使用c库计算加法')
          .onClick(() => {
            let res = myAPI.add(1, 4)
            console.log('add调用结果是' + res)
          })
        Button('2使用c库计算三个整数的和')
          .onClick(() => {
            let res = myAPI.f1(1, 4,8)
            console.log('f1调用结果是' + res)
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
