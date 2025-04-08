%{
#include <stdio.h>
#include <string.h>
#define MAX_WORDS 100
#define MAX_WORD_LEN 100

char words[MAX_WORDS][MAX_WORD_LEN];
int wordCount = 0;
%}

%%

[a-zA-Z]+ {
    strcpy(words[wordCount++], yytext); // Store each word in the array
}

[ \t\n]+ ; // Ignore spaces, tabs, and newlines

. ; // Ignore other characters

%%

int main() {
    printf("Enter a string: ");
    yylex(); // Call the lexical analyzer
    
    // Print words in reverse order
    printf("Reversed words: ");
    for (int i = wordCount - 1; i >= 0; i--) {
        printf("%s ", words[i]);
    }
    printf("\n");
    return 0;
}
