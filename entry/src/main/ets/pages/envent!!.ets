@Entry
@ComponentV2
struct ComponentQuestionCase {
  @Local money: number = 9999;

  build() {
    Column() {
      Text('father:' + this.money)
      Button('父亲存100块')
        .onClick(()=>{
          this.money += 100
        })
      CompQsChild({
        money:this.money,
        addMoney:()=>{
          this.money += 200
        }
      })
        .margin({ bottom: 30 })

      CompQsChild({
        money:this.money,
        addMoney:()=>{
          this.money += 200
        }
      })
    }
    .padding(20)
    .width('80%')
    .margin(30)
    .border({ width: 2 })
  }
}

@ComponentV2
struct CompQsChild {
  // 若不在本地初始化，则需和@Require装饰器一起使用，要求必须从外部传入初始化
  @Require @Param money: number
  // 自定义事件
  @Event addMoney:()=>void

  build() {
    Column() {
      Text('child:' + this.money)
      Button('花200块')
        .onClick(()=>{
          // @Param表示组件从外部传入的状态
          // 1. 父子组件之间的数据能够进行同步
          // 2. 不允许在组件内部直接修改变量本身
          //    修改值需使用@Event装饰器的能力
          // this.money -= 100
          this.addMoney()
        })
    }
    .padding(20)
    .backgroundColor(Color.Pink)
  }
}