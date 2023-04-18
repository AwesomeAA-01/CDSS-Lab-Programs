%{ 
    #include <stdio.h> 
    
    int idCount=0; 
%}
letter [a-zA-Z] 
digit [0-9] 
%% 
{letter}({letter}|{digit})* {
    idCount++;
}
%%

int yywrap(void) {
    return 1;
}

int main() {
    yyin = fopen("f2.txt", "r");
    if (yyin == NULL) {
        printf("File does not exist.\n");
    } else {
        yylex();
        printf("\nTotal number of identifiers: %d\n", idCount);
    }
    return 0;
}
