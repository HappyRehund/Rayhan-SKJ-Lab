#!/bin/bash

# Compiles the code
compile() {
    g++ -o mul mul.cpp
}

# Disassembles the compiled code
disassemble() {
    objdump -d mul > mul.asm
}

# Removes all output files created by compile and disassemble functions
clean() {
    rm -f mul mul.asm
}

# Runs the compiled executable
run() {
    ./mul
}

# Main function to process command-line arguments
main() {
    case "$1" in
        all)
            compile
            ;;
        dump)
            disassemble
            ;;
        clean)
            clean
            ;;
        run)
            run
            ;;
        *)
            echo "Usage: $0 {all|dump|clean|run}"
            exit 1
            ;;
    esac
}

# Call the main function with all arguments passed to the script
main "$@"
