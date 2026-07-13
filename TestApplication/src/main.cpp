#include <kotono_common/PathManager.h>
#include <kotono_core/Core.h>
#include <kotono_extension_testcoreextension/test.h>
#include <kotono_extension_testeditorextension/test.h>
#include <kotono_platform/Window.h>
#ifdef EDITOR
    #include <kotono_editor/Editor.h>
#endif
#ifndef NDEBUG
    #include <kotono_object/Object.h>
#endif

std::filesystem::path SPathManager::projectPath_{ PROJECT_DIRECTORY };

int main()
{
    say_core();
    say_editor();

    Core.Init();
#   ifdef EDITOR
        Editor.Init();
#   endif

    while (!Window.GetShouldClose())
    {
        Core.Update();
#       ifdef EDITOR
            Editor.Update();
#       endif
    }

#   ifdef EDITOR
        Editor.Cleanup();
#   endif
    Core.Cleanup();

#   ifndef NDEBUG
    KObject::CheckDebugRegistry();
#   endif

	return 0;
}