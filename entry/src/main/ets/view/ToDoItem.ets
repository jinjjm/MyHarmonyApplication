/**
 * 组件
 */
@Component
export default struct ToDoItem {
  // private可加可不加
  context:string
  @State checked: boolean = false

  build() {
    Column() {
      Row({space:20}) {
        if (this.checked) {
          Image($r('app.media.checked')).todoItem_Image()
        } else {
          Image($r('app.media.unchecked')).todoItem_Image()
        }
        Text(this.context)
          .fontSize(25)
          .decoration({ type: this.checked ? TextDecorationType.LineThrough : TextDecorationType.None })
          .opacity(this.checked ? 0.5 : 1)
      }
      .backgroundColor(Color.White)
      .borderRadius(25)
      .width('90%')
      .height(50)
      .onClick(() => {
        this.checked = !this.checked
      })
    }
  }
}

@Extend(Image) function todoItem_Image() {
  .width(30)
  .height(30)
  .objectFit(ImageFit.Contain)
  .margin(10)
}