#include "napi/native_api.h"
#include <cstdint>
#include <cstdio>

static napi_value Add(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);

    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);

    napi_valuetype valuetype1;
    napi_typeof(env, args[1], &valuetype1);

    double value0;
    napi_get_value_double(env, args[0], &value0);

    double value1;
    napi_get_value_double(env, args[1], &value1);

    napi_value sum;
    napi_create_double(env, value0 + value1, &sum);

    return sum;

}
//获得三个数的和
static napi_value F1(napi_env env,napi_callback_info info){
    size_t argc=3;
    napi_value argv[3]={nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    int n0,n1,n2;
    napi_get_value_int32(env, argv[0], &n0);
    napi_get_value_int32(env, argv[1], &n1);
    napi_get_value_int32(env, argv[2], &n2);
    
    napi_value sum;
    napi_create_int32(env, n0+n1+n2, &sum);
    return sum;
}
//获得两个浮点数的平均值
static  napi_value F2(napi_env env ,napi_callback_info info){
    //1.把arkts得到的数据放进来
    size_t argc=2;
    napi_value argv[2]={nullptr};
    napi_get_cb_info(env,info, &argc, argv, nullptr, nullptr);
    //2.把数据转换成c的类型
    double  n0,n1;
    napi_get_value_double(env, argv[0], &n0);
    napi_get_value_double(env, argv[1], &n1);
    //3.luoji
    double result=(n0+n1)/2;
    //4.再转回arkts的类型
    napi_value res;
    napi_create_double(env, result,&res);
    return res;
}
//例如：f1('Tom', 'Jerry') => 'Tom&Jerry'
static napi_value F3(napi_env env,napi_callback_info info){
    size_t argc=2;
    napi_value argv[2]={nullptr};
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    
    size_t len0=sizeof(argv[0]);
    char n0[len0+1];
    napi_get_value_string_utf8(env, argv[0], n0, len0+1, &len0);//转化第一个字符串
    size_t len1=sizeof(argv[1]);
    char n1[len1+1];
    napi_get_value_string_utf8(env, argv[1], n1, len1+1, &len1);
    /*size_t len0;       //第1个实参字符串的长度
    napi_get_value_string_utf8(env, argv[0], nullptr, 0, &len0);    //试着解析第1个实参字符串，不要内容，只要长度
    char n0[len0+1];      //第1个实参字符串的内容，结尾要添加\0表字符串结束
    napi_get_value_string_utf8(env, argv[0], n0, len0+1, &len0);  //正式解析第1个实参字符串，获取内容
    
    size_t len1;       //第1个实参字符串的长度
    napi_get_value_string_utf8(env, argv[1], nullptr, 0, &len1);    //试着解析第1个实参字符串，不要内容，只要长度
    char n1[len1+1];      //第1个实参字符串的内容，结尾要添加\0表字符串结束
    napi_get_value_string_utf8(env, argv[1], n1, len1+1, &len1);  //正式解析第1个实参字符串，获取内容*/
    
    char finalStr[len0+1+len1+1];//中间想加&，最后要加\0
    sprintf(finalStr,"%s&%s",n0,n1);//第二个参数是拼接规则
    
    napi_value result;
    napi_create_string_utf8(env, finalStr, len0+1+len1, &result);
    return result;
}
//获得一个数组,数组里是不固定几个学生的成绩。我们要得到成绩的平均值
static napi_value F4(napi_env env,napi_callback_info info){
    size_t argc=1;
    napi_value argv=nullptr;//argv就是从前端得到的数组 以一抵多
    napi_get_cb_info(env,info, &argc, &argv, nullptr,nullptr);
    
    //得到数组的长度
    uint32_t length;
    napi_get_array_length(env, argv, &length);
    //把数组从argc里一个一个整理出来
    double arr[length];
    for (uint32_t i=0; i<length; i++) {
        double  ele;
        napi_value eleFromUI;
        napi_get_element(env, argv, i, &eleFromUI);
        napi_get_value_double(env, eleFromUI,&ele);
        arr[i]=ele;
    }
    
    double  sum=0;
    for (int i=0; i<length; i++) {
        sum+=arr[i];
    }
    double avera=sum/length;//平均值
    
    napi_value result;
    napi_create_double(env, avera,&result);
    return result;
}
//获得一个object，这个object里有sname,chinese,math,english.我们计算这个学生的总成绩
static  napi_value F5(napi_env env,napi_callback_info info){
    size_t argc=1;
    napi_value argv=nullptr;
    napi_get_cb_info(env, info, &argc, &argv,nullptr,nullptr);
    
    napi_value chineseproperty,mathproperty,englishproperty;//sname要的没用，就不要了
    napi_get_named_property(env, argv,"chinese", &chineseproperty);
    napi_get_named_property(env, argv,"math", &mathproperty);
    napi_get_named_property(env, argv,"english", &englishproperty);
    double  chinese,math,english;
    napi_get_value_double(env, chineseproperty, &chinese);
    napi_get_value_double(env, mathproperty, &math);
    napi_get_value_double(env, englishproperty, &english);
    
    double  sum=chinese+english+math;
    napi_value result;
    napi_create_double(env, sum, &result);
    return result;
}
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "add", nullptr, Add, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "f1", nullptr, F1, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "f2", nullptr, F2, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "f3", nullptr, F3, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "f4", nullptr, F4, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "f5", nullptr, F5, nullptr, nullptr, nullptr, napi_default, nullptr },
        
        
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
