@Component
@Preview
 export struct  discountItem{
  @State _image:string=''
  @State _imageText:string=''
  build() {
    Column() {
      Image('/Images/'+this._image).width('100%')
      Text(this._imageText).width('100%').padding(5)
    }.padding({left:5,right:5}).backgroundColor(Color.White)
    .width('100%')
    .onClick(_=>{
      this.getUIContext().getRouter().pushUrl(
        {url:'pages/DiscountDetails',
        params:{islogin: false, did: 101, location: 'beijing' }}
      )
    })
  }
}