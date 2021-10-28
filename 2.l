%{
#include <stdio.h>
#include <stdlib.h>
#include "2.tab.h"

FILE *yyin;

int yylval;
int lineno = 1;

int yyerror(char *);
%}

%option noyywrap
%option yylineno

open_parent "("
close_parent ")"

%%
{open_parent} {
  return open_parent;
}
{close_parent} {
  return close_parent;
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
