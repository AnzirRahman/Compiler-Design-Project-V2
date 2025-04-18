%option noyywrap

%{
	#define INT_TYPE 1
	#define REAL_TYPE 2
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#include "parser.tab.h"

	int lineno = 1; // initialize to 1
	void yyerror();
%}

alpha     [a-zA-Z]
digit     [0-9]
alnum     {alpha}|{digit}
print     [ -~]
string    \"[^\"]+\"

ID        {alpha}{alnum}*
ICONST    [0-9]{digit}*

%%

"//".*        { } 

"function" 	{ return FUNCTION; }
"="			{ return EQUAL; }
"main"		{ return MAIN; }
"start"		{ return SRT; }
"var"		{ return VAR; }
"int"		{ yylval.int_val = INT_TYPE; return INT; }
"assign"	{ return ASS; }
"->"		{ return ARR; }
"op"		{ return OP; }
"add"		{ return ADDOP; }
":"			{ return COLON; }
","		{ return COMMA; }
"disp"		{ return DIS; }
"finish"	{ return FINISH; }
"("       	{ return LPAREN; }
")"       	{ return RPAREN; }
";"       	{ return SEMI; }


{ID}        {strcpy(yylval.str_val, yytext); return ID;}
{ICONST}    {yylval.int_val=atoi(yytext); return ICONST;}

"\n"        { lineno += 1; }
[ \t\r\f]+  

.       { yyerror("Unrecognized character"); }
