// Head()
// main()
import promptAction from "@ohos.promptAction"

// Footer()
@ComponentV2
struct Head{
  @Consumer() themeColor: boolean = true
  build() {
    Row() {
      Text('Head').fontColor(this.themeColor ? '#2b2b2b' : '#fff')
      ChangeColor() // 组件 切换主题
    }
    .width('100%')
    .backgroundColor(this.themeColor ? '#ccc' : '#2b2b2b')
    .justifyContent(FlexAlign.SpaceBetween)
  }
}
@ComponentV2
struct ChangeColor {
  @Consumer() isLogin: boolean = false
  @Consumer() changeTheme: () => void = ()=>{}
  build() {
    Row(){
      Button("登录")
        .onClick(() => {
          this.isLogin = !this.isLogin
          promptAction.openToast({message: this.isLogin ? '登录成功' : '登录失败'})
        })
      Button("切换主题")
        .onClick(() => {
          this.changeTheme()
        })

    }

  }
}

@ComponentV2
struct Main {
  @Consumer() themeColor: boolean = true
  build() {
    Column() {
      Text('Main').fontColor(this.themeColor?'#2b2b2b':'#fff')
    }
    .width('100%')
    .height('100%')
    .backgroundColor(this.themeColor?'#fff':'#2b2b2b')
    .animation({duration: 300})
  }
}

@ComponentV2
struct Footer {
  build() {
    Column() {
      Text('Footer')
    }.backgroundColor('#ccc').width('100%')
  }
}

export {Head, Main, Footer}