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

int yylex();
int yyerror(char *);
%}

%token open_parent close_parent

%%
S: open_parent L close_parent {
  printf("R1. S -> ( L )\n");
};
S: open_parent close_parent {
  printf("R2. S -> ()\n");
};
L: open_parent L close_parent {
  printf("R3. L -> ( L )\n");
};
L: L open_parent close_parent {
  printf("R4. L -> L ()\n");
};
L: open_parent close_parent {
  printf("R5. L -> ()\n");
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
