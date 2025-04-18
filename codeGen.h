#ifndef CODEGEN_H
#define CODEGEN_H

#define MAX_CODE 100

enum code_ops { START, HALT, LD_INT, LD_VAR, STORE, ADD, PRINT_INT_VALUE };

typedef struct {
    enum code_ops op;
    int arg;
} Code;

extern Code code[MAX_CODE];
extern int code_offset;

void gen_code(enum code_ops op, int arg);
void print_code();

#endif