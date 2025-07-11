import { Footer, Head, Main } from './component'
import { promptAction } from '@kit.ArkUI'

@Entry
@ComponentV2
struct Index {
  @Provider() isLogin: boolean = false
  @Provider() themeColor: boolean =  true
  @Provider() changeTheme: () => void = () => {
    if(this.isLogin){
      this.themeColor = !this.themeColor
      promptAction.openToast({message: this.themeColor ? '切换成功' : '切换失败'})
    }else{
      promptAction.openToast({message: '请先登录'})
    }

  }
  build() {
    Column({space: 10}){
      Head()
      Main()
        .layoutWeight(1)
      Footer()
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.SpaceBetween)
  }
}


