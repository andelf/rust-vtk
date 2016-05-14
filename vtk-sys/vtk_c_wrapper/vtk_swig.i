// ~/opt/swig-c/bin/swig -c++ -c vtk_swig.i
// https://svn.code.sf.net/p/swig/code/branches/gsoc2008-maciekd/

%module vtk
%{
#include <sstream>

#include <vtkObjectBase.h>
#include <vtkObject.h>
#include <vtkAlgorithm.h>
#include <vtkPolyDataAlgorithm.h>
#include <vtkPolyDataMapper.h>

#include <vtkActor.h>

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

void free_output_cstr(char * p) {
        if (p != NULL) {
                delete [] p;
        }
}

%}

void free_output_cstr(char * p);

// VTK uses priveate constructor and destructor so:
%nodefaultctor;  // Disable the default constructor
%nodefaultdtor;  // Disable the default destructor


class vtkObjectBase {
public:
        const char* GetClassName() const;
        virtual int IsA(const char *name);
        virtual void Delete();
        /* virtual void FastDelete(); */
        void 	Print (ostream &os);
        virtual void 	Register (vtkObjectBase *o);
        virtual void 	UnRegister (vtkObjectBase *o);

        static vtkObjectBase *New();
        static int IsTypeOf(const char *name);

         %extend {
                /* must call free_output_cstr */
                char *ToString() {
                        std::ostringstream ostr;
                        $self->Print(ostr);
                        char *cstr = NULL;
                        /* must call delete [] cstr; */
                        cstr = new char[ostr.str().length()+1];
                        strcpy(cstr, ostr.str().c_str());
                        return cstr;
                }
        }
};


class vtkObject : public vtkObjectBase {
public:
        vtkObject * 	NewInstance () const;

        bool 	GetDebug ();
        void 	SetDebug (bool debugFlag);
};



class vtkAlgorithm : public vtkObject {
public:
        vtkAlgorithmOutput * 	GetOutputPort ();
};

class vtkPolyDataAlgorithm : public vtkAlgorithm {
};

class vtkPolyDataMapper : public vtkPolyDataAlgorithm {
public:
        static vtkPolyDataMapper * 	New ();
        virtual void 	Delete ();

        virtual void 	SetInputConnection (vtkAlgorithmOutput *input);
};


/* vtkObject <- vtkProp <- vtkProp3D <- vtkActor */
class vtkActor : public vtkObject {
public:
        static vtkActor * 	New ();
        virtual void 	Delete ();

        virtual void 	SetMapper (vtkMapper *);
};

class vtkConeSource : public vtkAlgorithm {
        %rename(GetCenterVec) vtkConeSource::GetCenter(double[3]);
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

        void 	AddActor (vtkProp *p);


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

        virtual void 	SetInteractorStyle (vtkInteractorObserver *);
        virtual vtkInteractorObserver * 	GetInteractorStyle ();
};


class vtkInteractorStyleTrackballCamera {
public:
        static vtkInteractorStyleTrackballCamera * 	New ();
        void Delete ();
};


class vtkBoxWidget {
public:
        static vtkBoxWidget * 	New ();
        void Delete ();

        virtual void 	SetInteractor (vtkRenderWindowInteractor *iren);
        virtual vtkRenderWindowInteractor * 	GetInteractor ();

        void 	PlaceWidget ();

        virtual void 	SetPlaceFactor (double);
        virtual double 	GetPlaceFactor ();

        virtual void 	SetProp3D (vtkProp3D *);
        virtual vtkProp3D * 	GetProp3D ();

        void 	On ();
        void 	Off ();
};
