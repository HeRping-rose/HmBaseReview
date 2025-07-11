


@Entry
@ComponentV2
struct Index {
  @Local content: string = 'hello world'

  build() {
    Column({ space: 5 }) {
      myInput({
        content: this.content
      , $content: (value: string) => {
          this.content = value
        }
      })
      myInput({
        content: this.content!!
        // V2语法 简写
        // !! 类似 ,$content:(value:string)=>{this.content = value }
      })
      Text(this.content)
        .height(30)
        .backgroundColor('#ccc')
    }
  }
}

@ComponentV2
struct myInput {
  /*@Event主要配合@Param实现数据的双向同步
   *@Event装饰回调方法是一种规范，表明子组件需要传入更新数据源的回调。
   *$content 是一个回调方法，接收一个参数value，用于更新数据源。

   */
  @Param content: string = ""
  @Event $content: (value: string) => void = (value: string) => {
  }

  build() {
    TextInput({ text: this.content })
      .onChange((value) => {
        this.$content(value)
      })
  }
}