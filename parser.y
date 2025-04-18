%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include "symtab.h"
    #include "codeGen.h"
    #include "symtab.h"
    void yyerror();
    extern int lineno;
    extern int yylex();
%}

%union {
    char str_val[100];
    int int_val;
}

%token FUNCTION MAIN SRT VAR EQUAL ASS ARR OP COLON COMMA DIS FINISH
%token ADDOP SEMI LPAREN RPAREN
%token<str_val> ID 
%token<int_val> ICONST
%token<int_val> INT

%left ADDOP 

%start program

%%

program: {gen_code(START, -1);} code {gen_code(HALT, -1);};

code: FUNCTION LPAREN RPAREN EQUAL MAIN SRT statements FINISH;

statements: statements statement | /* empty */;

statement: declaration 
         | assignment 
         | print 
         | op;

declaration : VAR EQUAL ID INT SEMI
{
    insert($3, $4);
};

assignment : ASS EQUAL ICONST ARR ID SEMI
{
    int address = idcheck($5);
    if (address != -1)
    {
        gen_code(LD_INT, $3);
        gen_code(STORE, address);
    }
};

op: OP EQUAL ADDOP COLON ID COMMA ID ARR ID SEMI
{
    int address1 = idcheck($5);
    int address2 = idcheck($7);
    int address3 = idcheck($9);
    if (address1 != -1 && address2 != -1 && address3 != -1)
    {
        gen_code(LD_VAR, address1);
        gen_code(LD_VAR, address2);
        gen_code(ADD, -1);
        gen_code(STORE, address3);
    }
};

print : DIS EQUAL ID SEMI
{
    int address = idcheck($3);
    if (address != -1)
    {
        gen_code(PRINT_INT_VALUE, address);
    }
};

%%

void yyerror()
{
    printf("Syntax error at line %d\n", lineno);
    exit(1);
}

int main(int argc, char *argv[])
{
    yyparse();
    printf("Parsing finished!\n");

    printf("============= INTERMEDIATE CODE===============\n");
    print_code();

    return 0;
}