%{
#include <stdio.h>
#include <stdlib.h>
#include "3.tab.h"

FILE *yyin;

int yylval;
int lineno = 1;

int yyerror(char *);
%}

%option noyywrap
%option yylineno

natural_digit [1-9]
digit (0|{natural_digit})
uppercase_letter [A-Z]
lowercase_letter [a-z]
letter ({uppercase_letter}|{lowercase_letter})

int_constant ({digit}|{natural_digit}{digit}*)
op_sum "+"
op_sub "-"
op_mult "*"
op_div "/"
id {letter}(_?({letter}|{digit}))*

parenthesis_open "("
parenthesis_close ")"

op_assign ":="

semicolon ";"

%%
{op_sum} {
  return op_sum;
}
{op_sub} {
  return op_sub;
}
{op_mult} {
  return op_mult;
}
{op_div} {
  return op_div;
}

{int_constant} {
  return int_constant;
}

{id} {
  return id;
}

{parenthesis_open} {
  return parenthesis_open;
}
{parenthesis_close} {
  return parenthesis_close;
}

{op_assign} {
  return op_assign;
}

{semicolon} {
  return semicolon;
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
