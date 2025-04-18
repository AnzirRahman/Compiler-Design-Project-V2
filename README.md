# Simple Compiler Project

## Overview

This project implements a simple compiler using C, Flex, and Bison. It includes:

- A lexical analyzer (lexer.l and generated lex.yy.c)
- A parser (parser.y, parser.tab.h, and parser.tab.c)
- A symbol table (symtab.h and symtab.c)
- A code generation module (codeGen.h and codeGen.c)
- A build script (Makefile)

The compiler reads an input file (input.txt) and generates both intermediate and assembly code.

## Files

- **parser.y**: Bison grammar for syntax analysis.
- **lexer.l**: Flex scanner to tokenize the source code.
- **symtab.h / symtab.c**: Implements the symbol table for variables.
- **codeGen.h / codeGen.c**: Generates the intermediate code.
- **Makefile**: Build instructions using bison, flex, and gcc.
- **input.txt**: Sample source code.

## Build and Run

1. **Build the Compiler**  
   In the project root, run:

   ```
   make
   ```

   This creates the parser executable.

2. **Run the Compiler**  
   Execute:

   ```
   make run
   ```

   or

   ```
   ./parser < input.txt
   ```

   The output is shown on the console and saved in output.txt.

3. **Clean Build Files**  
   To remove generated files, run:
   ```
   make clean
   ```

## Notes

- Ensure Flex, Bison, and GCC are installed.
- All file paths and commands use relative references.
