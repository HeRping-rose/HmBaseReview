
@ObservedV2
class Food {
  @Trace name: string
  @Trace price: number
  @Trace count: number
  @Trace selected: boolean
  constructor(name: string, price: number, count: number, selected: boolean=false) {
    this.name = name
    this.price = price
    this.count = count
    this.selected = false
  }
}


@Entry
@ComponentV2
struct Index {
  @Local foodList:Food[]=[
    new Food('苹果', 5, 3),
    new Food('香蕉', 8, 5),
    new Food('橘子', 3, 6)]
  @Local totalPrice: number = 0
  @Monitor('totalPrice')
  onChangeTotalPrice(monitor:IMonitor){
    console.log('totalPrice',monitor.value()?.now)
  }
  build() {
    Column(){
      Text('Order')
      List({space: 10}){
        ForEach(this.foodList, (item: Food, index) => {
          ListItem(){
            Column(){
              Row(){
                Row(){
                  Toggle({ type: ToggleType.Checkbox, isOn: item.selected })
                    .onChange((isOn: boolean)=>{
                      item.selected = !item.selected
                      // console.log(JSON.stringify(item))
                      if(item.selected){
                        this.totalPrice += item.price*item.count
                      }else{
                        this.totalPrice -= item.price*item.count
                      }


                    })
                  Text(item.name)
                }

                Text('单价:' + item.price)
                Row({space: 10}){

                  Text('数量:' + item.count)
                  Text('+')
                    .backgroundColor('#ccc ')
                    .onClick(() => {
                      item.count++
                    })
                  Text('-').backgroundColor('#ccc ')
                    .onClick(() => {
                      item.count--
                    })

                }
              }
              .width('100%')
              .justifyContent(FlexAlign.SpaceBetween)
            }

          }.backgroundColor('#ffbe95e5')
        })

      }.layoutWeight(1)
      .backgroundColor('#ccc')
      Row(){
        Text('总价:'+this.totalPrice)
        Button('结算')
          .enabled(this.totalPrice>=20)
      }.justifyContent(FlexAlign.SpaceBetween)
      .width('100%')

    }
  }
}