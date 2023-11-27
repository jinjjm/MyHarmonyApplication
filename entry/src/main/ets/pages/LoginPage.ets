import router from '@ohos.router'
@Entry
@Component
struct LoginPage {
  @State message: string = 'Hello World'
  @State isShowProgress: boolean = false
  @State account:string = ''
  @State pwd:string = ''

  private timeOutId: number = -1;
  login():void{
    // this.isShowProgress = true
    if (this.timeOutId === -1) {
      this.timeOutId = setTimeout(() => {
        this.isShowProgress = false;
        this.timeOutId = -1;
        // router.replaceUrl({ url: 'pages/shop/MainPage' });//没有回退
        router.pushUrl({ url: 'pages/MainPage' });
      }, 1000);
    }
  }

  build() {
    Column() {
      Image($rawfile('shopping/logo.png')).width(100).height(100).margin({
        top: 60
      })
      Text('登录页面')
        .fontSize(30)
        .fontWeight(500)
        .margin(10)
      Text('登录账号使用更多服务')
        .fontSize(18)
        .fontColor(Color.Gray)

      TextInput({
        placeholder: '账户'
      })
        .Login_textinput()
        .type(InputType.Normal)
        .margin({
          top: 40
        })
        .onChange((value: string) => {
          this.account = value;
        })
      Line().Login_line()
      TextInput({
        placeholder: '密码'
      })
        .Login_textinput()
        .type(InputType.Password)
        .onChange((value: string) => {
          this.pwd = value;
        })
      Line().Login_line()

      Row() {
        Text('短信验证码').textStyle()
        Text('忘记密码').textStyle()
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
      .margin({ top: 8 })

      Button('登录')
        .width('80%')
        .margin({
          top: 30
        })
        .onClick(()=>{
          this.isShowProgress = !this.isShowProgress
          this.login()
        })
      Text('注册账户')
        .width('100%')
        .textAlign(TextAlign.Center)
        .textStyle()
      if (this.isShowProgress) {
        LoadingProgress()
          .color(Color.Orange)
          .width(200)
          .height('20%')
          .margin({
            top:20
          })
      }
      // 需要设置父容器的高度或者宽度才能使用空白填充组件
      Blank()

      Text('其他登录方式')
        .fontColor(Color.Gray)
        .fontSize(17)
        .textAlign(TextAlign.Center)
        .width('100%')
        .padding(10)
      Row() {
        this.imageButton($rawfile('shopping/login_method1.png'))
        this.imageButton($rawfile('shopping/login_method2.png'))
        this.imageButton($rawfile('shopping/login_method3.png'))
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
    .padding('3%')
  }

  @Builder imageButton(src: Resource) {
    Button({
      type: ButtonType.Circle
    }) {
      Image(src)
    }
    .width(40)
    .height(40)
    .backgroundColor(Color.Transparent)
  }
}

@Extend(TextInput) function Login_textinput() {
  .backgroundColor('#F1F3F5')
  .margin({ top: 20 })
}

@Extend(Line) function Login_line() {
  .width('100%')
  .height('2vp')
  .backgroundColor('#b8aeae')
}

@Extend(Text) function textStyle() {
  .margin({ top: 3 })
  .fontSize(16)
  .fontColor('#ff3990dd')
  .fontWeight(600)
}