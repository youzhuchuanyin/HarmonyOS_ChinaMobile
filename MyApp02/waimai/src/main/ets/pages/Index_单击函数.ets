//JS经典语法：
function add(a: number, b: number): number {
  return a + b
}

let sum = add(1, 2)
console.log(`${1}+${2}=${sum}`)
console.log('1+2=' + sum)
//强转 string(1)

//ES2015语法把function变成了=>
//匿名函数
/*(a:number,b:number):number = > {
return a+b
}*/
//给匿名函数加名称
let fuc = (a: number, b: number) => {
  return a + b
}
console.log(`3+4=${fuc(3, 4)}`)


function fun2(e:ClickEvent){
  console.log('hi')
}
@Entry
@Component
struct page8 {
  build() {
    Column() {
      Button('计算数字和').onClick((event: ClickEvent) => { //事件处理函数用箭头方式的匿名函数
        //而且居然可以省略event的类型
        console.log(`1+4=5`)
      }).margin(10)
      Button('计算数字和').onClick((event) => { //事件处理函数用箭头方式的匿名函数
        //而且居然可以省略event的类型
        console.log(`省略掉event啦`)
      }).margin(10)
      Button('计算数字和').onClick(e => //事件处理函数用箭头方式的匿名函数
        //而且居然可以省略event的类型，以及括号（当只有一个参数时），以及大括号（当主体只有一句话）
        //甚至 直接把e改成_
        console.log(`全部省略掉啦`)
      ).margin(10)
      Button('计算数字和2').onClick(fun2)
    }
  }
}