%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);
%}

%token NUMBER PLUS MINUS MULTIPLY DIVIDE LPAREN RPAREN

%%

expression:
      expression PLUS term    { $$ = $1 + $3; }
    | expression MINUS term   { $$ = $1 - $3; }
    | term                    { $$ = $1; }
    ;

term:
      term MULTIPLY factor    { $$ = $1 * $3; }
    | term DIVIDE factor      { 
        if ($3 == 0) {
            yyerror("Division by zero");
            exit(1);
        }
        $$ = $1 / $3; 
      }
    | factor                  { $$ = $1; }
    ;

factor:
      NUMBER                  { $$ = $1; }
    | LPAREN expression RPAREN { $$ = $2; }
    ;

%%

int main(void) {
    printf("Enter an expression: ");
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
