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

// VTK uses priveate constructor and destructor so:
%nodefaultctor;  // Disable the default constructor
%nodefaultdtor;  // Disable the default destructor


%rename(GetCenterVec) vtkConeSource::GetCenter(double[3]);

class vtkConeSource {
public:
        static vtkConeSource * 	New ();
        void Delete ();

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


class vtkRenderer {
public:
        static vtkRenderer * 	New ();
        void Delete ();

        void 	SetBackground (double, double, double);
        void 	SetBackground2 (double, double, double);
        void 	SetGradientBackground (bool);
};

class vtkRenderWindow {
public:
        static vtkRenderWindow * 	New ();
        void Delete ();

        void 	AddRenderer (vtkRenderer *);
        void 	SetSize (int, int);
};


class vtkRenderWindowInteractor {
public:
        static vtkRenderWindowInteractor * 	New ();
        void Delete ();

        void 	SetRenderWindow (vtkRenderWindow *aren);
        void 	Initialize ();

        void 	Start ();
};
