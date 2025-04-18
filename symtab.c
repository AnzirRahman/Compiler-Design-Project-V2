#include <stdio.h>
#include <string.h>
#include "codeGen.h"
#include "symtab.h"

#define MAX_SYMBOLS 100

Symbol symtab[MAX_SYMBOLS];
int sym_count = 0;

void insert(char *name, int type) {
    for (int i = 0; i < sym_count; i++) {
        if (strcmp(symtab[i].name, name) == 0) {
            printf("Error: Duplicate variable declaration: %s\n", name);
            return;
        }
    }
    strcpy(symtab[sym_count].name, name);
    symtab[sym_count].type = type;
    symtab[sym_count].address = sym_count;
    sym_count++;
}

int idcheck(char *name) {
    for (int i = 0; i < sym_count; i++) {
        if (strcmp(symtab[i].name, name) == 0) {
            return symtab[i].address;
        }
    }
    printf("Error: Undeclared variable: %s\n", name);
    return -1;
}