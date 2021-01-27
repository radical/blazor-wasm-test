# Use with aspnetcore's StandaloneApp project

## Prepare

1. Drop `Directory.Build.*` into the source dir
2. Add `<AOTMode>AotInterp</AOTMode>` to `Standaloneapp.csproj`
3. Ensure that you have a local `dotnet/runtime` build, from https://github.com/radical/runtime/tree/blazor-in-tree-wasm-local
   (or just get changes starting at https://github.com/radical/runtime/commit/52db07bffb4dadf4788623606c137911d940ef0d)

## Build

`$ <aspnetcore-repo>/.dotnet/dotnet publish /p:RuntimeSrcDir=</path/to/runtime/root> /p:RuntimeConfig=<config-used-in-runtime-build> /p:RunAOTCompilation=true`
