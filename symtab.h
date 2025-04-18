#ifndef SYMTAB_H
#define SYMTAB_H

#define MAX_SYMBOLS 100

typedef struct {
    char name[100];
    int type;
    int address;
} Symbol;

extern Symbol symtab[MAX_SYMBOLS];
extern int sym_count;

void insert(char *name, int type);
int idcheck(char *name);

#endif