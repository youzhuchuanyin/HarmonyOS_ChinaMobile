@Component
struct child3{
  //@State _chiNum:number=-3//仅能在初始化时传参。后续父亲变化与我无关
  //@Prop _chiNum:number=-3//可跟随父亲，但自己变化时无法影响父亲（值拷贝）
  @Link _chiNum:number//无法赋初始值。完全与父亲绑定（地址拷贝）
  build() {
    Column() {
      Text('子组件3:'+this._chiNum).onClick(_=>{
        this._chiNum++
      })
    }
    .height(200).backgroundColor('#fff000').width('100%')
  }
}
@Component
struct child4{
  build() {
    Column() {
      Text('子组件4:')
    }
    .height(200).backgroundColor('#fff000').width('100%')
  }
}

@Entry
@Component
struct Index04{
  @State _faNum:number=0
  build() {
    Column({space:5}) {
      Text('父组件:'+this._faNum)
        .fontSize($r('app.float.page_text_font_size'))
        .onClick(_=>{
          this._faNum++
        })
      child3({_chiNum:this._faNum})
      child4()
    }
    .height(500)
    .width('100%')
    .backgroundColor('#ddffdd')
  }
}