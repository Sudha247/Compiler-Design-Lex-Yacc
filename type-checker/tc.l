%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
int yyerror(char*);
extern int yylval;
%}

true "T"|"t"
false "F"|"f"
%%
[-+*/] {return *yytext;}
"==" {return *yytext;}
[0-9]+ {return INTEGER;}
[0-9]+"."[0-9]+ {return DOUBLE;}
"T"|"F"|'t'|'f' {return BOOLEAN;}
\n  {return *yytext;}
. {
	char msg[25];
	sprintf(msg,"%s - <%s>","Invalid character",yytext);
	yyerror(msg);
}

%%