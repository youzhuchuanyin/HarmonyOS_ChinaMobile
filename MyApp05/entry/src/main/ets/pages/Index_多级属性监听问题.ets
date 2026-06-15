interface teacher{
  _num2:number
}
interface student{
  _num1:number
  _name:string
  _teacher:teacher
}
let n:number=0
@Entry
@Component
struct Index05{
  //@State _num0:number=0//0级属性
  //@State _student:student={_num1:15,_name:''}//_num1属于0级属性student的下属属性，也就是1级属性
  @State _student:student={
    _num1:15,_name:'',_teacher:{_num2:51}
  }//num2是2级属性。它将无法加加,如果想让它++，可以这样做⬇
  //定义一个变量n，它是0级属性，把_num2赋值给它，在函数里让它++，最后再赋值回去，注意是在一级变量里这样做
  build() {
    Column({space:5}) {
      Text('点击加一：'+this._student._teacher._num2).fontSize(50).onClick(_=>{
        n= this._student._teacher._num2
        n++
        //不行：this._student._teacher._num2=n
        this._student._teacher={_num2:n}
      })
    }
    .height(500)
    .width('100%')
    .backgroundColor('#ddffdd')
  }
}