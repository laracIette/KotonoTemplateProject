cmake_minimum_required(VERSION 3.20)
project(KotonoTemplateProject LANGUAGES C CXX)

# --- Global settings ---
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# --- Enable multithreaded compilation on MSVC ---
if (MSVC)
    add_compile_options(/MP)
    add_compile_options(/sdl)
endif()

# --- Editor option (propagates to child targets) ---
option(WITH_EDITOR "Build the Kotono Editor" ON)
message(STATUS "WITH_EDITOR is set to ${WITH_EDITOR}")

# --- Retrieve user engine path ---
set(ENGINE_PATH "" CACHE PATH "The path to your Kotono Engine installation")
message(STATUS "ENGINE_PATH is set to ${ENGINE_PATH}")

# --- Add all modules (subprojects) ---
add_subdirectory("${ENGINE_PATH}" "${CMAKE_CURRENT_BINARY_DIR}/KotonoEngine")
add_subdirectory(TestApplication)
add_subdirectory(Extensions)
