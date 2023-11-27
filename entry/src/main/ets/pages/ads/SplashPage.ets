/**
 * app开屏广告页面
 */
import router from '@ohos.router'
@Entry
@Component
struct SplashPage {
  @State message: string = '这是一个广告'

  /**
   * 页面生命周期，即被@Entry装饰的组件生命周期，提供以下生命周期接口：
   - onPageShow：页面每次显示时触发。
   - onPageHide：页面每次隐藏时触发一次。
   - onBackPress：当用户点击返回按钮时触发。
   */
  onPageShow() {
    setTimeout(() => {
      router.pushUrl({ url: 'pages/LoginPage' })
    }, 1000)
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}