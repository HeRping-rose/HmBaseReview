/*
 *
 *
 *
 * */
@Entry
@ComponentV2
struct Index {
  @Local isShow: boolean = false
  @Local isShow2: boolean = false
  @Local enableHoverMode: boolean = true;
  @Local hoverModeArea: HoverModeAreaType = HoverModeAreaType.TOP_SCREEN;
  @Local list: ResourceStr[] = [
    "assets/1.webp",
    "assets/2.webp",
    "assets/3.webp",
    "assets/4.webp",
    "assets/5.webp",
    "assets/6.webp",
    "assets/7.webp",
    "assets/8.webp",
    "assets/9.webp",
    "assets/10.webp",
    "assets/11.webp",
  ]
  @Local selectedList: ResourceStr[] = []
  @Local currentSelectedImage: ResourceStr = ""

  build() {
    Column() {
      Grid() {
        ForEach(this.selectedList, (item: ResourceStr, index) => {
          GridItem() {
            Stack({ alignContent: Alignment.BottomEnd }) {
              Image(item)
                .fillColor('#ccc')
                .backgroundColor('#ffc4c1c1')
                .onClick(() => {
                  // 点击时删除
                  // this.selectedList = this.selectedList.filter( (i) => i !== item)
                  this.currentSelectedImage = item // 记录当前点击的图片
                  //点击放大
                  this.isShow2 = true
                })
                .bindContentCover(this.isShow2, this.PopBox2())
            }
          }
          .aspectRatio(1)
        })
        GridItem() {
          selectBtn()
        }
        .aspectRatio(1) //宽高比例1:1
        //弹窗 第三个参数option 对象{ height:''}
        .bindSheet($$this.isShow, this.PopBox(), {
          height: '70%',
          backgroundColor: '#ffe2dfdf',
          preferType: SheetType.CENTER,
          showClose: false,
        })
        .onClick(() => {
          this.isShow = true
        })

      }
      .columnsGap(5)
      .rowsGap(5)
      .columnsTemplate('1fr 1fr 1fr')
    }
    .layoutWeight(1)
  }

  @Builder
  PopBox() {
    // Text('弹出内容') //替换为自定义组件
    selectBox({
      list: this.list,
      selectedList: this.selectedList!!, //双感叹号
      isShow: this.isShow!!,
    })
  }

  @Builder
  PopBox2() {
    // Text('弹出内容') //替换为自定义组件
    Column() {
      Stack({ alignContent: Alignment.TopStart }) {
        // Image(item)
        Image(this.currentSelectedImage)
          .onClick(() => {
            // this.isShow2 = false
          })
        // .zIndex(2)
        Image($r('sys.media.ohos_ic_public_close'))
        // .zIndex(1)
          .width(20)
          .height(20)
          .backgroundColor('#ffcd2424')
          .onClick(() => {
            this.isShow2 = false
          })
      }

    }
    .layoutWeight(1)
    .width('100%')
    .height('100%')
    .backgroundColor('#ccc')

    // selectBox({
    //   // list: this.list,
    //   // selectedList: this.selectedList!!, //双感叹号
    //   // isShow: this.isShow!!,
    // })
  }
}

@Builder
function selectBtn() {
  Column() {
    Image($r('sys.media.ohos_ic_public_add'))
      .height('100%')
      .width('100%')
  }
  .border({ width: 2, color: '#ff434040', style: BorderStyle.Dotted })
  .backgroundColor('#ccc')
}

@ComponentV2
struct selectBox {
  @Param list: ResourceStr[] = [] //接收传入参数
  @Local selectList: ResourceStr[] = []
  @Param selectedList: ResourceStr[] = []
  @Event $selectedList: (val: ResourceStr[]) => void = (val: ResourceStr[]) => {
  }
  @Param isShow: boolean = false
  @Event $isShow: (val: boolean) => void = (val: boolean) => {
  }

  // 生命周期 组件创建好还没有渲染自谦
  aboutToAppear(): void {
    this.selectList = [...this.selectedList]
  }

  build() {
    Column() {
      Row() {
        Text('取消')
          .fontSize(20)
          .fontColor('#ff948d8d')
          .onClick(() => {
            this.$isShow(false) //关闭弹窗
          })
        Text("已选择" + this.selectList.length + "/9张")
        Text('确定')
          .fontSize(20)
          .fontColor('#ff0000')
          .onClick(() => {
            this.$selectedList([...this.selectList]) //浅拷贝 收集的图片
            this.$isShow(false) //关闭弹窗 与父传递的isShow一致
          })
      }
      .width('100%')
      .padding(10)
      .justifyContent(FlexAlign.SpaceBetween)

      Grid() {
        ForEach(this.list, (item: ResourceStr, index) => {
          GridItem() {
            Stack({ alignContent: Alignment.BottomEnd }) {
              if (this.selectList.includes(item)) {
                Image($r('sys.media.ohos_ic_public_select_all'))
                  .height(30)
                  .width(30)
                  .fillColor('#ccc')
                  .backgroundColor('#ffbe9e9e')
                  .zIndex(2)
              }
              Image(item)
                .height('100%')
                .width('100%')
                .borderRadius(5)
                .backgroundColor('#fff')
                .zIndex(1)

            }
          }.aspectRatio(1) //宽高比例1:1
          .onClick(() => {
            // this.selectList.push(item)//

            // 二次选择取消选择
            if (this.selectList.includes(item)) {
              this.selectList = this.selectList.filter((i) => i !== item)
            } else {
              this.selectList.push(item)
            }
          })

        })
      }
      .columnsGap(10) //列间距
      .rowsGap(10)
      .columnsTemplate('1fr 1fr 1fr') //3列
    }
    .layoutWeight(1)
  }
}

























