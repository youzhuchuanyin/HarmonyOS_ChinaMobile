@Component
struct child1{

  aboutToAppear(): void {
    console.log('子组件1显示...')//2
  }
  aboutToDisappear(): void {
    console.log('子组件1消失...')//7
  }
  build() {
    Column() {
      Text('子组件1')
    }
      .height(200).backgroundColor('#fff000').width('100%')
  }
}
@Component
struct child2{
  aboutToAppear(): void {
    console.log('子组件2显示...')//3
  }
  aboutToDisappear(): void {
    console.log('子组件2消失...')//8
  }
  build() {
    Column() {
      Text('子组件2')
    }
    .height(200).backgroundColor('#fff000').width('100%')
  }
}

@Entry
@Component
struct newsCenter{
  onPageShow(): void {
    console.log('页面显示...')//4
  }
  onPageHide(): void {
    console.log('页面消失...')//5
  }
  aboutToAppear(): void {
    console.log('主组件显示...')//1
  }
  aboutToDisappear(): void {
    console.log('主组件消失...')//6
  }
  build() {
    Column({space:5}) {
      Text('父组件')
        .fontSize($r('app.float.page_text_font_size'))
      child1()
      child2()
    }
    .height(500)
    .width('100%')
    .backgroundColor('#ddffdd')
  }
}