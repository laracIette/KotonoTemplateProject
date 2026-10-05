cmake_minimum_required(VERSION 4.2)
project(KotonoTestApplication LANGUAGES C CXX)

add_executable(KotonoTestApplication)

target_compile_features(KotonoTestApplication PRIVATE cxx_std_23)

set_target_properties(KotonoTestApplication PROPERTIES FOLDER "KotonoTemplateProject")

set(KTESTAPPLICATION_SOURCES
    "Private/main.cpp"
)

target_sources(KotonoTestApplication
    PRIVATE
        ${KTESTAPPLICATION_SOURCES}
)

target_include_directories(KotonoTestApplication
    PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/Private"
)

file(GLOB_RECURSE KTESTAPPLICATION_ASSETS CONFIGURE_DEPENDS "${CMAKE_SOURCE_DIR}/Assets/*")
set_source_files_properties(${KTESTAPPLICATION_ASSETS} PROPERTIES HEADER_FILE_ONLY TRUE)
source_group(TREE "${CMAKE_SOURCE_DIR}/Assets" PREFIX "Assets" FILES ${KTESTAPPLICATION_ASSETS})
target_sources(KotonoTestApplication PRIVATE ${KTESTAPPLICATION_ASSETS})

target_link_libraries(KotonoTestApplication PRIVATE
    KotonoApplication
    KotonoTestCoreExtension
    $<$<BOOL:${WITH_EDITOR}>:KotonoTestEditorExtension>
)

target_compile_definitions(KotonoTestApplication PRIVATE
    PROJECT_DIRECTORY="${CMAKE_SOURCE_DIR}"
)
