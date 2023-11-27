/**
 * 应用入口文件
 * 1、外部资源应该放置在rawfile下，可以新建文件夹、新建文件；不能在media下新建文件夹
 */
import router from '@ohos.router'

@Entry // 呈现哪个组件内容
@Component // 组件，万物皆组件
  // 结构体
struct Index {
  @State message: string = 'Hello World'
  // 哈哈哈哈，哈哈哈哈
  // @State date: string = '2023-11-21下'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50) // 右侧动态执行，插座->可以动态刷新；；Tt双向调试
          .fontWeight(FontWeight.Bold)
        // Text(this.date)
        //   .fontSize(50)
        //   .fontWeight(FontWeight.Bold)


        Image($r('app.media.nav_pic2'))
          .height('15%')
          .margin('2%')

        // 添加按钮，以响应用户点击
        Button() {
          Text('Next')
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin({
          top: 20
        })
        .backgroundColor('#0D9FFB')
        .width('40%')
        .height('5%')
        .onClick(() => {
          console.info('点击跳转按钮')
          router.pushUrl({
            url: 'pages/Second'
          }).then(() => {
            console.info('跳转成功')
          }).catch((err) => {
            console.error('跳转失败')
          })
        })

        Divider().margin(10)
        Grid() {
          GridItem() {
            Column() {
              Image('https://img-prod-cms-rt-microsoft-com.akamaized.net/cms/api/am/imageFileData/RE4wqHU?ver=3bd5')
                .alt($r('app.media.icon')) //占位符
                .height('15%')
                  // .width('50%')
                .margin('2%')
                .padding('1%')

              Text('ToDoList').fontSize(20).fontColor(Color.Brown)
            }
            .onClick(() => {
              // 设置页面跳转之后需要刷新布局
              console.info('跳转todolist')
              router.pushUrl({
                url: 'pages/ToDoListPage',
                params: {
                  name: 'todo-list'
                }
              })
            })
          }

          GridItem() {
            Column() {
              Image($r('app.media.icon'))
                .height('15%')
                .margin('2%')
              Text('Navigation').fontSize(20).fontColor(Color.Brown)
            }.onClick(() => {
              router.pushUrl({
                url: 'pages/NavigationPage'
              })
            })
          }

          GridItem() {
            Column() {
              Image('https://img.51miz.com/preview/element/00/01/14/06/E-1140677-F06E9B97.jpg')
                .height('15%')
                .margin('2%')
              Text('健康饮食').fontSize(20).fontColor(Color.Brown)
            }
          }

          GridItem() {
            Column() {
              Image($rawfile('shopping/logo.png'))
                .height('15%')
                .margin('2%')
              Text('一个软件').fontSize(20).fontColor(Color.Brown)
            }.onClick(()=>{
              router.pushUrl({
                url:'pages/ads/SplashPage',
              })
            })
          }

        }.columnsTemplate('1fr 1fr')

        // Flex({
        //   wrap: FlexWrap.Wrap, //允许换行
        // }) {
        //   Column() {
        //     Image('https://img-prod-cms-rt-microsoft-com.akamaized.net/cms/api/am/imageFileData/RE4wqHU?ver=3bd5')
        //       .alt($r('app.media.icon')) //占位符
        //       .height('15%')
        //         // .width('50%')
        //       .margin('2%')
        //
        //     Text('ToDoList').fontSize(20).fontColor(Color.Brown)
        //   }
        //   .onClick(() => {
        //     // 设置页面跳转之后需要刷新布局
        //     console.info('跳转todolist')
        //     router.pushUrl({
        //       url: 'pages/ToDoListPage',
        //       params: {
        //         name: 'todo-list'
        //       }
        //     })
        //   })
        //
        //   Column() {
        //     Image($r('app.media.icon'))
        //       .height('15%')
        //       .margin('2%')
        //     Text('Navigation').fontSize(20).fontColor(Color.Brown)
        //   }.onClick(() => {
        //     router.pushUrl({
        //       url: 'pages/NavigationPage'
        //     })
        //   })
        //
        //   Column() {
        //     Image('https://img.51miz.com/preview/element/00/01/14/06/E-1140677-F06E9B97.jpg')
        //       .height('15%')
        //       .margin('2%')
        //     Text('健康饮食').fontSize(20).fontColor(Color.Brown)
        //   }
        // }

        // Divider().margin(10)


        // Image($rawfile('harmony.png'))//引用资源类型不能是中文
        //   .height('20%')
        //   .backgroundColor(Color.Red)
        //   .margin('2%')
      }
      .width('100%')
    }
    .height('100%')
  }
}