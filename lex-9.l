
%{
#include <stdio.h>
#include <string.h>
#define MAX_WORD_LEN 100

char smallestWord[MAX_WORD_LEN];
int firstWord = 1; // Flag to indicate the first word
%}

%%

[a-zA-Z]+ {
    if (firstWord) {
        strcpy(smallestWord, yytext); // Initialize with the first word
        firstWord = 0;
    } else if (strlen(yytext) < strlen(smallestWord)) {
        strcpy(smallestWord, yytext); // Update the smallest word
    }
}

[ \t\n]+ ; // Ignore spaces, tabs, and newlines

. ; // Ignore other characters

%%

int main() {
    printf("Enter a string: ");
    yylex(); // Call the lexical analyzer
    printf("Smallest word: %s\n", smallestWord);
    return 0;
}
