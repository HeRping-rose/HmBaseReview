import { promptAction } from '@kit.ArkUI'

@ObservedV2
class Hero{
  //属性要追踪
  @Trace name: string
  @Trace age: number

  constructor(name: string, age: number) {
    this.name = name
    this.age = age
  }




}

@Entry
@ComponentV2
struct Index {
  @Local count: number = 100
  @Local username: string = ""
  @Local password: string = ""
  @Local heroList: Hero[] = [
    new Hero('魏', 18),
    new Hero('蜀', 18),
    new Hero('吴', 18),

    ]


  build() {
    Column(){
      Column({ space: 20 }) {
        Image('https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png')
          .width(180)
        TextInput({ placeholder: '请输入用户名', text: this.username })
          .height(40)
          .onChange((value: string) => {
            this.username = value
          })
        TextInput({ placeholder: '请输入密码', text: this.password })
          .height(40)
          .type(InputType.Password)
          .onChange((value: string) => {
            this.password = value
          })
        Button("登录")
          .width('100%')
          .onClick(() => {
            if (this.username === 'admin' && this.password === '123456') {
              promptAction.openToast({
                // message: this.username + this.password
                message: '登录成功'
              })
            }
            else {
              promptAction.openToast({
                message: '登录失败'
              })
            }
          })
      }
      .padding({
        left: 20,
        right: 20
      })
      .width('100%')


      //加减数字
      Row() {
        Button('-').onClick(() => {
          this.count--
        })

        Text(this.count.toString())
          .fontSize(30)
          .margin(10)

        Button('+').onClick(() => {
          this.count++
        })
      }

      Column({ space: 10}){
        ForEach(this.heroList, (item: Hero) => {
          heroItem({item: item})
        })
      }
    Row(){
      Image('/assets/jjy.jpg').width(100)
      Image($r('app.media.startIcon')).width(100)
      Image($rawfile('jjy.jpg')).width(100)
    }
    Row(){
        Image($r('app.media.cart')).width(100)
          .fillColor('#ff80c4cd')// 或者更改svg图片的fill属性
    }



    }

  }
}

@ComponentV2
struct heroItem  {
  @Param item:Hero=new Hero("",0)
  build() {
    Row({space:10}) {
      Text(this.item.name)
      Text(this.item.age.toString())
      Button("add").onClick(() => {
        this.item.age++
      })
    }
  }
}