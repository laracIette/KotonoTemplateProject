cmake_minimum_required(VERSION 4.2)
project(KotonoTestEditorExtension LANGUAGES C CXX)

add_library(KotonoTestEditorExtension STATIC)

target_compile_features(KotonoTestEditorExtension PUBLIC cxx_std_23)

set_target_properties(KotonoTestEditorExtension PROPERTIES FOLDER "KotonoTemplateProject/Extensions")

set(KTESTEDITOREXTENSION_PUBLIC_HEADERS
    "Public/say_editor/say_editor.h"
)
set(KTESTEDITOREXTENSION_SOURCES
    "Private/say_editor/say_editor.cpp"
)

target_sources(KotonoTestEditorExtension
    PRIVATE
        ${KTESTEDITOREXTENSION_SOURCES}
    PUBLIC FILE_SET HEADERS
        BASE_DIRS Public
        FILES ${KTESTEDITOREXTENSION_PUBLIC_HEADERS}

)

target_include_directories(KotonoTestEditorExtension
    PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/Private"
)

target_link_libraries(KotonoTestEditorExtension PUBLIC
    KotonoApplication
)
