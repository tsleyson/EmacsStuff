// snippet of code @ 2018-11-10 10:40:30

// === Rust Playground ===
// This snippet is in: ~/.emacs.d/rust-playground/at-2018-11-10-104027/

// Execute the snippet: C-c C-c
// Delete the snippet completely: C-c k
// Toggle between main.rs and Cargo.toml: C-c b

#![allow(unused_variables)]
fn main() {
    // Import (via `use`) the `fmt` module to make it available.
    use std::fmt;

    // Define a structure which `fmt::Display` will be implemented for. This is simply
    // a tuple struct containing an `i32` bound to the name `Structure`.
    struct Structure(i32);

    // In order to use the `{}` marker, the trait `fmt::Display` must be implemented
    // manually for the type.
    impl fmt::Display for Structure {
        // This trait requires `fmt` with this exact signature.
        fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
            // Write strictly the first element into the supplied output
            // stream: `f`. Returns `fmt::Result` which indicates whether the
            // operation succeeded or failed. Note that `write!` uses syntax which
            // is very similar to `println!`.
            write!(f, "{}", self.0)
        }
    }

    println!("Structure is {}", Structure(22))
}
