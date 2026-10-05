#include <Application/Application.h>
#include <Path/Path.h>
#include <say_core/say_core.h>
#include <say_editor/say_editor.h>

std::string_view UPath::enginePath_{ ENGINE_DIRECTORY };
std::string_view UPath::projectPath_{ PROJECT_DIRECTORY };

int main()
{
    say_core();
    say_editor();

    UApplication{}.Run();

	return 0;
}