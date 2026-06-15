@Component
export struct welcomeBar{
  @State _welcomeText:string='欢迎来到中国移动网上营业厅'
  @State _username:string=''
  build() {
    Row() {
      Text(this._welcomeText)
      if(this._username=='') {
        Text('去登陆 >')
      }else{
        Text(this._username)
        Button('退出登录')
      }
    }.width('100%').height(36)
    .padding({
      left: 20
    })
  }
}