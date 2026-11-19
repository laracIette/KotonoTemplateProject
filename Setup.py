import json
import tkinter
from pathlib import Path
from tkinter import filedialog

root = tkinter.Tk()
root.withdraw()

ProjectDirectory: Path = Path(__file__).resolve().parent

class Setup():
    def Run(self) -> None:
        withEditor: str = self.GetWithEditor()
        enginePath: str = self.GetEnginePath()

        print("Selected options:")
        print(f"- WITH_EDITOR={withEditor}")
        print(f"- ENGINE_PATH={enginePath}")
        print()

        cacheVars = {
            "WITH_EDITOR": withEditor,
            "ENGINE_PATH": enginePath,
        }

        match self.GetCompiler():
            case "clang":
                cacheVars["CMAKE_C_COMPILER"] = "clang"
                cacheVars["CMAKE_CXX_COMPILER"] = "clang++"
            case "gcc":
                cacheVars["CMAKE_C_COMPILER"] = "gcc"
                cacheVars["CMAKE_CXX_COMPILER"] = "g++"
            case "msvc":
                cacheVars["CMAKE_C_COMPILER"] = "cl"
                cacheVars["CMAKE_CXX_COMPILER"] = "cl"

        jsonData = {
            "version": 3,
            "configurePresets": [
                {
                    "name": "user-default",
                    "displayName": "My Kotono Dev Config",
                    "inherits": "base-config",
                    "cacheVariables": cacheVars
                }
            ],
            "buildPresets": [
                {
                    "name": "debug",
                    "configurePreset": "user-default",
                    "configuration": "Debug"
                },
                {
                    "name": "release",
                    "configurePreset": "user-default",
                    "configuration": "Release"
                }
            ]
        }

        filePath = ProjectDirectory / "CMakeUserPresets.json"
        filePath.write_text(json.dumps(jsonData, indent=4) + "\n", encoding="utf-8")

        print()
        print(f"Your CMake user presets have been successfully generated at {filePath}")
        input("Press enter to exit...")

    def GetWithEditor(self) -> str:
        print("Build with editor? (y/n)")
        if input() == "y":
            return "ON"
        else:
            return "OFF"

    def GetEnginePath(self) -> str:
        print("Select the directory of your Kotono Engine installation")
        return Path(filedialog.askdirectory(title="Kotono Engine directory", initialdir=ProjectDirectory)).resolve().as_posix()

    def GetCompiler(self) -> str:
        print("Specify a compiler:")
        print("0. Your default IDE compiler")
        print("1. Clang / Clang++")
        print("2. GCC / G++")
        print("3. MSVC")

        match input():
            case "1":
                return "clang"
            case "2":
                return "gcc"
            case "3":
                return "msvc"
            case _:
                return ""

if __name__ == "__main__":
    Setup().Run()
