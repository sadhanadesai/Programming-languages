%{
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
extern int lineno;
%}

%token TOK_MAIN TOK_LRBRACK TOK_RRBRACK TOK_LCBRACK TOK_RCBRACK TOK_PRINT
	TOK_SEMICOLON TOK_EQUALS TOK_NUM TOK_ID TOK_ADD TOK_SUB TOK_MUL TOK_DIV TOK_INTEGER

%union{
	int int_val;
	char id[100];
	}

%{

struct table
{
	char name[100];
	int value;
};
	     %}

%{
struct table symboltable[9000]; int pos=0; int label[10]={0,0,0,0,0,0,0,0,0,0};
int i=-1;
     %}

%type <int_val> exprs TOK_NUM
%type <id>  TOK_ID

%left TOK_MUL
%left TOK_SUB

%%

prog: TOK_MAIN TOK_LRBRACK TOK_RRBRACK TOK_LCBRACK stmts TOK_RCBRACK
    ;

stmts:  |stmt TOK_SEMICOLON stmts
;

stmt:	TOK_PRINT TOK_ID
	{
	 int k;int j=2;int m;
	for(k=pos-1;k>=0;k--)
	    {
		j=strcmp(symboltable[k].name,$2);

		if(j==0)
			{
			m=k;
			goto next;
			}
	   }
	next: printf("%d\n",symboltable[m].value);

	}

    |TOK_ID TOK_EQUALS exprs
	{
	int k; int j;int m;
	for(k=pos-1;k>=0;k--)
		{
		j=strcmp(symboltable[k].name,$1);
		if(j==0)
			{
			m=k;
			goto next1;
			}
		}
	next1: symboltable[m].value=$3;
	}

  | TOK_ID TOK_MUL TOK_EQUALS exprs
	{
	int k; int j;int m;
  for(k=pos-1;k>=0;k--)
	 {
	 j=strcmp(symboltable[k].name,$1);
	 if(j==0)
		 {
		 m*=k;
		 goto next2;
		 }
	 }
 next2: symboltable[m].value=$4;
 }
;

 | TOK_ID TOK_ADD TOK_EQUALS exprs

 {
 int k; int j;int m;
 for(k=pos-1;k>=0;k--)
  {
  j=strcmp(symboltable[k].name,$1);
  if(j==0)
 	 {
 	 m+=k;
 	 goto next3;
 	 }
  }
 next3: symboltable[m].value=$4;
 }

;


exprs:	TOK_NUM
     		{
		$$=$1;
		}


       |  TOK_ID
	  	{
		int k; int j;int m;
		for(k=pos-1;k>=0;k--)
		{
		j=strcmp(symboltable[k].name,$1);
		if(j==0)
			{
			m=k;
			goto next4;
			}
		}
		next4:$$=symboltable[m].value ;
	}

   | exprs TOK_ADD exprs
	{
	$$=$1+$3;
	}

  | exprs TOK_MUL exprs
	{
	$$=$1*$3;
	}

  | TOK_LRBRACK TOK_SUB TOK_NUM TOK_RRBRACK
	{$$=-$3;}

;


%%

int  yyerror(char *s)
	{
	fprintf(stderr,"Parsing error at line %d\n",lineno);
	return 0;
	}

int main()
	{
	struct table symboltable[9000];
	int pos=0; int label[10];
	int i=-1;
	yyparse();
	return 0;
	}
