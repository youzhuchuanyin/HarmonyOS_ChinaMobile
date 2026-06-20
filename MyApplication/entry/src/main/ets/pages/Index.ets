import { hilog } from '@kit.PerformanceAnalysisKit';
import testNapi, { Student } from 'libentry.so';

const DOMAIN = 0x0000;

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        Button('1.add 函数')
          .onClick(() => {
            console.log( ''+testNapi.add(2, 3));
          })
        Button('2.f1 函数')
          .onClick(() => {
            let result:number=testNapi.f1(2,4, 3)
            console.log( ''+result);
          })
        Button('3.f2 函数')
          .onClick(() => {
            let result:number=testNapi.f2(2.44,4.66)
            console.log( ''+result);
          })
        Button('4.f3 函数')
          .onClick(() => {
            let result:string=testNapi.f3('tom','jerry')
            console.log(result);
          })
        Button('5.f4 函数')
          .onClick(() => {
            let result:number=testNapi.f4([200,500,1000,499]);
            console.log(''+result);
          })
        Button('6.f5 函数')
          .onClick(() => {
            let s:Student= {
              sname: 'hf',
              chinese: 60,
              math: 70,
              english: 80
            }
            let result:number=testNapi.f5(s);
            console.log(''+result);
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
