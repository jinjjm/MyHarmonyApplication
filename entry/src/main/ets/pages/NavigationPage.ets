@Entry
@Component
struct NavigationPage {
  @State message: string = 'Hello World'
  @State bars: Array<{
    text: string,
    subtitle: string,
    num: number,
    img: Resource,
    content: Resource
  }> = [
    {
      text: '湖泊',
      subtitle: '帝心又细又长',
      num: 0,
      img: $r('app.media.nav_pic1'),
      content: $r('app.media.icon')
    },
    {
      text: '山川',
      subtitle: '全网最新',
      num: 1,
      img: $r('app.media.nav_pic2'),
      content: $r('app.media.icon')
    },
    {
      text: '云图',
      subtitle: '求三连',
      num: 2,
      img: $r('app.media.nav_pic3'),
      content: $r('app.media.icon')
    }
  ]
  @State index: number = 0

  build() {
    Row() {
      Column() {
        Row() {
          Text('标题--Navigation 组件 练习').fontSize(20).fontWeight(700)
        }.height('10%')

        Row() {
          // Text(this.message)
          //   .fontSize(30)
          //   .fontWeight(FontWeight.Bold)
          Navigation() {
            // Image(this.bars[this.index].img)
            //   .width(200)
            // Divider().margin(10)
            // Image(this.bars[this.index].content)
            //   .width(150)
            // flex
            // Version 7开始支持。后续版本如有新增内容则采用上角标单独标记该内容的起始版本。
            // Flex组件在渲染时存在二次布局过程，因此在对性能有严各要求的场景下建议使用Column、
            // Row代替Flex组件主轴默认不设置时撑满父容器Row组件主轴不设置时默认是跟随子节点大小。
            Flex({
              direction: FlexDirection.Row,
              // direction: FlexDirection.ColumnReverse,
              // justifyContent: FlexAlign.SpaceAround,
              // alignItems: ItemAlign.End,
              // wrap: FlexWrap.Wrap,//允许换行
              // alignContent: FlexAlign.End
            }) {
              Text('1').width('5%').height(50).backgroundColor(0xF5DEB3)
              Text('2').width('20%').height(60).backgroundColor(0xD2B48C)
              Text('3').width('30%').height(70).backgroundColor(0xF5DEB3)
              Text('4').width('15%').height(55).backgroundColor(0xD2B48C)
              Text('5').width('20%').height(60).backgroundColor(0xD2B48C)
              Text('6').width('30%').height(70).backgroundColor(0xF5DEB3)
              Text('7').width('15%').height(55).backgroundColor(0xD2B48C)
            }
            .height(160)
            .width('90%')
            .backgroundColor(0xAFEEEE)
          }
          .title(this.NavigationTitle())
          .hideTitleBar(false)
          .toolBar(this.NavigationToolbar())
        }
        .height('90%')

      }
      .width('100%')
    }
    .height('100%')
  }

  @Builder NavigationTitle() {
    Column() {
      // 计算逻辑应该分开
      Text(this.bars[this.index].text).fontSize(40).fontColor(Color.Brown)
      Text(this.bars[this.index].subtitle).fontSize(40).fontColor(Color.Orange)
    }
  }

  @Builder NavigationToolbar() {
    Row({space:10}) {
      ForEach(this.bars, (item, cIndex) => {
        Column() {
          // 计算逻辑应该分开
          Image(item?.img).width(40).height(40)
            .border(this.index === item.num ? { width: 2, color: Color.Red } : { width: 0 })
          Text(item?.text).fontSize(30).fontColor(
              this.index === item.num ? Color.Red : Color.Black
          )
        }
        .width('33%')
        .height(100)
        .onClick(() => {
          this.index = item?.num
        })
      }, (item) => JSON.stringify(item))
    }.justifyContent(FlexAlign.Center)
  }

}