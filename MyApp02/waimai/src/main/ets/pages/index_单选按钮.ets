@Component
@Entry
struct page9 {
  build() {
    Column() {
      Row() {
        //单选按钮
        Text('性别：')
        Radio({ value: 'male', group: 'biology gender' })
          .checked(true)
        //.onChange(）
        Text('男')
        Radio({ value: 'female', group: 'biology gender' })
        Text('女')
      }.width('100%').justifyContent(FlexAlign.Center)

      Row() {
        Text('政治面貌：')
        Radio({group:'zzmm',value:'党员'}).checked(true)
        Text('党员')
        Radio({group:'zzmm',value:'群众'})
        Text('群众')
        Radio({group:'zzmm',value:'积极分子'})
        Text('积极分子')
      }.justifyContent(FlexAlign.Center)
    }
  }
}