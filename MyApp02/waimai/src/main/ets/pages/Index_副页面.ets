@Component
@Entry
struct page02{
  build() {
  RelativeContainer(){
    Row(){Text('后退')}
    .alignRules({
      left:{anchor:'__container__',align:HorizontalAlign.Start},
      center:{anchor:'__container__',align:VerticalAlign.Center}
    })
    Row(){Text('优惠')}.alignRules({
      middle:{anchor:'__container__',align:HorizontalAlign.Center},
      center:{anchor:'__container__',align:VerticalAlign.Center}
    })
    Row(){Text('设置')}.alignRules({
      right:{anchor:'__container__',align:HorizontalAlign.End},
      center:{anchor:'__container__',align:VerticalAlign.Center}
    })
  }.width('100%').height(45).backgroundColor('#f7f7f7').padding({left:5,right:5})
  }
}