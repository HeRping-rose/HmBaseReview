interface Person {
  name:string
  age:number
}



@Entry
@ComponentV2
struct Index {
  @Local name:string="ron"
  @Local age:number=18
  @Local bool:boolean=true
  // @Local arr1:Array<string>=["1","2","3"]
  @Local arr:string[]=["1","2","3"]
  @Local obj:Person={
    name:"ron",
    age:18
  }
  build() {
    Column(){
      Row(){
        Text("name:"+this.name)
        Text("age:"+this.age)
        Text("bool:"+this.bool)
        Text("arr:"+this.arr)
        Text("obj:"+this.obj.name+this.obj.age)
      }

      Row(){Button("change").onClick(()=>{
        this.name="ron2"
        this.age=19
        this.bool=false
      })
        Button("change2").onClick(()=>{
          this.arr.push("4")
          this.obj.name="ron3"
          this.obj.age=20
        })
        Button("change3").onClick(()=>{
          this.arr=["5","6","7"]
        })}
    }

  }
}