cmake_minimum_required(VERSION 4.2)
project(KotonoTestApplication LANGUAGES C CXX)

# --- MSVC settings ---
if (MSVC)
    add_compile_options(/sdl)
endif()

# ---- Create executable ---
add_executable(KotonoTestApplication)

# --- Enable C++20 ---
target_compile_features(KotonoTestApplication PRIVATE cxx_std_23)

set_target_properties(KotonoTestApplication PROPERTIES FOLDER "KotonoTemplateProject")

# --- Add source files ---
set(KTESTAPPLICATION_HEADERS
)
set(KTESTAPPLICATION_SOURCES
    "src/main.cpp"
)

target_sources(KotonoTestApplication
    PRIVATE ${KTESTAPPLICATION_HEADERS}
    PRIVATE ${KTESTAPPLICATION_SOURCES}
)

file(GLOB_RECURSE KTESTAPPLICATION_ASSETS CONFIGURE_DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/assets/*")
set_source_files_properties(${KTESTAPPLICATION_ASSETS} PROPERTIES HEADER_FILE_ONLY TRUE)
source_group(TREE "${CMAKE_CURRENT_SOURCE_DIR}/assets" PREFIX "Assets" FILES ${KTESTAPPLICATION_ASSETS})
target_sources(KotonoTestApplication PRIVATE ${KTESTAPPLICATION_ASSETS})

# --- Includes ---
target_include_directories(KotonoTestApplication
    PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/include"
    PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/include/kotono_testapplication"
)

# --- Link engine or editor ---
target_link_libraries(KotonoTestApplication PRIVATE KotonoApplication)
target_link_libraries(KotonoTestApplication PRIVATE KotonoExtensions)

# Preprocessor defines for all builds
target_compile_definitions(KotonoTestApplication PRIVATE
    PROJECT_DIRECTORY="${CMAKE_CURRENT_SOURCE_DIR}"
)
