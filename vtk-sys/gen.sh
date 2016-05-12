#!/bin/sh

# use https://github.com/andelf/swig

(cd vtk_c_wrapper && ~/opt/swig/bin/swig -c++ -c vtk_swig.i)

BINDGEN_FLAGS="-I /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../lib/clang/7.3.0/include -I /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include -I /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk/usr/include -match vtk_proxy.h"


bindgen vtk_c_wrapper/vtk_proxy.h ${BINDGEN_FLAGS} | sed 's/pub static mut SWIG_rt_env: jmp_buf;//g' > src/ffi.rs
