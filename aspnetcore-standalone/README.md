# Use with aspnetcore's StandaloneApp project

## Prepare

1. Drop `Directory.Build.*` into the source dir
2. Add `<AOTMode>AotInterp</AOTMode>` to `Standaloneapp.csproj`
3. Ensure that you have a local `dotnet/runtime` build

## Build

`$ <aspnetcore-repo>/.dotnet/dotnet publish /p:RuntimeSrcDir=</path/to/runtime/root> /p:RuntimeConfig=<config-used-in-runtime-build> /p:RunAOTCompilation=true`
