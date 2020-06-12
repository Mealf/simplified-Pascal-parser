%{
#include<stdio.h>
void yyerror(char const *s); 
%}

%token PROGRAM VAR PBEGIN END INTEGER
%token FOR TO DO READ WRITE INT ID

%left '+' '-'
%left '*' DIV
%start prog

%%
prog 
	: PROGRAM prog_name VAR dec_list PBEGIN stmt_list END '.'
	;

prog_name 
	: ID
	;

dec_list 
	: dec 
	| dec_list ';' dec
	;

dec 
	: id_list ':' type
	;

type 
	: INTEGER
	;

id_list
	: ID 
	| id_list ',' ID
	;

stmt_list 
	: stmt
	| stmt_list ';' stmt
	;

stmt 
	: assign 
	| read
	| write
	| for
	;

assign 
	: ID ':''=' exp
	;


exp 
	: exp '+' exp
     	| exp '-' exp 
     	| exp '*' exp
    	| exp DIV exp 
     	| INT
	| ID      
    	| '(' exp ')'
    	;

read 
	: READ '(' id_list ')'
	;

write 
	: WRITE '(' id_list ')'
	;

for 
	: FOR index_exp DO body
	;

index_exp 
	: ID ':''=' exp TO exp
	;

body 
	: stmt
	| PBEGIN stmt_list END
	;

%%
#include <stdio.h>

extern int row;
int isError = 0;

int main() {
	yyparse();
	if(isError==0)
		printf("complele!\n");
	return 0;
}
void yyerror (char const *s)
{
	isError = 1;
  	fprintf (stderr, "%s at line %d\n", s, row);
}
