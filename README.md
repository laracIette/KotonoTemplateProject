# Kotono Template Project

This is a template project for the *[Kotono Engine](https://github.com/laracIette/KotonoEngine)*.

## Build

- To build the project run *[generate_cmakepresets.sh](generate_cmakepresets.sh)*.

    - This generates a *CMakePresets.json* that your IDE or cmake in the command line can generate a build from.

    - Use the command 'cmake --build --preset release' to build manually (replace 'release' with 'debug' for the debug build).

    - All generated build files will be located in *build/*.

- Or create a build folder and run CMake for your IDE with the options :

    - -DWITH_EDITOR=*ON* for the solution with the editor.

    - -DWITH_EDITOR=*OFF* for the solution without the editor.

    - -DENGINE_PATH:PATH=*Path/To/Your/KotonoEngine* so that the project finds the engine.

## Side Note
Make sure that you have the *[Vulkan SDK](https://vulkan.lunarg.com/sdk/home)* and that its bin folder is added to your system’s PATH environment variable.
