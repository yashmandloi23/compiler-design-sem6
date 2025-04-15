%{
#include <stdio.h>
#include <string.h>

int yylex(void);
void yyerror(const char *s);
%}

%token CHARACTER

%%

input:
    palindrome { printf("The input is a palindrome.\n"); }
  | non_palindrome { printf("The input is not a palindrome.\n"); }
  ;

palindrome:
    CHARACTER
  | CHARACTER palindrome CHARACTER
  ;

non_palindrome:
    CHARACTER non_palindrome CHARACTER
  ;

%%

int main(void) {
    printf("Enter a string: ");
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
