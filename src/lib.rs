extern crate libc;


use std::os::raw::{
    c_void
};

type VtkConeSource = c_void;


extern {
    fn vtkConeSource_New() -> *mut VtkConeSource;

}



pub fn runner() {
    unsafe {
        let cone = vtkConeSource_New();

        println!("cone => 0x{:x}", cone as u64);
    }
}

#[cfg(test)]
mod tests {
    use super::*;


    #[test]
    fn it_works() {
        runner();
    }
}
