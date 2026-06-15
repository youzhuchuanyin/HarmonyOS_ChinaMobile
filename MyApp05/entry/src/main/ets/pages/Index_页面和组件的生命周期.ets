
@Entry
@Component
struct Index{

  build() {
    Column({space:5}) {
      Button('跳转到新闻中心').onClick(_=>{
        this.getUIContext().getRouter().pushUrl({
          url:'pages/NewsCenter'
        })
      })
    }
    .height(500)
    .width('100%')
    .backgroundColor('#ddffdd')
  }
}