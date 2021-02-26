# Use this project:

Out of tree console samplee

## Build option #1

You can use an existing runtime build, and simply use the required bits from there, with no other
setup required.

1. Build

`$ dotnet publish /p:RuntimeSrcDir=</path/to/runtime/root> /p:RuntimeConfig=<config-used-in-runtime-build> /p:RunAOTCompilation=true`

## Build option #2

You can use `tools/build_support.proj` to copy all the required runtime bits
to a local directory, and build off that.

1. Copy runtime bits required for building, which will create a local `build` dir

`$ dotnet publish /p:RuntimeSrcDir=</path/to/runtime/root> /p:RuntimeConfig=<config-used-in-runtime-build> /p:TargetDir=/tmp/wasm`

2. Build:

`$ dotnet publish /p:WasmBuildSupportDir=/tmp/wasm/build /p:RunAOTCompilation=true /p:EMSDK_PATH=</path/to/emsdk>`

Note: you can find emsdk in `$RuntimeSrcDir/src/mono/wasm/emsdk`, if you have built the runtime for wasm.
