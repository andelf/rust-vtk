// build.rs
extern crate cmake;

use std::env;
use std::fs::File;
use std::path::Path;
use std::io::BufReader;
use std::io::BufRead;

fn main() {

    // Builds the project in the directory located in `libfoo`, installing it
    // into $OUT_DIR

    let dst = cmake::Config::new("vtk_c_wrapper")
        .define("VTK_RENDERING_BACKEND", "Qt")
        .build();

    let out_dir = env::var("OUT_DIR").unwrap();
    let libs_path = Path::new(&out_dir).join("build/.libs");
    let f = BufReader::new(File::open(libs_path).unwrap());

    for line in f.lines() {
        if let Ok(line) = line {
            if line.starts_with("/") {
                // println!("cargo:rustc-link-lib=dylib={}", line);
            } else {
                println!("cargo:rustc-link-lib=dylib={}-7.0", line);
            }
        }
    }

    let lib_dirs_path = Path::new(&out_dir).join("build/.lib_dirs");
    let f = BufReader::new(File::open(lib_dirs_path).unwrap());

    for line in f.lines() {
        if let Ok(line) = line {
            println!("cargo:rustc-link-search=native={}", line);
        }
    }

    println!("cargo:rustc-link-search=native={}/lib", dst.display());
    println!("cargo:rustc-link-lib=static=vtk_c_wrapper");
    println!("cargo:rustc-link-lib=dylib=stdc++");
}
