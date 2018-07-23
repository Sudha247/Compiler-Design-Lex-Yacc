%{
#include "y.tab.h"
void yyerror(char *);
%}

%%
[0-9A-Za-z] {yylval = (char)yytext[0];
return ID;}
[-+*/^] {return *yytext;}
\n {return *yytext;}
. {
	char msg[25];
	sprintf(msg,"%s - <%s>","Invalid character", yytext);
	yyerror(msg);
}

%%

int yywrap(){
	return 1;
}

void yyerror(char *s){
	printf("Error - <%s>",s);
}