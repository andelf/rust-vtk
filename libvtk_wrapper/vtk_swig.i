// ~/opt/swig-c/bin/swig -c++ -c vtk_swig.i
// https://svn.code.sf.net/p/swig/code/branches/gsoc2008-maciekd/

%module vtk
%{
#include "vtkConeSource.h"
#include "vtkPolyDataMapper.h"
#include "vtkRenderWindow.h"
#include "vtkRenderWindowInteractor.h"
#include "vtkCamera.h"
#include "vtkActor.h"
#include "vtkRenderer.h"
#include "vtkCommand.h"
#include "vtkBoxWidget.h"
#include "vtkTransform.h"
#include "vtkInteractorStyleTrackballCamera.h"
%}


%nodefaultctor;  // Disable the default constructor
%nodefaultdtor;  // Disable the default destructor
class vtkConeSource {
public:
        static vtkConeSource * 	New ();


        void 	SetHeight (double);
        double 	GetHeight ();
        void 	SetRadius (double);
        double 	GetRadius ();
        void 	SetResolution (int);
        int 	GetResolution ();
        void 	SetCenter (double, double, double);
        double * 	GetCenter ();
        void 	GetCenter (double data[3]);

        void 	SetDirection (double, double, double);
        double * 	GetDirection ();

        void 	SetAngle (double angle);
        double 	GetAngle ();




};
