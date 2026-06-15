//与服务器端API相关的常量
//感觉像JAVA呢
//static :在这里相当于后续可以不实例化 类就可以直接访问其中的属性
//readonly：就是c语言里的const呗

export class APIConstants{
    static readonly HOST= 'https://www.codeboy.com/chinamobileapi/'

  //接口1.1、猜你喜欢
  static readonly APP_RECOMMEND = APIConstants.HOST + 'index/appRecommend.do'

  //接口1.2、商品推荐
  static readonly QUERY_GOODS_INFO = APIConstants.HOST + 'index/query_goods_info.do'

  //接口1.3、优惠列表
  static readonly DISCOUNT_LIST = APIConstants.HOST + 'index/discountList'

  //接口2.1、用户注册
  static readonly REGISTER = APIConstants.HOST + 'user/register'

  //接口2.2、登录用验证码算式图片
  static readonly CAPTCHA = APIConstants.HOST + 'user/captcha.svg'

  //接口2.3、用户登录，方式1：短信随机码登录
  static readonly LOGIN_TXTMSG = APIConstants.HOST + 'user/login/txtmsg'

  //接口2.4、用户登录，方式2：客服密码登录
  static readonly LOGIN_SERVICEPWD = APIConstants.HOST + 'user/login/servicepwd'

  //接口2.5、用户登录，方式3：互联网用户登录（即邮箱和密码登录）
  static readonly LOGIN_EMAIL = APIConstants.HOST + 'user/login/email'

  //接口2.6、当前登录用户档案
  static readonly USER_PROFILE = APIConstants.HOST + 'user/profile'

  //接口2.7、用户列表
  static readonly USER_LIST = APIConstants.HOST + 'user/list'

  //接口2.8、修改当前登录用户头像
  static readonly UPDATE_AVATAR = APIConstants.HOST + 'user/update/avatar'

  //...

}
