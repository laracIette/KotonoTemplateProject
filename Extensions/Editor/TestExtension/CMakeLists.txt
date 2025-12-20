cmake_minimum_required(VERSION 3.20)
project(KotonoEditorTestExtension LANGUAGES C CXX)

if (MSVC)
    # Enable SDL security checks
    add_compile_options(/sdl)
    # Enable multi-core compilation
    add_compile_options(/MP)
endif()

# Static library
add_library(KotonoEditorTestExtension STATIC)

# Require C++20
target_compile_features(KotonoEditorTestExtension PUBLIC cxx_std_20)

set_target_properties(KotonoEditorTestExtension PROPERTIES FOLDER "KotonoTemplateProject/Extensions/Editor")

set(KEDITORTESTEXTENSION_HEADERS
    "include/kotono_extension_editortestextension/test.h"
)
set(KEDITORTESTEXTENSION_SOURCES
    "src/test.cpp"
)

target_sources(KotonoEditorTestExtension 
    PRIVATE ${KEDITORTESTEXTENSION_HEADERS}
    PRIVATE ${KEDITORTESTEXTENSION_SOURCES}
)

# Include directories
target_include_directories(KotonoEditorTestExtension 
    PUBLIC  "${CMAKE_CURRENT_SOURCE_DIR}/include"
    PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/include/kotono_extension_editortestextension"
)

# Link libs
target_link_libraries(KotonoEditorTestExtension PUBLIC
    KotonoEditor
)
