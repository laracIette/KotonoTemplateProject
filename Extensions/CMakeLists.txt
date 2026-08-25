cmake_minimum_required(VERSION 4.2)
project(KotonoExtensions LANGUAGES C CXX)

add_library(KotonoExtensions INTERFACE)

target_compile_features(KotonoExtensions INTERFACE cxx_std_23)

# Core extensions
add_subdirectory(TestCoreExtension)

target_link_libraries(KotonoExtensions INTERFACE
    KotonoTestCoreExtension
)

# Editor extensions
if (WITH_EDITOR)
    add_subdirectory(TestEditorExtension)

    target_link_libraries(KotonoExtensions INTERFACE
        KotonoTestEditorExtension
    )
endif()

