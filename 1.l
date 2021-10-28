%{
#include <stdio.h>
#include <stdlib.h>
#include "1.tab.h"

FILE *yyin;

int yylval;
int lineno = 1;

int yyerror(char *);
%}

%option noyywrap
%option yylineno

fin ";"
coma ","
id "id"
exp_elem "exp"
op_eq ":="

%%
{fin} {
  return fin;
}
{coma} {
  return coma;
}
{op_eq} {
  return op_eq;
}
{exp_elem} {
  return exp_elem;
}
{id} {
  return id;
}


" "
"\n" {
  ++lineno;
}
"\t"

. {
  char s[] = "invalid character: ";

  strcat(s, yytext);
  strcat(s, "\n");

  yyerror(s);
}
%%
