@Component
@Entry
struct Page5 {
  build() {
    Scroll(){
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

      //Row() {//若加上会出现莫名留白
      Swiper() {
        Image('//images/swip-1.jpg').objectFit(ImageFit.Fill)
        Image('/images/swip-2.png').objectFit(ImageFit.Fill)
        Image('/images/swip-3.png').objectFit(ImageFit.Fill)
      }
      .autoPlay(true)
      .interval(3500)
      .indicator(DotIndicator.dot()//改变成 原点
        .itemWidth(14)
        .itemHeight(14)
        .color('#ffffff')
        .selectedItemWidth(14)
        .selectedItemHeight(14)
        .selectedColor('#666666')
      )

      //color('rgba(255,255,255,0.5)')
      //}
      .width('100%')
      .height(141)

      /*Row() {
        Column() {
          Image('/images/1-1.png').aspectRatio(1).width(40) //图片的宽高比
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

      }.height(72).width('100%').justifyContent(FlexAlign.SpaceAround).backgroundColor('#ffffff') //调整子容器的排列
      */

      //list-listitem*10-column-image+text
      List() { //可以纵向滚动
        ListItem() {
          Column() {
            Image('/images/1-1.png').width(40) //图片的宽高比
            Blank(6)
            Text('话费充值').fontSize(10).fontColor('#666666')
          }.padding({ top: 8, bottom: 8 }).width('100%')
        }

        ListItem() {
          Column() {
            Image('/images/1-2.png').aspectRatio(1).width(40)
            Blank(6)
            Text('流量充值').fontSize(10).fontColor('#666666')
          }.padding({ top: 8, bottom: 8 }).width('100%')
        }

        ListItem() {
          Column() {
            Image('/images/1-3.png').aspectRatio(1).width(40)
            Blank(6)
            Text('账单查询').fontSize(10).fontColor('#666666')
          }.padding({ top: 8, bottom: 8 }).width('100%')
        }

        ListItem() {
          Column() {
            Image('/images/1-4.png').aspectRatio(1).width(40)
            Blank(6)
            Text('套餐剩余').fontSize(10).fontColor('#666666')
          }.padding({ top: 8, bottom: 8 }).width('100%')
        }

        ListItem() {
          Column() {
            Image('/images/1-5.png').aspectRatio(1).width(40)
            Blank(6)
            Text('已定业务').fontSize(10).fontColor('#666666')
          }.padding({ top: 8, bottom: 8 }).width('100%')

        }

        ListItem() {
          Column() {
            Image('/images/1-1.png').width(40) //图片的宽高比
            Blank(6)
            Text('话费充值').fontSize(10).fontColor('#666666')
          }.padding({ bottom: 8 }).width('100%')
        }

        ListItem() {
          Column() {
            Image('/images/1-2.png').aspectRatio(1).width(40)
            Blank(6)
            Text('流量充值').fontSize(10).fontColor('#666666')
          }.padding({ bottom: 8 }).width('100%')
        }

        ListItem() {
          Column() {
            Image('/images/1-3.png').aspectRatio(1).width(40)
            Blank(6)
            Text('账单查询').fontSize(10).fontColor('#666666')
          }.padding({ bottom: 8 }).width('100%')
        }

        ListItem() {
          Column() {
            Image('/images/1-4.png').aspectRatio(1).width(40)
            Blank(6)
            Text('套餐剩余').fontSize(10).fontColor('#666666')
          }.padding({ bottom: 8 }).width('100%')
        }

        ListItem() {
          Column() {
            Image('/images/1-5.png').aspectRatio(1).width(40)
            Blank(6)
            Text('已定业务').fontSize(10).fontColor('#666666')
          }.padding({ bottom: 8 }).width('100%')

        }
      }.width('100%').aspectRatio(2.5).backgroundColor('#ffffff')
      .lanes(5)

      Row() { //或者采用背景图表示
        Image('/images/logo_news.png').width(30).aspectRatio(1)
        Text('移动要闻').fontColor('#2892ff').fontSize(17).padding({ left: 5 })
      }.width('100%').height(45).backgroundColor('#f2f2f2').justifyContent(FlexAlign.Center)

      Swiper() {
        RelativeContainer() {
          Image('/images/news1.jpg')
          Text('“移动爱家”启动四大焕新升级')
            .alignRules({
              bottom: { anchor: '__container__', align: VerticalAlign.Bottom }
            })
            .fontSize(15)
            .fontColor('#ffffff')
            .fontWeight(FontWeight.Bold)
            .padding(18)
        }

        RelativeContainer() {
          Image('/images/news0.jpg')
          Text('中国移动全力做好柳州市柳南区5.2级地震应急通信保障工作')//如果文字过多摆不下怎么办，见如下两条
            .maxLines(2)
            .textOverflow({ overflow: TextOverflow.Ellipsis })//有三个点
            .fontSize(15)
            .fontColor('#ffffff')
            .fontWeight(FontWeight.Bold)
            .alignRules({
              bottom: { anchor: '__container__', align: VerticalAlign.Bottom }
            })
            .padding(18)
        }

        RelativeContainer() {
          Image('/images/news2.jpg')
          Text('"电信日致辞丨中国移动党组书记、董事长陈忠岳：网络强基 全栈创新"')
            .fontSize(15)
            .fontColor('#ffffff')
            .fontWeight(FontWeight.Bold)
            .alignRules({
              bottom: { anchor: '__container__', align: VerticalAlign.Bottom }
            })
            .padding(18)
        }
      }.width('100%').height(135).autoPlay(true)

      List(){
        ListItem(){
         Column(){
           Text('从“妈妈班”到“反诈团”：以“家”之名，点亮清朗网络接力赛')
             .fontSize(14).maxLines(1).textOverflow({overflow:TextOverflow.Ellipsis})
             .padding({left:20})
             .backgroundImage('/images/news_icon.png')
             .backgroundImageSize({width:12})
             .backgroundImagePosition({x:5,y:3})
           Text('2026-05-18').fontSize(12).fontColor('rgba(0,0,0,0.4)').padding({left:5,top:2})
         }.padding(10).borderWidth({bottom:1}).borderColor('#ededed')
          .width('100%').height('50%').alignItems(HorizontalAlign.Start).justifyContent(FlexAlign.Center)
        }
        ListItem(){
          Column(){
            Text('"中国移动：科技力量守卫向上向善网络空间"')
              .fontSize(14).maxLines(1).textOverflow({overflow:TextOverflow.Ellipsis})
              .padding({left:20})
              .backgroundImage('/images/news_icon.png')
              .backgroundImageSize({width:12})
              .backgroundImagePosition({x:5,y:3})
            Text('2026-05-18').fontSize(12).fontColor('rgba(0,0,0,0.4)').padding({left:5,top:2})
          }.width('100%').height('50%').padding(10).borderWidth({bottom:1}).borderColor('#ededed')
          .alignItems(HorizontalAlign.Start).justifyContent(FlexAlign.Center)
        }
      }.width('100%').aspectRatio(375/128)

      Row() {
        Text('全家享')
          .fontSize(17)
          .fontColor('#85cf22')
          .padding({left :19})
          .backgroundImage('/images/fiveicons.png')
          .backgroundImageSize({ width: 18 })
          .backgroundImagePosition({ y: 1 })
      }.width('100%').aspectRatio(375 / 45).backgroundColor('#f2f2f2').justifyContent(FlexAlign.Center)

      Row() {
        RelativeContainer() { //相对容器，允许子组件之间发生叠摞现象。默认情况下，都在左上角对齐
          //子组件纵向移动：top，center，bottom--父组件叫top，center,bottom
          //子组件横向移动：left，middle，right--父组件叫start，center，end
          //修改位置需要修改参照物(可以是父容器，也可以是同级兄弟容器)
          Text('宽带新装').fontColor('#333333').fontSize(15)
            .id('kdxz')
          Text('家居必备').fontColor('#999999').fontSize(12)
            .alignRules({
              top: { anchor: 'kdxz', align: VerticalAlign.Bottom },
            }).padding({ top: 5 })
          Image('/images/kuandai.png').width(60)
            .alignRules({
              right: { anchor: '__container__', align: HorizontalAlign.End },
              bottom: { anchor: '__container__', align: VerticalAlign.Bottom }
            })
        }.width('50%').padding(10).borderWidth({ right: 1, bottom: 1 }).borderColor('#eeeeee')

        RelativeContainer() {
          Text('全国亲情网').fontColor('#333333').fontSize(15).id('qgqqw')
          Text('成员多至19人').fontColor('#999999').fontSize(12)
            .alignRules({
              top: { anchor: 'qgqqw', align: VerticalAlign.Bottom }
            }).padding({ top: 5 })
          Image('/images/qinqing.png').width(60)
            .alignRules({
              right: { anchor: "__container__", align: HorizontalAlign.End },
              bottom: { anchor: '__container__', align: VerticalAlign.Bottom }
            })
        }.width('50%').padding(10).borderWidth({ right: 1, bottom: 1 }).borderColor('#eeeeee')
      }.width('100%').aspectRatio(3.316)

      //...
    }
    }
  }
}