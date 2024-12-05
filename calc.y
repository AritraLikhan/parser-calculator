%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#define YYSTYPE double
int yylex(void);
void yyerror(char*);


%}

%token INTEGER FLOAT LPAREN RPAREN COMMA EOL
%right EQL
%left PLUS MINUS
%left ASTERISK SLASH


%%

strt: strt stmt EOL { printf("= %lf\n", $2); }
	| strt EOL { printf("\n"); }
	|
;


stmt: EQL expr           { $$ = $2;}
    | expr                         { $$ = $1; }
;


expr: expr PLUS term          { $$ = $1 + $3; }
    | expr MINUS term         { $$ = $1 - $3; }
    | term  { $$ = $1; }
;

term: term ASTERISK unary     { $$ = $1 * $3; }
    | term SLASH unary       { $$ = $1 / $3; }
    | unary                     { $$ = $1; }
;

unary: MINUS unary            { $$ = $2 * -1; }
     | factor                  { $$ = $1; }
;

factor: INTEGER                                        { $$ = $1; }
    | FLOAT                                       { $$ = $1; }
    | LPAREN expr RPAREN                        { $$ = ($2); }
;


%%
void yyerror(char *s)
{
	fprintf(stderr, ">> %s\n", s);
}
int main()
{
	yyparse();
	return 0;
}
