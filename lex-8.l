%{
#include <stdio.h>
%}

%%

[a-z]   { printf("%c", yytext[0] - 32); } // Convert lowercase to uppercase
.       { printf("%c", yytext[0]); }    // Print other characters as is

%%

int main() {
    printf("Enter text: ");
    yylex(); // Call lexical analyzer
    return 0;
}
