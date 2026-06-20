

@Entry
@Component
struct Index {
aboutToAppear(): void {
  console.log('页面组件即将挂载')
}
onPageShow(): void {
  console.log('首页即将显示')
}
onPageHide(): void {
  console.log('首页即将隐藏')
}
  build() {
Text('head')
  }
}