# Use this project:

1. Patch runtime wasm targets with `runtime.diff`. Rebuild not required

2. Copy runtime bits required for building

`$ sh prep.sh <path/to/runtime/checkout> copy`

3. Build
`$ EMSDK_PATH=$<path/to/runtime/checkout>/src/mono/wasm/emsdk ~/dev/runtime/dotnet.sh publish /v:n`

# Use with a different blazor project

1. `$ cp Directory.Build* prep.sh </new/blazor/proj/dir>`
2. `$ EMSDK_PATH=$<path/to/runtime/checkout>/src/mono/wasm/emsdk ~/dev/runtime/dotnet.sh publish /v:n /p:RunAOTCompilation=true`
