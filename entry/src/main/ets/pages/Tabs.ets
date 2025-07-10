import { errorBuilder, errorBuilder2 } from './builders/error'


interface TabInterface {
  icon: ResourceStr
  selectIcon: ResourceStr
  name: string
  title: string
}
// builder 构造器
@Entry
@ComponentV2
struct Index {
  @Local optionList:string[]=["A","B","C"]
  @Local errorType:string = "error"
  @Local errorTime:string = new Date().toLocaleString()
  @Local currentIndex:number=3

  @Local list: TabInterface[] = [{
    icon: $r("app.media.ic_public_message"),
    selectIcon: $r('app.media.ic_public_message_filled'),
    name: 'wechat',
    title: '消息',
  }, {
    icon: $r('app.media.ic_public_contacts_group'),
    selectIcon: $r('app.media.ic_public_contacts_group_filled'),
    name: 'connect',
    title: '联系人',
  }, {
    icon: $r('app.media.ic_gallery_discover'),
    selectIcon: $r('app.media.ic_gallery_discover_filled'),
    name: 'discover',
    title: '发现',
  }, {
    icon: $r('app.media.ic_public_contacts'),
    selectIcon: $r('app.media.ic_public_contacts_filled'),
    name: 'my',
    title: '我的',
  }]
  // @Styles  只封装样式

  // 对比自定义组件 构建函数是没有状态的,只包含结构和样式
  @Builder //构建函数  封装一块(结构组件和一定样式)  在任意的位置调用
  optionBuilder(name: string) {
    Text(name)
      .width('100%')
      .height(50)
      .backgroundColor('#ccc')
      .padding(10)
  }


  // tab单个组件框架封装
  @Builder
  tabItem(item:TabInterface){
    Column(){
      Image(this.list[this.currentIndex].name==item.name?item.selectIcon: item.icon)
        .height(30)
        .width(30)
        .fillColor('#5b650b9d')
      Text(item.title)
        .fontColor(this.list[this.currentIndex].name==item.name?'#5b650b9d': '#5ba38db1')
    }
    // .backgroundColor('#ccc')
  }

  build() {
    Column({space: 10}){
      option()
      option()
      // this.optionBuilder()
      ForEach(this.optionList, (item:string) => {
        this.optionBuilder(item)
      })

      error() // 实例化error组件

      errorBuilder("打印错误",new Date().toLocaleString())
      errorBuilder(this.errorType,new Date().toLocaleString())
      //引用类型可以修改数据 普通类型不能修改数据
      errorBuilder2({nick:this.errorType, date:this.errorTime })
      Button("点击更换错误").onClick(() => {
        this.errorType = "日志错误"
        this.errorTime = new Date().toLocaleString()
      })

      //布局之选项卡Tabs
      Tabs({index:$$this.currentIndex}){
        ForEach(this.list, (item:TabInterface) => {
          TabContent(){
            //todo 添加内容 实现不同结构
            Column(){
              if(item.name=="wechat"){
                Text("列表")
              }else if(item.name=="connect"){
                Text("通讯录")
                Text('好友列表')
              }else if(item.name=="discover"){

                Text("朋友圈")
                Image('/assets/jjy.jpg').width(200).height(200)
              }else {
                // Text("个人中心")
                Row(){
                  Text("个人中心")
                  Text("我的")
                }
                .width('100%')
                .justifyContent(FlexAlign.SpaceBetween)
              }
            }

            // Text(item.name)

          }
          .tabBar( this.tabItem(item))
        })
        // TabContent(){Text("首页")}.tabBar("首页")
        // TabContent(){Text("消息")}.tabBar("消息")
        // TabContent(){Text("我的")}.tabBar("我的")
      }
      .vertical(true)//垂直
      .scrollable(true)//滑动
      .barPosition(BarPosition.Start)//结束位置
      .layoutWeight(1)
    }
    .margin({left: 10, right: 10})
  }
}

//组件封装
@ComponentV2
struct option {
  // 可以带状态的组件
  build() {
    Text("选项卡")
      .width('100%')
      .height(50)
      .backgroundColor('#ccc')
      .padding(10)
  }
}

@Builder
function error(){
  Row(){
    Row(){
      Text("错误")
      Text("2025-7-10")
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
  }
}

