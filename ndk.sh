export NDK=/root/Android/Sdk/ndk/23.1.7779620
export TOOLCHAIN=$NDK/toolchains/llvm/prebuilt/linux-x86_64
export TARGET=aarch64-linux-android
export API=23
# Configure and build.
export AR=$TOOLCHAIN/bin/llvm-ar
export CC="$TOOLCHAIN/bin/clang --target=$TARGET$API"
export AS=$CC
export CXX="$TOOLCHAIN/bin/clang++ --target=$TARGET$API"
export LD=$TOOLCHAIN/bin/ld
export RANLIB=$TOOLCHAIN/bin/llvm-ranlib
export STRIP=$TOOLCHAIN/bin/llvm-strip




/root/Android/Sdk/ndk/25.1.8937393/toolchains/llvm/prebuilt/linux-x86_64/bin/clang++ --target aarch64-linux-android21 foo.cpp


	-DCMAKE_BUILD_TYPE=Debug
    -DCMAKE_TOOLCHAIN_FILE=${NDK}/build/cmake/android.toolchain.cmake \
    -DANDROID_NDK=${NDK}                               \
    -DANDROID_ABI=arm64-v8a	                               \
    -DANDROID_PLATFORM=android-23                           \
    -DANDROID_STL=c++_shared                                \
    -DCMAKE_LIBRARY_OUTPUT_DIRECTORY=${LIB1_DIRECTORY}/libs/armeabi-v7a       \
    ${LIB1_DIRECTORY}


    cmake .. -DINFERENCE_HELPER_ENABLE_MNN=on \
	-DCMAKE_BUILD_TYPE=Debug \
    -DCMAKE_TOOLCHAIN_FILE=${NDK}/build/cmake/android.toolchain.cmake \
    -DANDROID_NDK=${NDK}                               \
    -DANDROID_ABI=arm64-v8a	                               \
    -DANDROID_PLATFORM=android-23                           \
    