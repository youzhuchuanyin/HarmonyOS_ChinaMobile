@Component
@Entry
struct page9 {
  build() {
    Column() {
      /*Row() {
        //复选按钮
        Radio({ value: 'male', group: 'biology gender' })
          .checked(true)
        //.onChange(）
        Text('男')
        Radio({ value: 'female', group: 'biology gender' })
        Text('女')
      }*/
      Row() {
        Checkbox()
          .select(true)
          .enabled(true)
          .selectedColor('#99dd99')
          .shape(CheckBoxShape.ROUNDED_SQUARE)
          .onChange(state=>{
            console.log(`当前是否勾选？${state}`)
          })
        Text('我同意本站的使用条款：')
      }
    }
  }
}