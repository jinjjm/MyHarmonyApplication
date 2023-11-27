@Entry
@Component
struct MainPage {
  @State title: string = '首页'


  // 标题
  @Builder MainPageTitle(text: string, size: number) {
    Text(text)
      .fontSize(size)
      .fontWeight(FontWeight.Bold)
      .textAlign(TextAlign.Start)
      .width('100%')
      .padding('1%')
  }
  // 轮播图

  // 功能组件

  // 列表卡片

  // 导航栏
  @State currentTabIndex: number = 0

  @Builder
  bar(name: string, icon: Resource, selected_icon: Resource, index: number) {
    Flex({
      direction: FlexDirection.Column,
      alignItems: ItemAlign.Center,
      justifyContent: FlexAlign.Center
    }) {
      Image(this.currentTabIndex === index ? selected_icon : icon)
        .width(24)
        .height(24)
      Text(name).fontSize(11).fontColor(0x3E3E3E).margin(10)
    }
  }

  build() {
    Column() {
      Tabs() {
        TabContent() {
          Column() {
            this.MainPageTitle('首页', 30)
            this.MainPageTitle('列表', 20)
          }.height('100%')
        }.tabBar(this.bar('主页', $rawfile('shopping/home_normal.png'), $rawfile('shopping/home_selected.png'), 0))

        TabContent() {
          Column() {
            this.MainPageTitle('我的', 30)
          }.height('100%')
        }.tabBar(this.bar('主页', $rawfile('shopping/mine_normal.png'), $rawfile('shopping/mine_selected.png'), 1))
      }.barPosition(BarPosition.End).vertical(false)
      .onChange((index) => {
        this.currentTabIndex = index
      })

    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.page_background_color'))
  }
}