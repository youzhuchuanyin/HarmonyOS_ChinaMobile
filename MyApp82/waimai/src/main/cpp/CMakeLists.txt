# the minimum version of CMake.
#cmake工具版本最低得是
cmake_minimum_required(VERSION 3.5.0)
#定义目标项目
project(MyApp82)
#指定c/c++源码路径，名为NATIVERENDER_ROOT_PATH。它的值是变量CMAKE_CURRENT_SOURCE_DIR的值
set(NATIVERENDER_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})
#如果定了变量PACKAGE_FIND_FILE，就把它的值包含进c or c++文件中 老师讲的课貌似没有用到
if(DEFINED PACKAGE_FIND_FILE)
    include(${PACKAGE_FIND_FILE})
endif()

#告诉用户 被引用的.h文件放在哪里①放在当前目录下②放在当前目录下的include子目录下
include_directories(${NATIVERENDER_ROOT_PATH}
                    ${NATIVERENDER_ROOT_PATH}/include)

#指定生成该文件所需的源码文件napi_init.cpp。构建目标库文件：libwaimai.so,并添加。
add_library(waimai SHARED napi_init.cpp)
#指定 该库运行时，还需要链接的其他库 因为napi_env,napi_callback_info等等都是在底下这个库里声明的
target_link_libraries(waimai PUBLIC libace_napi.z.so)