//10086在首页多次反复出现的"楼层标题"
//特点：在单个页面里反复出现，但，其他页面没有
//方案：声明为Builder方法
//在页面中，只有两种情况可以构建UI：1.build（）方法2.函数前面加上@builder解释器
@Entry
@Component
struct Index {
  @State message: string = '首页';

@Builder
f1(_itemText:string='',_itemColor:string='#333333',_image:string=''){
  Row() {
    Image(_image)
    Text(_itemText).fontColor(_itemColor)
  }.justifyContent(FlexAlign.Center).width('100%').height(45)
}

  build() {
    Column(){
      this.f1('移动要闻','#ff0000')
      this.f1('全家享','#00aa00')
      this.f1('业务推荐','#0000dd')
      this.f1('号卡推荐','#aa00dd')
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#ddffdd')
  }
}