%{
#include <stdlib.h>
#include <stdio.h>
#include "y.tab.h"
extern YYSTYPE yylval;
void yyerror(char*);
%}

%%
"+" {
    printf("PLUS  ");
	return PLUS;
}
"-" {
    printf("MINUS  ");
	return MINUS;
}
"*" {
    printf("ASTERISK  ");
	return ASTERISK;
}
"/" {
    printf("SLASH  ");
	return SLASH;
}

"=" {
    printf("EQL  ");
	return EQL;
}
"(" {
    printf("LPAREN  ");
	return LPAREN;
}
")" {
    printf("RPAREN  ");
	return RPAREN;
}


[0-9]+ {
    printf("INTEGER  ");
	sscanf(yytext, "%lf", &yylval);
	return INTEGER;
}
[0-9]+(\.?[0-9]*e?-?[0-9]*)?  {
	sscanf(yytext, "%lf", &yylval);
	printf("FLOAT  ");
	return FLOAT;
}

\n {
	return EOL;
}
[ \t]+ {}
. {
	yyerror("ERROR: Unrecognized input!");
}

%%

int yywrap()
{
	return 1;
}
