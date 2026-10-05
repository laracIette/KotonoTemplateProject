cmake_minimum_required(VERSION 4.2)
project(KotonoExtensions LANGUAGES C CXX)

# Core extensions
add_subdirectory(TestCoreExtension)

# Editor extensions
if (WITH_EDITOR)
    add_subdirectory(TestEditorExtension)
endif()

add_subdirectory(TestApplication)
