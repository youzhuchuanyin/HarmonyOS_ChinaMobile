#include "napi/native_api.h"//该头文件中定义了若干napi_*开头的新 数据类型 和 函数
//napi_value类型：指代一切ArkTs中的数据类型，到了c程序中需要使用特别的函数进行类型转换
//napi_env类型：c程序运行所处的上下文环境，类似于ArkTs中的Context
//napi_callback_info类型：指当前函数在ArkTs中被调用的情况
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
//声明一个供ArkTs调用的函数F1：接收三个正数作为参数，返回他们的和
napi_value F1(napi_env env, napi_callback_info info){
    //1.读取实参（只要UI界面使用了方法，那它必然会传回实参的，在这里也称回调）
    //-,-,参数个数，参数数组，null，null
    size_t argc=3;
    napi_value argv[3]={};//我试一下不写nullptr会怎样
    napi_get_cb_info(env, info, &argc, argv,nullptr,nullptr);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "add", nullptr, Add, nullptr, nullptr, nullptr, napi_default, nullptr }
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
    .nm_modname = "waimai",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterWaimaiModule(void)
{
    napi_module_register(&demoModule);
}
