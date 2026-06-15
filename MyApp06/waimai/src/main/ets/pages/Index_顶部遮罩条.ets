import { topMaskBar } from '../Components/topMaskBar'

//10086首页，滑动后顶端出现一个遮罩条效果，到了顶端又不见
@Component
@Entry

struct page05{
  @State _showTopBar:boolean=false
  @State y:number=0
 _scroll:Scroller=new Scroller()
  build() {
    RelativeContainer() {
      Scroll(this._scroll) {
        Column({ space: 60 }) {
          Text('一楼').fontSize(50).fontStyle(FontStyle.Italic).fontWeight(FontWeight.Bold)
            .padding({ top: 30 })
          Text('二楼').fontSize(50).fontStyle(FontStyle.Italic).fontWeight(FontWeight.Bold)
          Text('三楼').fontSize(50).fontStyle(FontStyle.Italic).fontWeight(FontWeight.Bold)
          Text('四楼').fontSize(50).fontStyle(FontStyle.Italic).fontWeight(FontWeight.Bold)
          Text('五楼').fontSize(50).fontStyle(FontStyle.Italic).fontWeight(FontWeight.Bold)
          Text('六楼').fontSize(50).fontStyle(FontStyle.Italic).fontWeight(FontWeight.Bold)
          Text('七楼').fontSize(50).fontStyle(FontStyle.Italic).fontWeight(FontWeight.Bold)
          Text('八楼').fontSize(50).fontStyle(FontStyle.Italic).fontWeight(FontWeight.Bold)
          Text('九楼').fontSize(50).fontStyle(FontStyle.Italic).fontWeight(FontWeight.Bold)
            .padding({ bottom: 30 })
        }.width('100%')
      }.width('100%').height('100%')
      .backgroundColor('#f7f7f7')
      .onDidScroll(_=>{
        this.y=this._scroll.currentOffset().yOffset
        //console.log(''+this.y)
        this._showTopBar=this.y>90
      })
    if(this._showTopBar){
      topMaskBar().transition(TransitionEffect.OPACITY.animation({}))
    }else {

    }
    }
  }
}