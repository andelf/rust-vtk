/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 2.0.6
 * 
 * This file is not intended to be easily readable and contains a number of 
 * coding conventions designed to improve portability and efficiency. Do not make
 * changes to this file unless you know what you are doing--modify the SWIG 
 * interface file instead. 
 * ----------------------------------------------------------------------------- */
#ifndef _vtk_proxy_H_
#define _vtk_proxy_H_

/* -----------------------------------------------------------------------------
 * cproxy.swg
 *
 * Definitions of C specific preprocessor symbols for proxies.
 * ----------------------------------------------------------------------------- */

#ifndef SWIGIMPORT
# ifndef __GNUC__
#   define __DLL_IMPORT __declspec(dllimport)
# else
#   define __DLL_IMPORT __attribute__((dllimport)) extern
# endif
# if !defined (__WIN32__)
#   define SWIGIMPORT extern
# else
#   define SWIGIMPORT __DLL_IMPORT
# endif
#endif

#include <stdio.h>

typedef struct {
  void *obj;
  const char **typenames;
} SwigObj;


// special value indicating any type of exception like 'catch(...)'
#define SWIG_AnyException "SWIG_AnyException"

#include <setjmp.h>

SWIGIMPORT jmp_buf SWIG_rt_env;

SWIGIMPORT struct SWIG_exc_struct {
  int code;
  char *msg;
  SwigObj *klass;
} SWIG_exc;

SWIGIMPORT void SWIG_rt_try();
SWIGIMPORT int SWIG_rt_catch(const char *type);
SWIGIMPORT void SWIG_rt_throw(SwigObj *klass, const char * msg);
SWIGIMPORT int SWIG_rt_unhandled();
SWIGIMPORT void SWIG_rt_endtry();
SWIGIMPORT int SWIG_exit(int code);

#define SWIG_try \
  SWIG_rt_try(); \
  if ((SWIG_exc.code = setjmp(SWIG_rt_env)) == 0) 
#define SWIG_catch(type) else if (SWIG_rt_catch(#type))
#define SWIG_throw(klass) SWIG_rt_throw((SwigObj *) klass, 0);
#define SWIG_throw_msg(klass, msg) SWIG_rt_throw((SwigObj *) klass, msg);
#define SWIG_endtry else SWIG_rt_unhandled(); SWIG_rt_endtry();



#include <stdarg.h>

#define SWIG_MAKE_DELETE(Name,Obj) void Name(Obj *op1, ...) {\
  Obj *obj;\
  va_list vl;\
  va_start(vl, op1);\
  do {\
    obj = va_arg(vl, Obj *);\
    delete_##Obj(obj);\
  } while (obj);\
  va_end(vl);\
}


typedef SwigObj vtkConeSource;

/*aaaaaa*/SwigObj * vtkConeSource_New();
void vtkConeSource_Delete(SwigObj * carg1);
void vtkConeSource_SetHeight(SwigObj * carg1, double carg2);
double vtkConeSource_GetHeight(SwigObj * carg1);
void vtkConeSource_SetRadius(SwigObj * carg1, double carg2);
double vtkConeSource_GetRadius(SwigObj * carg1);
void vtkConeSource_SetResolution(SwigObj * carg1, int carg2);
int vtkConeSource_GetResolution(SwigObj * carg1);
void vtkConeSource_SetCenter(SwigObj * carg1, double carg2, double carg3, double carg4);
double * vtkConeSource_GetCenter(SwigObj * carg1);
void vtkConeSource_GetCenterVec(SwigObj * carg1, /*aaa*/ double * carg2);
void vtkConeSource_SetDirection(SwigObj * carg1, double carg2, double carg3, double carg4);
double * vtkConeSource_GetDirection(SwigObj * carg1);
void vtkConeSource_SetAngle(SwigObj * carg1, double carg2);
double vtkConeSource_GetAngle(SwigObj * carg1);

typedef SwigObj vtkRenderer;

/*aaaaaa*/SwigObj * vtkRenderer_New();
void vtkRenderer_Delete(SwigObj * carg1);
void vtkRenderer_SetBackground(SwigObj * carg1, double carg2, double carg3, double carg4);
void vtkRenderer_SetBackground2(SwigObj * carg1, double carg2, double carg3, double carg4);
#include <stdbool.h>
void vtkRenderer_SetGradientBackground(SwigObj * carg1, bool carg2);

typedef SwigObj vtkRenderWindow;

/*aaaaaa*/SwigObj * vtkRenderWindow_New();
void vtkRenderWindow_Delete(SwigObj * carg1);
void vtkRenderWindow_AddRenderer(SwigObj * carg1, SwigObj * carg2);
void vtkRenderWindow_SetSize(SwigObj * carg1, int carg2, int carg3);

typedef SwigObj vtkRenderWindowInteractor;

/*aaaaaa*/SwigObj * vtkRenderWindowInteractor_New();
void vtkRenderWindowInteractor_Delete(SwigObj * carg1);
void vtkRenderWindowInteractor_SetRenderWindow(SwigObj * carg1, SwigObj * carg2);
void vtkRenderWindowInteractor_Initialize(SwigObj * carg1);
void vtkRenderWindowInteractor_Start(SwigObj * carg1);

#endif /* _vtk_proxy_H_ */
