#/bin/sh
set +x

mkdir build
cd build

if [ $# -lt 1 ]; then
    echo "Setup build directory based on a local runtime build"
	echo "Usage: $0 <runtime-src-dir> [<link|copy>]"
	exit 1
fi

MODE=${2:link}
RUNTIME_SRC_DIR=$1
ARTIFACTS_BIN_DIR=$1/artifacts/bin

if [ "$MODE" = "link" ]; then
    ln -v -s $RUNTIME_SRC_DIR/src/mono/wasm/build wasm
    ln -v -s $ARTIFACTS_BIN_DIR/MonoAOTCompiler/Debug/net5.0/ MonoAOTCompiler
    ln -v  -s $ARTIFACTS_BIN_DIR/WasmAppBuilder/Debug/net5.0/publish WasmAppBuilder
    ln -v -s $ARTIFACTS_BIN_DIR/WasmBuildTasks/Debug/net5.0/publish WasmBuildTasks

    ln -v -s $ARTIFACTS_BIN_DIR/microsoft.netcore.app.runtime.browser-wasm/Release microsoft.netcore.app.runtime.browser-wasm
else
    cp -v -r $RUNTIME_SRC_DIR/src/mono/wasm/build/ wasm
    cp -v -r $ARTIFACTS_BIN_DIR/MonoAOTCompiler/Debug/net5.0/ MonoAOTCompiler
    cp -v -r $ARTIFACTS_BIN_DIR/WasmAppBuilder/Debug/net5.0/publish WasmAppBuilder
    cp -v -r $ARTIFACTS_BIN_DIR/WasmBuildTasks/Debug/net5.0/publish WasmBuildTasks

    cp -v -r $ARTIFACTS_BIN_DIR/microsoft.netcore.app.runtime.browser-wasm/Release microsoft.netcore.app.runtime.browser-wasm
fi
