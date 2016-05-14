extern crate vtk_sys as ffi;

#[allow(dead_code, non_camel_case_types)]

use std::ffi::CStr;


fn main() {

    unsafe {
        let cone = ffi::vtkConeSource_New();
        let cstr = ffi::vtkObjectBase_ToString(cone);
        let s = CStr::from_ptr(cstr).to_string_lossy().to_owned();
        println!("got => {}", s);

        ffi::vtkConeSource_SetHeight(cone, 3.0);
        ffi::vtkConeSource_SetRadius(cone, 1.0);
        ffi::vtkConeSource_SetResolution(cone, 10);


        let cone_mapper = ffi::vtkPolyDataMapper_New();
        ffi::vtkPolyDataMapper_SetInputConnection(cone_mapper,
            ffi::vtkAlgorithm_GetOutputPort(cone)
        );


        let cone_actor = ffi::vtkActor_New();
        ffi::vtkActor_SetMapper(cone_actor, cone_mapper);



        let ren1 = ffi::vtkRenderer_New();
        ffi::vtkRenderer_AddActor(ren1, cone_actor);
        ffi::vtkRenderer_SetBackground(ren1, 0.1, 0.2, 0.4);
        ffi::vtkRenderer_SetBackground2(ren1, 0.0, 0.0, 0.0);
        ffi::vtkRenderer_SetGradientBackground(ren1, 1);

        let ren_win = ffi::vtkRenderWindow_New();
        ffi::vtkRenderWindow_AddRenderer(ren_win, ren1);
        ffi::vtkRenderWindow_SetSize(ren_win, 600, 400);


        let iren = ffi::vtkRenderWindowInteractor_New();
        ffi::vtkRenderWindowInteractor_SetRenderWindow(iren, ren_win);


        let style = ffi::vtkInteractorStyleTrackballCamera_New();
        ffi::vtkRenderWindowInteractor_SetInteractorStyle(iren, style);

        let box_widget = ffi::vtkBoxWidget_New();
        ffi::vtkBoxWidget_SetInteractor(box_widget, iren);
        ffi::vtkBoxWidget_SetPlaceFactor(box_widget, 1.25);

        ffi::vtkBoxWidget_SetProp3D(box_widget, cone_actor);
        ffi::vtkBoxWidget_PlaceWidget(box_widget);

        ffi::vtkBoxWidget_On(box_widget);




        ffi::vtkRenderWindowInteractor_Initialize(iren);
        ffi::vtkRenderWindowInteractor_Start(iren);



        // TODO: free
        ffi::vtkObjectBase_Delete(cone);

    }
    println!("Hello World");
}
