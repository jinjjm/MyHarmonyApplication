@Entry
@Component
struct MyComponentPage {
  @State message: string = '待办事件'
  // 1、组件必须使用Component修饰
  // 2、@Entry 修饰哪个组件，哪个就显示在页面上，被修饰的称之为入口组件
  // 3、被entry修饰后，组件中 build() 必须有且仅有 一个根容器组件。其他 组件 build() 中有且只有一个根组件
  build() {
    // 必须有一个根组件
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        itemComponent({ content: '门前一座桥，桥下一只鸭。' })
        itemComponent({ content: '门前大桥下，游过一群鸭。' })

      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
struct itemComponent {
  // 传参
  // 默认私有化
  private content: string = '咿呀咿呀呦咿呀咿呀呦'
  // 驱动ui更新，被@state修饰的
  @State ischecked:boolean = false
  build() {
    Row() {
      Image(this.ischecked?$r('app.media.checked'):$r('app.media.unchecked'))
        .width(30)
        .height(30)
        .margin(10)
      Text(this.content)
        .fontSize(20)
        .fontWeight(600)
        .decoration({type:this.ischecked?TextDecorationType.LineThrough:TextDecorationType.None})
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
}