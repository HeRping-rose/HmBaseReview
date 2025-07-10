
interface GoodItem {
  goods_name:string
  goods_img:string
  goods_price:number
  goods_count:number
  id: number
}

@Builder
function listItem1(item:GoodItem){
  Row(){
    Image(item.goods_img).width(100)
    Column(){
      Text(item.goods_name)
      Row(){
        Text(item.goods_price.toString())
          .fontColor('red')
        Text(item.goods_count.toString())
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceAround)
    }
    .justifyContent(FlexAlign.End)
  }
}

@Builder
function listItem2(item:GoodItem){
  Row(){
    Column(){
      Text(item.goods_name)
      Row(){
        Text(item.goods_price.toString())
          .fontColor('red')
        Text(item.goods_count.toString())
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceAround)
      Image(item.goods_img).width(100)
    }
    .justifyContent(FlexAlign.End)
  }
}

export {listItem1,listItem2}