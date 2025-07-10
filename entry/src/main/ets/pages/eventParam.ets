@Entry
@ComponentV2
struct D4_Demo {
  @Local words: string = 'admin'
  build() {
    Column({ space: 20 }) {
      HmInput({
        text: this.words!!

        // text: this.words,
        // $text:(value) => {
        //   this.words = value;
        // }
      })
      Text('输入框内容: ' + this.words)
    }
    .padding(20)
  }
}


@ComponentV2
struct HmInput {
  @Param text: string = ''
  @Event $text: (val: string) => void = (val: string) => {};
  build() {
    Column() {
      TextInput({
        text: this.text
      })
        .border({ width: 2, color: Color.Blue })
        .onChange((value) => {
          this.$text(value)
        })
    }
  }
}