@Component
@Entry
struct page09 {
  //成员变量
  //分为标准变量（不会自动刷新，但如果和状态变量放在一起就会沾他的光）和状态变量（会自动刷新用到它的组件，其他组件它不管）
  @State _state: boolean = true
  numbasic: number = 0
  @State
  numstate: number = 0;

  build() {
    Column() {
      Text('当前点击次数' + this.numstate)
      Text('当前点击次数' + this.numbasic)
      Button('点击一次就加一次').onClick(_ => {
        this.numbasic++
        this.numstate++
        console.log('总点击次数为' + this.numbasic)
        console.log('总点击次数为' + this.numstate)
      })

      //练习：用户勾选“我同意本站使用条款”就启用注册按钮，不勾选就禁用
      Blank(40)
      Row({ space: 10 }) {
        Checkbox().select(true).onChange(_ => {
          this._state = !(this._state)
          //console.log(' '+this._state)
        })
        Text('我同意本站使用条款')
      }

      Row() {
        Button('注册按钮').enabled(this._state)
      }

    }
  }
}