
import { promptAction } from '@kit.ArkUI'

enum logintype {RADON_LOGIN, KEFU_LOGIN, YOUXIANG_LOGIN}

@Component
@Entry
struct page10 {
  @State _login: logintype = logintype.RADON_LOGIN
@State _phone:string=''
  @State _kefu:string=''
  @State _radon:string=''
  @State _policy:boolean=false
  @State _xieyi:boolean=false
  @State _remember:boolean=false
  @State _remind:string=''
  @State _canlog:boolean=false
  build() {
    Column() {
      Row() {
        Text(' <')
        Text('登录')
        Image('/images/home.png').width(44)
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
      .height(44)
      .backgroundColor('#f7f7f7')
      .borderWidth(1)
      .borderColor('#dfdfdf')
      .padding(5)

      Column() {
        Row() {
          Text('短信随机码登录')
            .fontSize(14)
            .fontColor(this._login == logintype.RADON_LOGIN ? '#ffffff' : '#666666')
            .width('50%')
            .height('100%')
            .borderRadius('50%')
            .backgroundColor((this._login == logintype.RADON_LOGIN) ? '#0085d0' : Color.Transparent)
            .textAlign(TextAlign.Center)
            .onClick(_ => {
              this._login = logintype.RADON_LOGIN
            })
          Text('客服密码登录')
            .fontSize(14)
            .fontColor(this._login == logintype.KEFU_LOGIN ? '#ffffff' : '#666666')
            .width('50%')
            .height('100%')
            .borderRadius('50%')
            .backgroundColor((this._login == logintype.KEFU_LOGIN) ? '#0085d0' : Color.Transparent)
            .textAlign(TextAlign.Center)
            .onClick(_ => {
              this._login = logintype.KEFU_LOGIN
            })
        }
        .borderWidth(1)
        .borderRadius('50%')
        .borderColor('#0085d0')
        .width('100%')
        .height(42)
        .justifyContent(FlexAlign.SpaceAround)
        .margin({ bottom: 10 })
        if(!this._canlog) {
          Row() {
            Text(this._remind).fontColor('#eb573d')
          }.width('100%')
        }
        Row() {
          Image('/images/phone_icon.png').width(18).margin(10)
          TextInput({ placeholder: '手机号码' ,text:$$this._phone}).layoutWeight(1).backgroundColor(Color.White)
            .type(InputType.PhoneNumber)
        }
        .borderWidth(1)
        .borderColor('#dfdfdf')
        .width('100%')
        .height(46)
        .margin(10)
if(this._login==logintype.KEFU_LOGIN) {
  Row() {
    Image('/images/phone_icon.png').width(18).margin(10)
    TextInput({ placeholder: '请您使用客服密码，购买、办理更方便' ,text:$$this._kefu})
      .layoutWeight(1).backgroundColor(Color.White)
      .type(InputType.Password).showPasswordIcon(false)
  }
  .borderWidth(1)
  .borderColor('#dfdfdf')
  .width('100%')
  .height(46)
  .margin(10)
}
        Row() {
          Image('/images/phone_icon.png').width(18).margin(10)
          TextInput({ placeholder: '短信随机码' ,text:$$this._radon}).layoutWeight(1).backgroundColor(Color.White)
          Button() {
            Text('获取短信随机码').fontColor('#666666')
          }.layoutWeight(1)
          .type(ButtonType.Normal).height('100%')
          .backgroundColor('#fafafa')
        }
        .borderWidth(1)
        .borderColor('#dfdfdf')
        .width('100%')
        .height(46)
        .margin(10)

        Row() {
          Checkbox().select($$this._policy)
          Text('请阅读《个人信息保护政策》').fontColor('#666666')
        }.alignSelf(ItemAlign.Start)
        .margin({ top: 10, bottom: 10 })

        Row() {
          Checkbox().select($$this._xieyi)
          Text('请阅读《中国移动网站服务协议》').fontColor('#666666')
        }.alignSelf(ItemAlign.Start)
        .margin({ top: 10, bottom: 10 })

        Row() {
          Checkbox().select($$this._remember)
          Text('记住账号').fontColor('#666666')
          Blank().layoutWeight(1)
          Text('互联网用户登录').fontColor('#666666')
        }.alignSelf(ItemAlign.Start)
        .margin({ top: 10, bottom: 10 })
      }
      .padding({
        top: 10,
        left: 15,
        right: 15,
        bottom: 15
      })
      .width('100%')
      .borderColor('#dfdfdf')
      .borderWidth(1)

      Row(){
        Button(){
          Text('立即登录').fontColor('#fff')
        }.width('100%').height(45)
        .backgroundColor('#0085d0')
        .onClick(_=>{

          (this._phone!=''&&this._policy==true)?(this._canlog=true):(this._canlog=false)
          console.log(''+this._canlog+''+this._phone+''+this._policy)
          if(this._phone==''){
            this._remind='情书去手机号'
          }else if(this._policy==false){
            this._remind='请统一个人信息保护'
          }else{
            promptAction.openToast({
              message:'登陆中，请稍后...',
              duration:5000,
              backgroundColor:'#000000'
            })
          }
        })
      }
      .padding({
        top: 10,
        left: 15,
        right: 15,
        bottom: 15
      })
        .backgroundColor('#f7f7f7f').width('100%').height(65)
      .borderColor('#dfdfdf').borderWidth(1)
      Row(){
        Text('登录 | 帮助')
        Blank().layoutWeight(1)
        Text('回到顶部')
      }.padding({
        top: 15,
        left: 15,
        right: 15,
        bottom: 15
      })
      .backgroundColor('#f7f7f7f').width('100%').height(65)
      .borderColor('#dfdfdf').borderWidth(1)
    }
  }
}