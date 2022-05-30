%{
    #include<string.h>
    int i, m;
    struct symtab{
        char name[200];
        char type[200];
    }sym[200];
    FILE *yyin;
    int checksymtab(char *temp);
%}

ws [\t ]
digit [0-9]
alpha [a-zA-Z]
id {alpha}({alpha}{digit})*
accessspc "public" | "private" | "protected"
st "static"

%%

#include{ws}*<{id}\.h>  {printf("\n%s, is a Preprocessor directive to header file", yytext);}

using{ws}*namespace{ws}*std;    {printf("\n%s, Using the namespace named standard", yytext);}

#define{ws}+{id}{ws}+({alpha}|{digit})*   {printf("\n%s, MACRO", yytext);}

"int"{ws}+{id}{ws}*\(({ws}*{id}{ws}*,)*({ws}*{id}{ws}*)?\)   {printf("\n%s Function", yytext);}

{id}{ws}*\(({ws}*{id}{ws}*,)*({ws}*{id}{ws}*)?\); {printf("\n%s Functioncalled", yytext);}

[+\-\*\/\%\=] {printf("\n%s : Arithmetic Operator", yytext);}

[<>]=? {printf("\n%s : Relational Operator", yytext);}

{id}  {
		printf("\n %s : Identifier",yytext);
			strcpy(sym[m].name, yytext);
            strcpy(sym[m].type, "identifier");
			m++;
	}

{digit}*\.{digit}* {
    printf("\n %s : is an Arithmetic number", yytext);
    strcpy(sym[m].name, yytext);
    strcpy(sym[m].type, "Arithmetic Digit");
    m++;
}

{id}"["{digit}*"]" {
    printf("\n%s : is a an array", yytext);
    strcpy(sym[m].name, yytext);
    strcpy(sym[m].type, "Array");
    m++;
}


%%

int main(){
    printf("Enter ");
    yylex();

    printf("\n\n\n\t------------------------\n");
 	printf("\tIndex\tSymbol name\t\t\tSymbol Type");
 	printf("\t\t\n--------------------------\n");

    for( i = 0 ; i < m ; i++){
        printf("\t %d\t %s\t\t\t %s", i, sym[i].name, sym[i].type);
        printf("\n");
    }
    yywrap();
}

extern int yywrap()
{
    return 1;
}