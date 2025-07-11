@ObservedV2
class ICar {
  name: string
  @Trace price: number

  constructor(name: string, price: number) {
    this.name = name
    this.price = price
  }
}


@Entry
@ComponentV2
struct ComponentQuestionCase1 {
  @Provider('totalMoney') money: number = 50000
  @Provider('Car') Car: ICar = new ICar('保时捷', 1000000)
  @Provider() showContent:(val: string)=>void=(val:string)=>{
    console.log('showContent: ' + val)
  }

  build() {
    Column() {
      Text('father: ' + this.money)
      Button('存100块')
        .onClick(() => {
          this.money += 100
        })
      CompQsChild()
        .margin({ top: 20 })
      Child2()
    }
    .padding(20)
    .margin(30)
    .border({ width: 2 })
    .width('80%')
  }
}

@ComponentV2
struct CompQsChild {
  @Consumer('totalMoney') money: number = 0

  build() {
    Column() {
      Text('child儿子: ' + this.money)
      Button('花100块')
        .onClick(() => {
          this.money -= 100
        })
      ChildChild()
        .margin({ top: 20 })
    }
    .padding(20)
    .backgroundColor(Color.Pink)
  }
}

@ComponentV2
struct ChildChild {
  @Consumer('totalMoney') money: number = 0
  @Consumer() Car: ICar = new ICar('奔驰', 100)

  build() {
    Column() {
      Text('ChildChild孙子: ' + this.money)
      Text('ChildChild孙子: ' + this.Car.name)
      Text('ChildChild孙子: ' + this.Car.price)
      Button(`花${this.money}元`)
        .onClick(() => {
          this.money -= 100
          this.Car.price -= 10000
          this.Car.name = ' 玛莎' // 不生效 没有追踪
        })
    }
    .padding(20)
    .backgroundColor(Color.Orange)
  }
}

@ComponentV2
struct Child2 {
  @Consumer() showContent: (val: string) => void = (val
  : string
  )=>{
}
@Local text :string='hello'
  build() {
    Column(){
      TextInput({text:this.text})
        .onChange((val)=>{
          this.showContent(val)
        })
    }
  }
}