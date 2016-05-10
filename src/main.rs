extern crate libc;


use std::os::raw::{
    c_void, c_double, c_int
};

pub type SwigObj = c_void;


extern {
    // the following is extracted from bindgen's output
    pub fn vtkConeSource_New() -> *mut SwigObj;
    pub fn vtkConeSource_Delete(carg1: *mut SwigObj);
    pub fn vtkConeSource_SetHeight(carg1: *mut SwigObj,
                                   carg2: c_double);
    pub fn vtkConeSource_GetHeight(carg1: *mut SwigObj)
     -> c_double;
    pub fn vtkConeSource_SetRadius(carg1: *mut SwigObj,
                                   carg2: c_double);
    pub fn vtkConeSource_GetRadius(carg1: *mut SwigObj)
     -> c_double;
    pub fn vtkConeSource_SetResolution(carg1: *mut SwigObj,
                                       carg2: c_int);
    pub fn vtkConeSource_GetResolution(carg1: *mut SwigObj)
     -> c_int;
    pub fn vtkConeSource_SetCenter(carg1: *mut SwigObj,
                                   carg2: c_double,
                                   carg3: c_double,
                                   carg4: c_double);
    pub fn vtkConeSource_GetCenter(carg1: *mut SwigObj)
     -> *mut c_double;
    pub fn vtkConeSource_GetCenterVec(carg1: *mut SwigObj,
                                      carg2: *mut c_double);
    pub fn vtkConeSource_SetDirection(carg1: *mut SwigObj,
                                      carg2: c_double,
                                      carg3: c_double,
                                      carg4: c_double);
    pub fn vtkConeSource_GetDirection(carg1: *mut SwigObj)
     -> *mut c_double;
    pub fn vtkConeSource_SetAngle(carg1: *mut SwigObj,
                                  carg2: c_double);
    pub fn vtkConeSource_GetAngle(carg1: *mut SwigObj)
     -> c_double;
    pub fn vtkRenderWindow_New() -> *mut SwigObj;
    pub fn vtkRenderWindow_Delete(carg1: *mut SwigObj);
    pub fn vtkRenderWindow_AddRenderer(carg1: *mut SwigObj,
                                       carg2: *mut SwigObj);
    pub fn vtkRenderWindow_SetSize(carg1: *mut SwigObj,
                                   carg2: c_int,
                                   carg3: c_int);
    pub fn vtkRenderWindowInteractor_New() -> *mut SwigObj;
    pub fn vtkRenderWindowInteractor_Delete(carg1: *mut SwigObj);
    pub fn vtkRenderWindowInteractor_SetRenderWindow(carg1: *mut SwigObj,
                                                     carg2: *mut SwigObj);
    pub fn vtkRenderWindowInteractor_Initialize(carg1: *mut SwigObj);
    pub fn vtkRenderWindowInteractor_Start(carg1: *mut SwigObj);

    pub fn vtkRenderer_New() -> *mut SwigObj;
    pub fn vtkRenderer_Delete(carg1: *mut SwigObj);
    pub fn vtkRenderer_SetBackground(carg1: *mut SwigObj,
                                     carg2: ::std::os::raw::c_double,
                                     carg3: ::std::os::raw::c_double,
                                     carg4: ::std::os::raw::c_double);
    pub fn vtkRenderer_SetBackground2(carg1: *mut SwigObj,
                                      carg2: ::std::os::raw::c_double,
                                      carg3: ::std::os::raw::c_double,
                                      carg4: ::std::os::raw::c_double);
    pub fn vtkRenderer_SetGradientBackground(carg1: *mut SwigObj, carg2: u8);
}


pub fn main() {
    unsafe {
        let cone = vtkConeSource_New();

        println!("cone => 0x{:x}", cone as u64);


        let ren1 = vtkRenderer_New();
        vtkRenderer_SetBackground(ren1, 0.0, 0.0, 1.0);
        vtkRenderer_SetBackground2(ren1, 0.0, 0.0, 0.0);
        vtkRenderer_SetGradientBackground(ren1, 1);

        let ren_win = vtkRenderWindow_New();
        vtkRenderWindow_AddRenderer(ren_win, ren1);
        vtkRenderWindow_SetSize(ren_win, 600, 400);

        let iren = vtkRenderWindowInteractor_New();
        vtkRenderWindowInteractor_SetRenderWindow(iren, ren_win);


        vtkRenderWindowInteractor_Initialize(iren);
        vtkRenderWindowInteractor_Start(iren);

    }
}
