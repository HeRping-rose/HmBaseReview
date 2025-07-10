

@Builder
function back(){
  SymbolGlyph($r('sys.symbol.ohos_trash'))
  .width(30)
  .height(30)
  .onClick(()=>{})
}
@Builder
function title(){
  Text("微信")
}
@Builder
function textInput(){
  TextInput({placeholder:"请输入标题"})
}

@Builder
function toggleSwitch(){
  Toggle({
    type: ToggleType.Switch,
    isOn:true,
  })
}
@Builder
function toggleCheckbox(){
  Toggle({
    type: ToggleType.Checkbox,
    isOn:true,
  })
}


@Builder
function img(){
  Image($r('sys.media.ohos_ic_public_arrow_left'))
    .width(30)
    .height(30)
    .onClick(()=>{})
}

@Builder
function slide(){
  Text('登录|注册')
    .width(100)
    .height(30)
    .onClick(()=>{})
}
@Builder
function search(){
  Row(){
    SymbolGlyph($r('sys.symbol.magnifyingglass'))
      .width(30)
      .height(30)
      .onClick(()=>{})
    SymbolGlyph($r('sys.symbol.plus'))
      .width(30)
      .height(30)
      .onClick(()=>{})
  }

}



export {back,title,textInput,toggleSwitch,toggleCheckbox,img,slide,search}