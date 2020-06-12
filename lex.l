%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h"

int row=1;
%}

%%
"PROGRAM"		{return PROGRAM;}
"VAR"			{return VAR;}
"BEGIN"			{return PBEGIN;}
"END"			{return END;}
"INTEGER"		{return INTEGER;}
"FOR"			{return FOR;}
"TO"			{return TO;}
"DO"			{return DO;}
"DIV"			{return DIV;}
"READ"			{return READ;}
"WRITE"			{return WRITE;}
[0-9]+ 			{return INT;}
[-/+*();:,=.] 		{return yytext[0];}
[a-zA-Z][0-9a-zA-Z]*	{return ID;}
[ ] 			{}
[\t]			{}
\n			{row++;}
. 			{return 0;}
%%

int yywrap(void) {
	return 1;
}
