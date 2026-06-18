#include <kotono_common/PathManager.h>
#include <kotono_core/Core.h>
#include <kotono_extension_testcoreextension/test.h>
#include <kotono_extension_testeditorextension/test.h>
#include <kotono_platform/Window.h>
#if defined (EDITOR)
    #include <kotono_editor/Editor.h>
#endif
#if defined (_DEBUG)
    #include <kotono_object/Object.h>
#endif

std::filesystem::path SPathManager::projectPath_{ PROJECT_DIRECTORY };

int main()
{
    say_core();
    say_editor();

    Core.Init();
#   if defined (EDITOR)
        Editor.Init();
#   endif

    while (!Window.GetShouldClose())
    {
        Core.Update();
#       if defined (EDITOR)
            Editor.Update();
#       endif
    }

#   if defined (EDITOR)
        Editor.Cleanup();
#   endif
    Core.Cleanup();

#   if defined (_DEBUG)
    KObject::CheckDebugRegistry();
#   endif

	return 0;
}