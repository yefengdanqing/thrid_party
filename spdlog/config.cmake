# include(${CMAKE_CURRENT_LIST_DIR}/../base.cmake)
set(THIRD_PARTY_PREFIX ${CMAKE_BINARY_DIR}/third_party)


# include(FetchContent)

# FetchContent_Declare(spdlog
#         GIT_REPOSITORY https://gitee.com/mai12/spdlog.git
#         GIT_TAG v1.4.1
        # SOURCE_DIR ${FMT_ROOT}
        # BINARY_DIR ${FMT_ROOT})

# FetchContent_MakeAvailable(spdlog)
# include_directories(${spdlog_SOURCE_DIR}/include)

include(ExternalProject)
message("start compile spdlog")

set(SPDLOG_ROOT ${CMAKE_BINARY_DIR}/third_party/spdlog)
set(SPDLOG_GIT_TAG  v1.4.1)  # 指定版本
set(SPDLOG_GIT_URL      https://github.com/gabime/spdlog.git)  # 指定git仓库地址
set(SPDLOG_CONFIGURE    cd ${SPDLOG_ROOT}/src/SDPLOG && cmake -DCMAKE_INSTALL_PREFIX=${SPDLOG_ROOT} .)  # 指定配置指令（注意此处修改了安装目录，否则默认情况下回安装到系统目录）
set(SPDLOG_MAKE         cd ${SPDLOG_ROOT}/src/SDPLOG && make)  # 指定编译指令（需要覆盖默认指令，进入我们指定的SPDLOG_ROOT目录下）
set(SPDLOG_INSTALL      cd ${SPDLOG_ROOT}/src/SDPLOG && make install)  # 指定安装指令（需要覆盖默认指令，进入我们指定的SPDLOG_ROOT目录下）
#为啥一定是大写呢
ExternalProject_Add(SDPLOG
        PREFIX            ${SPDLOG_ROOT}
        GIT_REPOSITORY    ${SPDLOG_GIT_URL}
        GIT_TAG           ${SPDLOG_GIT_TAG}
        CONFIGURE_COMMAND ${SPDLOG_CONFIGURE}
        BUILD_COMMAND     ${SPDLOG_MAKE}
        INSTALL_COMMAND   ${SPDLOG_INSTALL}
)





# set(SPDLOG_ROOT ${CMAKE_BINARY_DIR}/third_party/SPDLOG)
# set(SPDLOG_GIT_TAG  v1.4.1)  # 指定版本
# set(SPDLOG_GIT_URL      https://github.com/gabime/spdlog.git)  # 指定git仓库地址
# set(SPDLOG_CONFIGURE    cd ${SPDLOG_ROOT}/src/SPDLOG && cmake -D CMAKE_INSTALL_PREFIX=${SPDLOG_ROOT} .)  # 指定配置指令（注意此处修改了安装目录，否则默认情况下回安装到系统目录）
# set(SPDLOG_MAKE         cd ${SPDLOG_ROOT}/src/SPDLOG && make)  # 指定编译指令（需要覆盖默认指令，进入我们指定的SPDLOG_ROOT目录下）
# set(SPDLOG_INSTALL      cd ${SPDLOG_ROOT}/src/SPDLOG && make install)  # 指定安装指令（需要覆盖默认指令，进入我们指定的SPDLOG_ROOT目录下）

# ExternalProject_Add(SPDLOG
#         PREFIX            ${SPDLOG_ROOT}
#         GIT_REPOSITORY    ${SPDLOG_GIT_URL}
#         GIT_TAG           ${SPDLOG_GIT_TAG}
#         CONFIGURE_COMMAND ${SPDLOG_CONFIGURE}
#         BUILD_COMMAND     ${SPDLOG_MAKE}
#         INSTALL_COMMAND   ${SPDLOG_INSTALL}
# )



# 指定编译好的静态库文件的路径
set(SPDLOG_LIB       ${SPDLOG_ROOT}/lib/spdlog)
# 指定头文件所在的目录
set(SPDLOG_INCLUDE_DIR   ${SPDLOG_ROOT}/include)



include_directories(${SPDLOG_INCLUDE_DIR})
link_directories(${SPDLOG_LIB})
message("finish compile spdlog")