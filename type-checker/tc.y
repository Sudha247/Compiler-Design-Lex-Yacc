%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"

int max(int a, int b){

	if(a == 2 && b == 2){return 2;}
	if(a == 2 || b == 2){return 3;}
	if(a == b){return a;}
	if(a>b){return a;}
	else {return b;}
}

%}

%token INTEGER DOUBLE BOOLEAN

%%

program:
line program | line

line:
bool '\n' {printf("%d\n",$1);}

bool:
bool '+' mulex {$$ = max($1,$3);}
| mulex {$$ = $1;}

mulex:
mulex '==' fact {$$ = 2;}
| fact

fact:
'('bool')' {$$ = $2;}
| INTEGER {$$ = 0;}
| DOUBLE {$$ = 1;}
| BOOLEAN {$$ = 2;}

%%

void yyerror(char *s){
	fprintf(stderr,"%s\n",s);
	return;
}

int yywrap(){
	return 1;
}

int main(){
	yyparse();
	return 0;
}