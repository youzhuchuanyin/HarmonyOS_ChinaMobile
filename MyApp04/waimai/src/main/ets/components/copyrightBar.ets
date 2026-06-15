//只有页面组件才需要分配@entry-即需要分配路由地址的
@Preview//不加就无法预览，毕竟它只是一个组件而不是页面
@Component
export struct  copyrightBar{
  build() {
    Column(){
      Text('京ICP备05002571号 证照信息')
        .lineHeight(30)
      Text('Copyright©1999-2025 中国移动 版权所有')
        .lineHeight(30)
      Text('中华人民共和国增值电信业务经营许可证')
        .lineHeight(30)
      Text('经营许可证编号：A2.B1.B2-20100001')
        .lineHeight(30)
      Text('本网站支持IPv6访问')
        .lineHeight(30)
    }.width('100%')
    .backgroundColor('#F7F7F7')
    .padding({
      top: 20,
      bottom: 40
    })
  }
}