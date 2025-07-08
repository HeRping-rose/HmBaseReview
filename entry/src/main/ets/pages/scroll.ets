@Entry
@Component
struct Index {
  scroller: Scroller = new Scroller();
  build() {
    Column() {
      Row() {
        Scroll(this.scroller) {
          Row({ space: 10 }) {
            Mv()
            Mv()
            Mv()
            Mv()
            Mv()
            Mv()
            Mv()
          }

        }
        .scrollable(ScrollDirection.Horizontal)
        .scrollBar(BarState.Off)


      }
      .width('100%')
      .border({ width: 1, color: '#ffa58e8e', style: BorderStyle.Solid })
      .padding(10)

      Button("toRight")
        .onClick(() => {
          this.scroller.scrollEdge(Edge.End)
        })
    }


  }
}

@Component
struct Mv {
  build() {
    Column(){
      Image('http://imgsou.dangbei.com/images/yy/20190109/5c357219d9a56.jpg!300')
        .height(100)
      Text("电影名")
    }

  }
}