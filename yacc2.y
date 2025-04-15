%{
#include <stdio.h>
#include <math.h>

int yylex(void);
void yyerror(const char *s);

int result = 0;
int position = 0;
%}

%token DIGIT

%%

binary:
    binary DIGIT {
        result += $2 * pow(2, position);
        position++;
    }
  | DIGIT {
        result += $1 * pow(2, position);
        position++;
    }
  ;

%%

int main(void) {
    printf("Enter a binary number: ");
    yyparse();
    printf("Decimal result: %d\n", result);
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
