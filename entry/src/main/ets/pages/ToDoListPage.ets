import CommonData from '../common/CommonData'
import router from '@ohos.router'
// let appName = router.getParams()['name']
import ToDoItem from '../view/ToDoItem'
import dataPreferences from '@ohos.data.preferences';

const PREFERENCES_NAME = 'myPreferences'; // 首选项名字
const KEY_APP_FONT_SIZE = 'appFontSize'; // 首选项Key字段

@Entry
@Component
struct ToDoListPage {
  // @State message: string = appName
  @State message: string = 'todolist'
  @State tasks: string[] = ['待完成']

  // 在组件加完成后，build构建之前执行
  aboutToAppear() {
    console.info('欢迎来到todolist')
    // 一般用来初始化数据的
    this.tasks = CommonData.TASKS
  }

  build() {
    Row() {
      Column({ space: 20 }) {
        // Button({ type: ButtonType.Capsule }) {
        //   Row() {
        //     // LoadingProgress().width(30).height(20).color(Color.Orange)
        //     Text('阿萨大大大')
        //       .fontColor(Color.White)
        //       .fontSize(20)
        //   }
        // }

        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(()=>{
            console.log('assssssssssssss')
          })
        Divider()
        ForEach(this.tasks, (item, index) => {
          ToDoItem({ context: item })
        }, (item) => JSON.stringify(item))

      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor(CommonData.INDEX_BGC)
  }
}