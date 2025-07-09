import { promptAction, PromptAction } from "@kit.ArkUI"


@Preview
@ComponentV2
export default  struct mList {
  @Local newsList:number[]=Array(20).fill(Date.now())
  @Local isLoading:boolean=false

  @Builder //让一个普通方法变成UI组件 的构建器
  loading(){
    Row(){
      Image($rawfile("logo.svg")).width(10).height(10)
      Text("isLoading...")
        .fontColor('#ccc')
    }
  }

  build() {
    // 下拉刷新
    Refresh({refreshing:$$this.isLoading,builder:this.loading()}){
      List(){
        ForEach(this.newsList, (item: number) => {
          ListItem(){
            Text(item.toString())
              .width('100%')
              .lineHeight(50)
              .border({
                color:"#ccc",
                width:{bottom:2},
              })

          }

        })
      }.onReachEnd(() => {
        console.log("onReachEnd")
        this.newsList.push(...Array(10).fill(Date.now()))
        promptAction.openToast({message:"loading 10 msg"})

        // this.isLoading=true
      })
    }
    .onRefreshing(()=>{
      setTimeout(()=>{
        // this.newsList=Array(20).fill(Date.now())
        // this.newsList=[...this.newsList,Date.now()]
        this.newsList.unshift(Date.now())//添加
        this.isLoading=false
      },1000)
    })




  }

}