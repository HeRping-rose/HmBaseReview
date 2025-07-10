import { promptAction } from '@kit.ArkUI'
import  {back,title,toggleSwitch,toggleCheckbox,img,slide,search,textInput} from './builders/nav'


@Entry
@Component
struct Index {
  build() {
    Column(){
      // NavBar()
      navbar({
        left:back,
        center:title,
        right:slide,
      })
      navbar({
        center:title,
        right:search,
      })
    }
    .width('100%')
    // .height(50)
    .backgroundColor('#ccc')
  }
}

@ComponentV2
struct NavBar {
  build() {
    Row() {
      Button("返回")
        .onClick(()=>{
          promptAction.openToast({
            message: "已返回"
          })
        })
      Text("标题")
      Button("更多")
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
  }
}

@ComponentV2
struct navbar {
  //默认值
  @Builder centerDefault(){
    Text("标题")
  }
  @Builder edge(){
    Text("")
  }





  @BuilderParam left:()=>void =this.edge
  @BuilderParam center:()=>void =this.centerDefault
  @BuilderParam right:()=>void =this.edge
  build() {
    Flex({direction: FlexDirection.Row,
      justifyContent: FlexAlign.SpaceBetween,
      alignItems: ItemAlign.Center}){
      Row(){
        // Button("返回")
        //   .backgroundColor('#ccc')
        this.left()

      }
      .flexGrow(1)
      .justifyContent(FlexAlign.Center)
      Row(){
        // Text("标题")
        //   .fontSize(20)
        //   .backgroundColor('#ccc')
        this.center()

      }
      .flexGrow(3)
      .justifyContent(FlexAlign.Center)
      Row(){
        // Button("更多")
        //   .backgroundColor('#ccc')
        this.right()

      }
      .flexGrow(1)
      .justifyContent(FlexAlign.Center)
    }
    .height(60)
    .width('100%')
  }
}