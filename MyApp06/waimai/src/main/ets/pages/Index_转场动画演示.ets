@Entry
@Component
struct Index {
  @State _isdark:boolean=false//false表示白天，true表示夜晚

  build() {
    Column() {
      if(this._isdark) {//丝滑转场加transition内部配合animation使用
        Image('/Images/moon.svg').width(60)
          .transition(TransitionEffect.OPACITY
            .combine(TransitionEffect.SLIDE)
            .combine(TransitionEffect.scale({x:0,y:0})).animation({duration:1000}))//opacity 0-1-0都会有动画不透明度转场
          //.transition(TransitionEffect.SLIDE.animation({duration:1000}))//从屏幕最左到最右
          //.transition(TransitionEffect.SLIDE_SWITCH.animation({duration:1000}))//缩小左移一个身位退出
          //...TransitionEffect.opacity(0.5)...//0-0.5有动画，但0.5-1没有。1-0.5有动画，但0.5-0没有
          //...TransitionEffect.translate({x:1,y:1})...//往右下角去
          //...TransitionEffect.move(TransitionEdge.TOP)...
          //...TransitionEffect.scale({x:1,y:1})...//按比例浮现
        //.rotate({angle:360})

      }
      else{
        Image('/Images/sun.svg').width(60)
          //.transition(TransitionEffect.OPACITY.animation({duration:1000}))
         // .transition(TransitionEffect.opacity(0.5).animation({duration:1000}))
          //.transition(TransitionEffect.translate({x:100,y:100}).animation({duration:1000}))
          //.transition(TransitionEffect.scale({x:0,y:0}).animation({duration:1000}))
          .transition(TransitionEffect.rotate({angle:60}).animation({duration:1000}))
          //.transition(TransitionEffect.move(TransitionEdge.TOP).animation({duration:1000}))
          //.transition(TransitionEffect.SLIDE.animation({duration:1000}))
          //.transition(TransitionEffect.SLIDE_SWITCH.animation({duration:1000}))
      }
    }.onClick(_=>{
      this._isdark=!this._isdark
    })
    .height('100%')
    .width('100%')
  }
}