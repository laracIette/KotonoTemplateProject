cmake_minimum_required(VERSION 4.2)
project(KotonoTestCoreExtension LANGUAGES C CXX)

add_library(KotonoTestCoreExtension STATIC)

target_compile_features(KotonoTestCoreExtension PUBLIC cxx_std_23)

set_target_properties(KotonoTestCoreExtension PROPERTIES FOLDER "KotonoTemplateProject/Extensions")

set(KTESTCOREEXTENSION_PUBLIC_HEADERS
    "Public/say_core/say_core.h"
)
set(KTESTCOREEXTENSION_SOURCES
    "Private/say_core/say_core.cpp"
)

target_sources(KotonoTestCoreExtension
    PRIVATE
        ${KTESTCOREEXTENSION_SOURCES}
    PUBLIC FILE_SET HEADERS
        BASE_DIRS Public
        FILES ${KTESTCOREEXTENSION_PUBLIC_HEADERS}

)

target_include_directories(KotonoTestCoreExtension
    PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/Private"
)

target_link_libraries(KotonoTestCoreExtension PUBLIC
    KotonoApplication
)
