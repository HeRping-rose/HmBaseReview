import { promptAction, PromptAction } from '@kit.ArkUI'

@Entry
@ComponentV2
struct Index {
  @Local flag:boolean=false
  @Local isShow:boolean=true

  @Local mVIP:number=0
  @Local optionValue:string="暂未开通"

  @Styles
   otherStyle(){
  .backgroundColor('#2b2b2b')
  .width('100%')
  .borderRadius(100)
  .onClick(()=>{
    promptAction.openToast({
      message: '点击了按钮'
    })
  })
}
  build() {
    Column({space:10}){
      Row(){
        Row(){
          Toggle({
            type: ToggleType.Switch,
            isOn:$$this.flag,
          })
          if(this.flag){
            Text("5G模式").fontSize(20)
          }else {
            Text("飞行模式").fontSize(20)
          }
        }
        Image('/assets/plane.svg')
        .width(this.flag?0:100)
        .height(this.flag?0:100)
        // .backgroundColor('#ffcbb6b6')
        .opacity(this.flag?0:1)
        .animation({
          duration: 600
        })
      }
      .width('100%').height(100)

      Row(){
        Image('/assets/jjy.jpg')
          .width(100)
          .visibility(this.isShow?Visibility.Visible:Visibility.Hidden)
        Button('show')
          .onClick(()=>{
            this.isShow=!this.isShow
          })
      }

      Column(){
        Row(){
          Text('开通会员')
          Select([
            {value:"暂未开通"},
            {value:"VIP"},
            {value:"SVIP"},
            {value:"SVIP+"}
          ])
            .selected($$this.mVIP)
            .value($$this.optionValue)
        }
        Row({space:5}){
          Image('/assets/Avatar.svg').width(30)
          Text('昵称')
          if(this.mVIP==0){
            VIP({nickName:"VIP",color:"#ccc"})
          }else if(this.mVIP==1){
            VIP({nickName:"VIP",color:"#ffe3da80"})
          }else if(this.mVIP==2) {
            VIP({nickName:"SVIP",color:"#ffa469e3"})
          }else {
            VIP({nickName:"SVIP+",color:"#ffe93962"})
          }


        }
      }


      Column({space:5}){
        Button("微信支付").myStyle('#01aa33').fontSize(20)
        Button("支付宝支付").myStyle('#0032a4').fontSize(20)
        Button("QQ支付").qqStyle().fontSize(20)
        Button("其他支付").otherStyle().fontSize(20)
      }
      .padding({left: 10, right: 10})





    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.SpaceBetween)


  }
}

@ComponentV2
struct VIP {
  @Param nickName:string="未登录"
  @Param color:string ='#ccc'
  build() {
    Text(this.nickName)
      .backgroundColor(this.color).padding(5).borderRadius(1000).fontColor('#ffe59e76')

  }
}


@Styles
function qqStyle(){
  .backgroundColor('#4a5777')
  .width('100%')
  .borderRadius(100)
  .onClick(()=>{
    promptAction.openToast({
      message: '点击了按钮'
    })
  })
}

@Extend(Button)
function myStyle(color: string){
  .backgroundColor(color)
  .width('100%')
  .borderRadius(100)
  .fontColor('gray')
  .fontSize(20)
  .onClick(()=>{
    promptAction.openToast({
      message: "已选择"
    })
  })
}
