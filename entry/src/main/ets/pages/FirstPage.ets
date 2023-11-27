@Entry
@Component
struct FirstPage {
  @State message: string = 'HarmonyOS4.0'
private selectedDate:Date = new Date('2023-11-9')
  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(35)
          .fontWeight(FontWeight.Bold)
        DatePicker({
          // selected:this.selectedDate,
          start:new Date('2022-05-05'),
          end:new Date('2024-12-10')
        })
          .onChange((value)=>{
            console.log(JSON.stringify(value));
            this.selectedDate.setFullYear(value.year,value.month,value.day)
          })
          // .lunar(true)
        // TimePicker().useMilitaryTime(true)
      //   navigation
        Navigation()
      }
      .width('100%')
    }
    .height('100%')
  }
}