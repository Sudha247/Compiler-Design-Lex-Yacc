%{
#include <stdio.h>
#include <stdlib.h>
int yyerror(char*);
extern int yylval;
#include "y.tab.h"

%}

%%

[ \t]+ ;
[0-9]+ {yylval = atoi(yytext);
	return INTEGER;}
[-+*/^!] {return *yytext;}
"&&" {return *yytext;}
"||" {return *yytext;}
"("  {return *yytext;}
")" {return *yytext;}
\n {return *yytext;}
. {
	char msg[25];
	sprintf(msg,"%s - <%s>","Invalid Character", yytext);
	yyerror(msg);}

%%