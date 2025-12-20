cmake_minimum_required(VERSION 3.20)
project(KotonoCoreTestExtension LANGUAGES C CXX)

if (MSVC)
    # Enable SDL security checks
    add_compile_options(/sdl)
    # Enable multi-core compilation
    add_compile_options(/MP)
endif()

# Static library
add_library(KotonoCoreTestExtension STATIC)

# Require C++20
target_compile_features(KotonoCoreTestExtension PUBLIC cxx_std_20)

set_target_properties(KotonoCoreTestExtension PROPERTIES FOLDER "KotonoTemplateProject/Extensions/Core")

set(KCORETESTEXTENSION_HEADERS
    "include/kotono_extension_coretestextension/test.h"
)
set(KCORETESTEXTENSION_SOURCES
    "src/test.cpp"
)

target_sources(KotonoCoreTestExtension 
    PRIVATE ${KCORETESTEXTENSION_HEADERS}
    PRIVATE ${KCORETESTEXTENSION_SOURCES}
)

# Include directories
target_include_directories(KotonoCoreTestExtension 
    PUBLIC  "${CMAKE_CURRENT_SOURCE_DIR}/include"
    PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/include/kotono_extension_coretestextension"
)

# Link libs
target_link_libraries(KotonoCoreTestExtension PUBLIC
    KotonoCore
)
