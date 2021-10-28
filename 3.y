%{
#include <math.h>
#include <stdio.h>
#include <stdlib.h>

#define COLOR_RED "\033[1;31m"
#define COLOR_RESET "\033[0m"

int lineno;

int yylval;
int yystopparser = 0;

FILE *yyin;

char *yyltext;
char *yytext;

char* rule[14] = {
  "R0. PROGRAM -> CODE",
  "R1. CODE -> CODE LINE",
  "R2. CODE -> LINE",
  "R3. LINE -> ASSIG semicolon",
  "R4. ASSIG -> id op_assign EXP",
  "R5. EXP -> EXP op_sum TERM",
  "R6. EXP -> EXP op_sub TERM",
  "R7. EXP -> TERM",
  "R8. TERM -> TERM op_mult FACTOR",
  "R9. TERM -> TERM op_div FACTOR",
  "R10. TERM -> FACTOR",
  "R11. FACTOR -> id",
  "R12. FACTOR -> int_constant",
  "R13. FACTOR -> parenthesis_open EXP parenthesis_close"
};

int yylex();
int yyerror(char *);
%}

%token parenthesis_open parenthesis_close
%token semicolon
%token id int_constant
%token op_assign
%token op_sum op_sub op_mult op_div

%%
PROGRAM: CODE {
  printf("%s\n", rule[0]);
};

CODE: CODE LINE {
  printf("%s\n", rule[1]);
} | LINE {
  printf("%s\n", rule[2]);
};

LINE: ASSIG semicolon {
  printf("%s\n", rule[3]);
};

ASSIG: id op_assign EXP {
  printf("%s\n", rule[4]);
};

EXP: EXP op_sum TERM {
  printf("%s\n", rule[5]);
} | EXP op_sub TERM {
  printf("%s\n", rule[6]);
} | TERM {
  printf("%s\n", rule[7]);
};

TERM: TERM op_mult FACTOR {
  printf("%s\n", rule[8]);
} | TERM op_div FACTOR {
  printf("%s\n", rule[9]);
} | FACTOR {
  printf("%s\n", rule[10]);
};

FACTOR: id {
  printf("%s\n", rule[11]);
} | int_constant {
  printf("%s\n", rule[12]);
} | parenthesis_open EXP parenthesis_close {
  printf("%s\n", rule[13]);
};
%%

int main(int argc,char *argv[]) {
  const char* filename = argv[1];
  FILE* arg_file = fopen(filename, "rt");

  if (arg_file == NULL ) {
    printf("File cannot be opened: %s\n", filename);
    printf("Using standard input\n\n");
  }
  else {
    yyin = arg_file;
  }

  yyparse();

  fclose(yyin);

  return EXIT_SUCCESS;
}

int yyerror(char *error) {
  fprintf(stderr, COLOR_RED "\nline %d: %s\n" COLOR_RESET, lineno, error);
  fclose(yyin);
  exit(1);
}
