import testNapi from 'libwaimai.so'; //shared object


@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        Button('1使用c库计算加法')
          .onClick(() => {
            let res = testNapi.add(1, 4)
            console.log('结果是' + res)
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
