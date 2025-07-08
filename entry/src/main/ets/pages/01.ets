import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  @State msg: string = "Hello Ronnie! Welcome to study";


  build() {
    Column(){
      Row(){
        Text(this.msg)
          .fontColor("#fff")
          .fontSize(20)
          .width('100%')
          .textAlign(TextAlign.Center)
      }
      .backgroundColor("#ff12ab8d")//rgb 0-f
      .height(60)//vp  -->预览器总宽度:360vp pc端720vp
      .width('100%')
      Row(){
        Button("Click me")
          .width(150)
          .borderRadius(20)
          .onClick(()=>{
            this.msg = "Clicked!";
            promptAction.showToast({message:"Clicked!"});//弹窗
          })
      }
      .margin({top:10})
    }

  }
}