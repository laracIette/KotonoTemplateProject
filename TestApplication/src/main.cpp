#include <kotono_common/Path.h>
#include <kotono_core/Core.h>
#include <kotono_extension_coretestextension/test.h>
#include <kotono_extension_editortestextension/test.h>
#include <kotono_platform/Window.h>
#ifdef EDITOR
    #include <kotono_editor/Editor.h>
#endif

std::filesystem::path KtPath::projectPath_{ PROJECT_DIRECTORY };

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

	return 0;
}