cmake_minimum_required(VERSION 3.20)
project(KotonoTestCoreExtension LANGUAGES C CXX)

if (MSVC)
    # Enable SDL security checks
    add_compile_options(/sdl)
    # Enable multi-core compilation
    add_compile_options(/MP)
endif()

# Static library
add_library(KotonoTestCoreExtension STATIC)

target_compile_features(KotonoTestCoreExtension PUBLIC cxx_std_23)

set_target_properties(KotonoTestCoreExtension PROPERTIES FOLDER "KotonoTemplateProject/Extensions")

set(KTESTCOREEXTENSION_HEADERS
    "include/kotono_extension_testcoreextension/test.h"
)
set(KTESTCOREEXTENSION_SOURCES
    "src/test.cpp"
)

target_sources(KotonoTestCoreExtension
    PRIVATE ${KTESTCOREEXTENSION_HEADERS}
    PRIVATE ${KTESTCOREEXTENSION_SOURCES}
)

# Include directories
target_include_directories(KotonoTestCoreExtension
    PUBLIC  "${CMAKE_CURRENT_SOURCE_DIR}/include"
    PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/include/kotono_extension_testcoreextension"
)

# Link libs
target_link_libraries(KotonoTestCoreExtension PUBLIC
    KotonoCore
)
