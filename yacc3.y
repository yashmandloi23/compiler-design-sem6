%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex(void);
void yyerror(const char *s);

char result[100];
int pos = 0;
%}

%token NUMBER PLUS MINUS MULTIPLY DIVIDE LPAREN RPAREN

%%

expression:
    term {
        result[pos++] = $1;
        result[pos++] = ' ';
    }
  | expression PLUS term {
        result[pos++] = $3;
        result[pos++] = $2;
        result[pos++] = ' ';
    }
  | expression MINUS term {
        result[pos++] = $3;
        result[pos++] = $2;
        result[pos++] = ' ';
    }
  ;

term:
    factor {
        result[pos++] = $1;
        result[pos++] = ' ';
    }
  | term MULTIPLY factor {
        result[pos++] = $3;
        result[pos++] = $2;
        result[pos++] = ' ';
    }
  | term DIVIDE factor {
        result[pos++] = $3;
        result[pos++] = $2;
        result[pos++] = ' ';
    }
  ;

factor:
    NUMBER {
        result[pos++] = $1;
        result[pos++] = ' ';
    }
  | LPAREN expression RPAREN {
        // No postfix operator added for parentheses
    }
  ;

%%

int main(void) {
    printf("Enter an infix expression: ");
    yyparse();
    printf("Postfix result: %s\n", result);
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
