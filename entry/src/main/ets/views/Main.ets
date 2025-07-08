

@Preview
@Component
export default  struct Main {
  build() {
    Column(){
      Row({space: 10}){
        Column({space: 10}){
          Row()
            .width(50)
            .height(20)
            .backgroundColor('#ffdbabab')
          Row()
            .width(50)
            .height(20)
            .backgroundColor('#ffb8b2b2')
          Row()
            .width(50)
            .height(20)
            .backgroundColor('#ff8a7373')
        }.margin({top:10,bottom:10})
        Column()
          .width(30)
          .height(50)
          .backgroundColor('#ccc')
        Column()
          .width(30)
          .height(50)
          .backgroundColor('#ff928181')
        Column()
          .width(30)
          .height(50)
          .backgroundColor('#ffdbabab')
        Column({space: 10}){
          Row()
            .width(50)
            .height(20)
            .backgroundColor('#ffdbabab')
          Row()
            .width(50)
            .height(20)
            .backgroundColor('#ffb8b2b2')
          Row()
            .width(50)
            .height(20)
            .backgroundColor('#ff8a7373')
        }.margin({top:10,bottom:10})
      }
      .padding({left: 10, right: 10,top:10})


      Column(){
        Row(){
          // 层叠布局
          Stack({alignContent:Alignment.TopEnd}){
            Image($rawfile('logo.svg'))
              .width(150)
              .zIndex(1)
            Text("鸿蒙").fontSize(13)
              .zIndex(2)
              .translate({x: 14, y: -7})
          }
        }
        .justifyContent(FlexAlign.Center)
        .width('100%')
        Row(){
          TextInput({placeholder: '在Google中搜索,或输入网址'})
            .layoutWeight(1)
            .border({width: 1, color: '#ccc'})
            .borderRadius({topLeft: 22, bottomLeft: 22})
            .backgroundColor('#fff')

          Button("搜索")

            .height(42)
            .translate({x: -2})
            .backgroundColor('#fff')
            .border({width: {
              top: 1,
              bottom: 1,
              right: 1,
            }, color: '#ccc', style: BorderStyle.Solid})
            .borderRadius({topLeft: 0, bottomLeft: 0,topRight: 22,bottomRight: 22 })
            .fontColor('#333')

        }.margin({top:15,left:15,right:15})
      }
      Row(){
        Text('Flex推荐')
          .fontSize(26)
          .fontColor('#000')
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .margin({top:15})

      Flex({ wrap: FlexWrap.Wrap }){
        Text('今日推荐').fontColor('#000').backgroundColor('#ccc').margin(10)
        Text('今日推荐').fontColor('#000').backgroundColor('#ccc').margin(10)
        Text('今日推荐').fontColor('#000').backgroundColor('#ccc').margin(10)
        Text('今日推荐').fontColor('#000').backgroundColor('#ccc').margin(10)
        Text('今日推荐').fontColor('#000').backgroundColor('#ccc').margin(10)
        Text('今日推荐').fontColor('#000').backgroundColor('#ccc').margin(10)
        Text('今日推荐').fontColor('#000').backgroundColor('#ccc').margin(10)
        Text('今日推荐').fontColor('#000').backgroundColor('#ccc').margin(10)
      }

      // 网格
      Grid(){
        gridItem()
        gridItem()
        gridItem()
        gridItem()
        gridItem()
        gridItem()
      }
      .columnsTemplate('2fr 3fr 2fr')//列模板
      .columnsGap(5)//间隔
      .rowsGap(5)//间隔
      .width('100%')
      .height(70)

      //相对布局
      // Row(){
      //   Text('相对布局').fontColor('#000').fontSize(20).margin({left: 10})
      // }
      Row(){
        // Text("其他")

        RelativeContainer(){
            Row(){
              Text("消息").padding(10).backgroundColor('#ccc').borderRadius(10)
            }.id("msg")
            .margin({top: 5})

            Row(){
              Text("99").fontColor('#fff')
            }
            .backgroundColor('#ffee5252')
            .height(20)
            .borderRadius(10)
            .alignRules({
              // left middle right
              // top center bottom
              //以下设置的值，指的是 当前元素的某个点
              // 如 center代表当前我们要从 当前元素的中心点为基准
              // 去向 目标元素对齐
              middle: { anchor:'msg',align:HorizontalAlign.End},
              center: { anchor:'msg',align:VerticalAlign.Top}
            })
        }
      }.height(50).width('100%').backgroundColor('#ffe3c1c1')
    // 滚动

      Scroll(){
        Column(){
          myIterm()
          myIterm()
          myIterm()
          myIterm()
          myIterm()
          myIterm()

        }

      }.layoutWeight(1)
    }

  }
}

@Component
struct gridItem {
  build() {
    GridItem(){ Text('1').backgroundColor('#ccc').width('100%').height(30)
      .borderRadius(10).textAlign(TextAlign.Center)}
  }
}

@Component
struct myIterm {
  build() {
    Row(){
      Text('内容')
    }
    .width('100%')
    .height(30)
    .backgroundColor('#ccc')
    .margin(5)
    .borderRadius(10)
  }
}