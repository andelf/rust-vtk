cmake_minimum_required(VERSION 2.8.5 FATAL_ERROR)
if(POLICY CMP0025)
  cmake_policy(SET CMP0025 NEW) # CMake 3.0
endif()
if(POLICY CMP0053)
  cmake_policy(SET CMP0053 NEW) # CMake 3.1
endif()

set(CMAKE_MACOSX_RPATH 0)

PROJECT (vtk_wrapper)

find_package(VTK COMPONENTS
  vtkFiltersSources
  vtkInteractionWidgets
  vtkRendering${VTK_RENDERING_BACKEND}
)
include(${VTK_USE_FILE})

#add_library(vtk_wrapper SHARED lib.cxx)
add_library(vtk_wrapper vtk_swig_wrap.cxx vtk_proxy.c)
target_link_libraries(vtk_wrapper ${VTK_LIBRARIES})


install (TARGETS vtk_wrapper ARCHIVE DESTINATION lib)
#install (TARGETS vtk_wrapper DESTINATION lib)



FILE(WRITE ${CMAKE_BINARY_DIR}/.vtk_version ${VTK_VERSION})

SET(CONTENTS "")
FOREACH(line ${VTK_LIBRARIES})
   SET(CONTENTS "${CONTENTS}${line}\n")
ENDFOREACH(line)

file(WRITE ${CMAKE_BINARY_DIR}/.libs ${CONTENTS})


SET(CONTENTS "")
FOREACH(line ${VTK_RUNTIME_LIBRARY_DIRS})
   SET(CONTENTS "${CONTENTS}${line}\n")
ENDFOREACH(line)

file(WRITE ${CMAKE_BINARY_DIR}/.lib_dirs ${CONTENTS})
