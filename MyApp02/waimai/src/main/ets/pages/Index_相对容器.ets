@Component
@Entry
struct Page5 {
  build() {
    Column() { //NO1
      Row() { //第一层
        Blank().layoutWeight(1)
        Image('/images/logo.png').objectFit(ImageFit.Contain).width(106)
        Blank().layoutWeight(2)
        Image('/images/ipv6.png').objectFit(ImageFit.Contain).width(42)
        Blank().layoutWeight(4)
        Text('北京').width(25).fontSize(12).fontColor('#000000')
        Text('▼').width(9)
        Blank().layoutWeight(2)
        Image('/images/ghb_icon.png').width(51)
        Blank().layoutWeight(1)
        Text('🔍').width(17)
        Blank().layoutWeight(1)
        Image('/images/more.png').width(17)
        Blank().layoutWeight(1)
      }.width('100%').height(45)
      .backgroundColor('#f2f2f2')

      Row() {
        Blank().layoutWeight(2)
        Text('欢迎来到中国移动掌上营业厅').fontSize(14).fontColor('#666666')
        Blank().layoutWeight(1)
        Text('去登录').fontSize(9).fontColor('#0085d0')
        Blank().layoutWeight(0.5)
        Text('>').fontSize(9)
        Blank().layoutWeight(15)
      }.backgroundColor('#ffffff')
      .width('100%').height(35)

      Row() {
        Blank().layoutWeight(1)
        Image('/images/laba.png').objectFit(ImageFit.Contain).width(14).height(20)
        Blank().layoutWeight(0.5)
        Text('公告').fontColor('#ffffff').fontSize(11)
        Blank().layoutWeight(0.5)
        //滚动文字...
        Swiper() {
          Text('关于中国移动取消流量“漫游”费的公告').fontColor('#ffffff').fontSize(11)
          Text('中国移动掌上营业厅服务协议').fontColor('#ffffff').fontSize(11)
          Text('【紧急公告】关于WAP历史账单查询暂停公告').fontColor('#ffffff').fontSize(11)
        }.layoutWeight(25)
        .autoPlay(true)
        .interval(2000)

        Image('/images/left_jt.png').objectFit(ImageFit.Contain).width(8).height(14)
        Blank().layoutWeight(1)
        Image('/images/right_jt.png').objectFit(ImageFit.Contain).width(8).height(14).margin(5)
      }.backgroundColor('#999999')
      .width('100%').height(25)

      Row() {
        Swiper() {
          Image('//images/swip-1.jpg').objectFit(ImageFit.Fill)
          Image('/images/swip-2.png').objectFit(ImageFit.Fill)
          Image('/images/swip-3.png').objectFit(ImageFit.Fill)
        }.autoPlay(true).interval(3500)
        .indicator(DotIndicator.dot()//改变成原点
          .itemWidth(14)
          .itemHeight(14)
          .selectedItemWidth(14)
          .selectedItemHeight(14)
          .color('#ffffff')
          .selectedColor('#666666'))

        //color('rgba(255,255,255,0.5)')
      }.width('100%').height(141)

      Row() {
        Column() {
          Image('/images/1-1.png').aspectRatio(1).width(40)//图片的宽高比
          Blank(6)
          Text('话费充值').fontSize(10).fontColor('#666666')
        }.width(73)

        Column() {
          Image('/images/1-2.png').aspectRatio(1).width(40)
          Blank(6)
          Text('流量充值').fontSize(10).fontColor('#666666')
        }.width(73)

        Column() {
          Image('/images/1-3.png').aspectRatio(1).width(40)
          Blank(6)
          Text('账单查询').fontSize(10).fontColor('#666666')
        }.width(73)

        Column() {
          Image('/images/1-4.png').aspectRatio(1).width(40)
          Blank(6)
          Text('套餐剩余').fontSize(10).fontColor('#666666')
        }.width(73)

        Column() {
          Image('/images/1-5.png').aspectRatio(1).width(40)
          Blank(6)
          Text('已定业务').fontSize(10).fontColor('#666666')
        }.width(73)
      }.height(72).width('100%').justifyContent(FlexAlign.SpaceAround).backgroundColor('#ffffff')

      Row() {
        Column() {
          Image('/images/1-1.png').aspectRatio(1).width(40)
          Blank(6)
          Text('话费充值').fontSize(10)
        }.width(73)

        Column() {
          Image('/images/1-1.png').aspectRatio(1).width(40)
          Blank(6)
          Text('话费充值').fontSize(10).fontColor('#666666')
        }.width(73)

        Column() {
          Image('/images/1-1.png').aspectRatio(1).width(40)
          Blank(6)
          Text('话费充值').fontSize(10).fontColor('#666666')
        }.width(73)

        Column() {
          Image('/images/1-1.png').aspectRatio(1).width(40)
          Blank(6)
          Text('话费充值').fontSize(10).fontColor('#666666')
        }.width(73)

        Column() {
          Image('/images/1-1.png').aspectRatio(1).width(40)
          Blank(6)
          Text('话费充值').fontSize(10).fontColor('#666666')
        }.width(73)

      }.height(72).width('100%').justifyContent(FlexAlign.SpaceAround).backgroundColor('#ffffff')//调整子容器的排列

      Row() {
        RelativeContainer() {//相对容器，允许子组件之间发生叠摞现象。默认情况下，都在左上角对齐
                            //子组件纵向移动：top，center，bottom--父组件叫top，center,bottom
                            //子组件横向移动：left，middle，right--父组件叫start，center，end
                            //修改位置需要修改参照物(可以是父容器，也可以是同级兄弟容器)
          Text('宽带新装').fontColor('#333333').fontSize(15)
            .id('kdxz')
          Text('家居必备').fontColor('#999999').fontSize(12)
            .alignRules({
              top:{anchor:'kdxz',align:VerticalAlign.Bottom},
            }).padding({top:5})
          Image('/images/kuandai.png').width(60)
            .alignRules({
              right:{anchor:'__container__',align:HorizontalAlign.End},
              bottom:{anchor:'__container__',align:VerticalAlign.Bottom}
            })
        }.width('50%').padding(10).borderWidth({right:1,bottom:1}).borderColor('#eeeeee')

        RelativeContainer() {
          Text()
          Text()
          Image('/images/qinqing.png').width(60)
        }.width('50%').padding(10).borderWidth({right:1,bottom:1}).borderColor('#eeeeee')
      }.width('100%').aspectRatio(3.316)

      //...
    }
  }
}