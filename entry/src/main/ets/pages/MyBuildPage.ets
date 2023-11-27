/**
 * 14-自定义组件构造函数
 * 参数传递规则、
 * 自定义构建函数的参数传递有按值传递和按引用传递两种，均需遵守以下规则：
 - 参数的类型必须与参数声明的类型一致，不允许undefined、null和返回undefined、null的表达式。
 - 在自定义构建函数内部，不允许改变参数值。如果需要改变参数值，且同步回调用点，建议使用@Link。
 - @Builder内UI语法遵循UI语法规则。
 */

@Entry
@Component
struct MyBuildPage {
  @State message: string = 'Hello World'
  @State ischecked:boolean = false

  @Builder item(content:string) {
    Row() {
      Image(this.ischecked?$r('app.media.checked'):$r('app.media.unchecked'))
        .width(30)
        .height(30)
        .margin(10)
      Text(content)
        .fontSize(20)
        .fontWeight(600)
    }
    .backgroundColor(Color.Pink)
    .borderRadius(25)
    .margin({
      top: 15
    })
    .padding({
      right: 20
    })
    .onClick(()=>{
      // 驱动ui更新
      this.ischecked = !this.ischecked
    })
  }
  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        this.item('门前一座桥，桥下一只鸭。')
        item222('门前一座桥，桥下一只鸭。')
      }
      .width('100%')
    }
    .height('100%')
  }

}

@Builder function item222(content:string) {
  Row() {
    Image(this.ischecked?$r('app.media.checked'):$r('app.media.unchecked'))
      .width(30)
      .height(30)
      .margin(10)
    Text(content)
      .fontSize(20)
      .fontWeight(600)
  }
  .backgroundColor(Color.Pink)
  .borderRadius(25)
  .margin({
    top: 15
  })
  .padding({
    right: 20
  })
  .onClick(()=>{
    // 驱动ui更新
    this.ischecked = !this.ischecked
  })
}