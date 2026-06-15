@Component
@Entry
struct page9 {
  build() {
    Scroll() {//只能有一个子组件。list继承自scroll


    Column({ space: 10 }) {
      Toggle({
        type: ToggleType.Button
        //switch
        //checkbox
      }) {
        Text('手术中')
      }.selectedColor(Color.Red)

      DatePicker() //日期组件
      TimePicker() //时间组件
      Rating() //评分组件
      Progress({
        value: 20,
        total: 100

      })
    }
  }.height(300)
  }
}