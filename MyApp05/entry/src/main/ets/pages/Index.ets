import { curves } from '@kit.ArkUI'

@Component
@Entry
struct  page07{
  @State _rotate:number=0
  onPageShow(): void {
    this._rotate=(this._rotate==0)?360:0
  }
  build() {
    Row().width('150').height('150')
      .rotate({angle:this._rotate})//旋转角度
      .onClick(_=>{
        //this._rotate=(this._rotate==0)?360:0//变化的太生硬
      })
      .animation({
        duration:4000,//过程时间
        iterations:-1,//重复该过程的次数，如果设置为-1就是无尽的重复
        curve:curves.springMotion(),//带回弹效果
        // curve:Curve.Linear//控制过程速度的曲线样子，有线性变化，慢入，慢出，慢入慢出等
        delay:3000//3s后再开始
      })//加上动画丝滑效果，如果有不想用动画的参数，就把参数放到它的下面（比如这个颜色）
      .backgroundColor('#ff0000')

  }
}