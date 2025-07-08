

@Preview
@Component
export  struct Header {
  build() {
    Row(){
      Text('搜索')
        .padding({left: 10})
        .fontColor('#000')
      TextInput({placeholder: '输入关键字'})
        .layoutWeight(1)
      Text('登录')
        .padding({right: 10})
    }
    .backgroundColor('#fe0')
    .borderRadius(25)
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.SpaceBetween)
  }
}