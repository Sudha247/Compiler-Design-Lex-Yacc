%{
#include <stdio.h>
#include <stdlib.h>

typedef struct node{
	char data;
	struct node* left;
	struct node* right;
} node;

node* mknode(char d, node *L, node *R);
void print(node* r);
#define YYSTYPE struct node *
%}

%token '+' '-' '*' '/'
%token ID
%left '+' '-'
%left '*' '/'
%%

program:
line program | line

line:
expr '\n' {print($1);}

expr:
expr '+' mulex {$$ = mknode('+',$1,$3);}
| expr '-' mulex {$$ = mknode('-',$1,$3);}
| mulex {$$ = $1;}

mulex:
'('expr')'{$$ = $2;}
| ID {$$ = mknode((char)$1,NULL,NULL);}

%%

int main(){
	yyparse();
	return 0;
}

node* mknode(char d, node* L, node* R){
	node* t = (node*)malloc(sizeof(node));
	t->data = d;
	t->left = L;
	t->right = R;
	return t;
}

void print(node* r){
	printf("Data: %c\n",r->data);

}