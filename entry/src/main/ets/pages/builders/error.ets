@Builder
function errorBuilder(a:string,b:string){
  Row(){
    Row(){
      Text(a)
      Text(b.toString())
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
  }
}

interface errorProps {
  nick:string,
  date:string
}

@Builder
function errorBuilder2(obj:errorProps){
  Row(){
    Row(){
      Text(obj.nick)
      Text(obj.date.toString())
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
  }
}
export { errorBuilder, errorBuilder2}