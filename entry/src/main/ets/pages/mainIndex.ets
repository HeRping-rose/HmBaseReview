import { Foot } from '../views/Foot'
import { Header } from '../views/Header'
import Main from '../views/Main'

@Entry
@Component
struct Index {
  build() {
    Column(){
      Header()

      Main()
        .layoutWeight(1)

      Foot()
    }


  }

}