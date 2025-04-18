#include <stdio.h>

#define MAX_CODE 100

enum code_ops { START, HALT, LD_INT, LD_VAR, STORE, ADD, PRINT_INT_VALUE };

typedef struct {
    enum code_ops op;
    int arg;
} Code;

Code code[MAX_CODE];
int code_offset = 0;

void gen_code(enum code_ops op, int arg) {
    code[code_offset].op = op;
    code[code_offset].arg = arg;
    code_offset++;
}

void print_code() {
    for (int i = 0; i < code_offset; i++) {
        printf("%3d: %-15s %4d\n", i, 
            (code[i].op == START ? "START" :
            code[i].op == HALT ? "HALT" :
            code[i].op == LD_INT ? "LD_INT" :
            code[i].op == LD_VAR ? "LD_VAR" :
            code[i].op == STORE ? "STORE" :
            code[i].op == ADD ? "ADD" :
            code[i].op == PRINT_INT_VALUE ? "PRINT_INT_VALUE" : "UNKNOWN"),
            code[i].arg);
    }
}