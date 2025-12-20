cmake_minimum_required(VERSION 3.20)
project(KotonoExtensions LANGUAGES C CXX)

if (MSVC)
    # Enable SDL security checks
    add_compile_options(/sdl)
    # Enable multi-core compilation
    add_compile_options(/MP)
endif()

add_library(KotonoExtensions INTERFACE)

target_compile_features(KotonoExtensions INTERFACE cxx_std_20)

# Core extensions
add_subdirectory(Core/TestExtension)

target_link_libraries(KotonoExtensions INTERFACE 
    KotonoCoreTestExtension
)

# Editor extensions
if (WITH_EDITOR)
    add_subdirectory(Editor/TestExtension)

    target_link_libraries(KotonoExtensions INTERFACE 
        KotonoEditorTestExtension
    )
endif()

