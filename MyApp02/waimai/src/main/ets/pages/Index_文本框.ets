@Component
@Entry
struct page9 {
  build() {

      Column() {
        //单行文本框
        TextInput({placeholder:'请输入手机号',text:'18898083348'})
          .type(InputType.PhoneNumber)
          .margin(10)
        //单行密码框
        TextInput({placeholder:'请输入密码'})
          .type(InputType.Password)
          .showPasswordIcon(true)
          .margin(10)
        //多行文本输入框
        TextArea({placeholder:'请留下您的宝贵意见'})
          .height(100)//当超过时会显示滚动条
          .margin(10)
          .maxLength(10)//超过这个数就不能继续敲了
      }

    }
  }