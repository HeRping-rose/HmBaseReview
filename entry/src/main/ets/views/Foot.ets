

@Preview
@Component
struct Foot {
  build() {
    Row(){
      Text('首页')
        .fontSize(20)
        .fontColor('#000')
      Text('订单')
        .fontSize(20)
        .fontColor('#000')
      Text('我的')
        .fontSize(20)
        .fontColor('#000')
    }

    .backgroundColor('#ccc')
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.SpaceAround)
  }
}
export {Foot}