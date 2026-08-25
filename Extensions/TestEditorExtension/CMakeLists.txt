cmake_minimum_required(VERSION 4.2)
project(KotonoTestEditorExtension LANGUAGES C CXX)

add_library(KotonoTestEditorExtension STATIC)

target_compile_features(KotonoTestEditorExtension PUBLIC cxx_std_23)

set_target_properties(KotonoTestEditorExtension PROPERTIES FOLDER "KotonoTemplateProject/Extensions")

set(KTESTEDITOREXTENSION_HEADERS
    "include/kotono_extension_testeditorextension/test.h"
)
set(KTESTEDITOREXTENSION_SOURCES
    "src/test.cpp"
)

target_sources(KotonoTestEditorExtension
    PRIVATE ${KTESTEDITOREXTENSION_HEADERS}
    PRIVATE ${KTESTEDITOREXTENSION_SOURCES}
)

# Include directories
target_include_directories(KotonoTestEditorExtension
    PUBLIC  "${CMAKE_CURRENT_SOURCE_DIR}/include"
    PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/include/kotono_extension_testeditorextension"
)

# Link libs
target_link_libraries(KotonoTestEditorExtension PUBLIC
    KotonoEditor
)
