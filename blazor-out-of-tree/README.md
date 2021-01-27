# Use this project:

Out of tree blazor sample

## Build option #1

You can use an existing runtime build, and simply use the required bits from there, with no other
setup required.

1. Ensure that you have a local `dotnet/runtime` build, from https://github.com/radical/runtime/tree/blazor-in-tree-wasm-local
   (or just get changes starting at https://github.com/radical/runtime/commit/52db07bffb4dadf4788623606c137911d940ef0d)

2. Build

`$ <aspnetcore-repo>/.dotnet/dotnet publish /p:RuntimeSrcDir=</path/to/runtime/root> /p:RuntimeConfig=<config-used-in-runtime-build> /p:RunAOTCompilation=true`

## Build option #2

You can either use a script(`prep.sh`) to copy all the required runtime bits
to a local directory, and build off that.

1. Copy runtime bits required for building, which will create a local `build` dir

`$ sh prep.sh <path/to/runtime/checkout> copy`

2. Build:

`$ <aspnetcore-repo>/.dotnet/dotnet publish /p:WasmBuildSupportDir=$PWD/build /p:RunAOTCompilation=true`
