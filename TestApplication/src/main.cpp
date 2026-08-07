#include <kotono_application/Application.h>
#include <kotono_common/PathManager.h>
#include <kotono_extension_testcoreextension/test.h>
#include <kotono_extension_testeditorextension/test.h>

std::filesystem::path SPathManager::projectPath_{ PROJECT_DIRECTORY };

int main()
{
    say_core();
    say_editor();

    UApplication{}.Run();

	return 0;
}