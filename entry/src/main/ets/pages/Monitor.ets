import { promptAction } from '@kit.ArkUI'

/*
 * 复杂数据类型 监测 配合@ObersedV2 @Trace 使用
 * */
@ObservedV2
class Person{
  @Trace name: string = ""
  age: number = 0
  constructor(name: string, age: number) {
    this.name = name
    this.age = age
  }
  @Monitor("name")
  onChangeName(monitor:IMonitor){
    console.log(`原来名字:${monitor.value()?.before}, 现在名字:${monitor.value()?.now}`)
  }
}

@Entry
@ComponentV2
struct Index {
  @Local text: string = "hello"
  @Local num: number = 0
  @Local person: Person = new Person("小苏", 18)
  // 检测属性 变化 num
  @Monitor("num")
  onlyChangeNum(){
    // console.log("num",this.num)
    if(this.num>=10){
      promptAction.openToast({message: "num>=10"})
    }
  }

  @Monitor("text","num")
  onlyChangeText(monitor:IMonitor){
    // console.log("text",this.text)
    // console.log("monitor",monitor)
    //monitor.dirty 用来记录这一次变化的那些属性名
    console.log("monitor", JSON.stringify(monitor.dirty))
    // console.log(`before: ${monitor.value("text")?.before} now: ${monitor.value("text")?.now}`)
    monitor.dirty.forEach(i=> {
      console.log(`before: ${monitor.value(i)?.before}  now:${monitor.value(i)?.now}`)
    } )
    if(['@','$','&'].some(i=>this.text.includes(i))){
      promptAction.openToast({message: "名字不合法 ,包含特殊符号"})
    }
  }

  @Monitor("person.name")
  onlyChangePersonName(monitor:IMonitor){
    console.log(`person.name:${monitor.value()?.before}, now:${monitor.value()?.now}`)
  }

  build() {
    Column(){
      Text("text:" + this.text )
      Text( "num:" + this.num)
      Button('changeNum').onClick(() => {
        this.num++
      })
      // 分割线
      Divider().strokeWidth(2)
      Button('changeText').onClick(() => {
        this.text="24678"
      })
      Text(this.person.name)
      Button('changePersonName').onClick(() => {
        this.person.name="小he"
      })
    }
  }
}