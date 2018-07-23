%{
#include <stdlib.h> 
#include <stdio.h> 
#include <math.h>
int yylex(void); 
#include "y.tab.h"
%}

%token INTEGER
%% program:
line program | line
line:
bool '\n' { printf("%d\n",$1); }

bool:
bool "||" expr {$$ = $1 || $3;}
| bool "&&" expr {$$ = $1 && $3;}
| '!' bool {$$ = !$2;}
| expr	 {$$ = $1;}

expr:
expr '+' mulex { $$ = $1 + $3; } 
| expr '-' mulex { $$ = $1 - $3; } 
| mulex { $$ = $1; }


mulex:
mulex '*' term { $$ = $1 * $3; } 
| mulex '/' term { $$ = $1 / $3; } 
| term { $$ = $1; }


term:
term '^' fact {$$ = pow($1, $3);}
| fact {$$ = $1;}

fact:
'(' bool ')' { $$ = $2; }
| INTEGER { $$ = $1; }
 
%%
int yyerror(char *s)
{ 
fprintf(stderr,"%s\n",s); 
return 0;
}
int yywrap()
{
return(1); 
}
int main(void) {
yyparse(); 
return 0;
}
