import { APIConstants } from '../Constants/APIConstants'
import { dataInterface, homeModels } from '../Viewmodels/HomeModels'

@Component
@Entry
struct pages07 {
  @State _gusslike: dataInterface[] = []

  async aboutToAppear(): Promise<void> {
    this._gusslike = await homeModels.appRecommend()
    console.log(
      JSON.stringify(this._gusslike)
    )
  }

  build() {
    Column() {
      Row() {
        Text('猜你喜欢').width('100%').textAlign(TextAlign.Center).height(50)
      }
      //加了foreach就不用if判断了
      //if (this._gusslike.length != 0) {
        List() {
         //在UI界面里（build），不能使用for会报错
          //它自己知道i就是数组的长度
          ForEach(this._gusslike,(data:dataInterface,i:number)=>{
            ListItem() {
            Column() {
              //原来的【0】就不用了，直接用data
              // Image(APIConstants.HOST + this._gusslike[1].pictureUrl)
              Image(APIConstants.HOST + data.pictureUrl)
                .width('80%')
              Text(data.title).textOverflow({overflow:TextOverflow.MARQUEE})
            }
          }.padding({})
          .backgroundColor('#f2f2f2')})


        }.lanes(3)
        .alignListItem(ListItemAlign.Center)
      //}
    }.width('100%').backgroundColor('#f7f7f7')

  }
}