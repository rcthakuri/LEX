%{
	/* Program to check arithmetic expression and count operator if valid */

	#include <stdio.h>
	#include <stdlib.h>
	
	int pc = 0;
	int sc = 0;
	int mc = 0;
	int dc = 0;
	int valid = 0;
	int i;
%}

oprnd		[a-zA-Z0-9]
opr		[+*/-]

%%
{oprnd}({opr}{oprnd})+[\n] 	{
				 	valid = 1;
					for(i = 0; yytext[i] != '\0'; i++)
					{
						switch(yytext[i])
						{
							case '+':
									pc++;
									break;
							case '-':
									sc++;
									break;
							case '*':
									mc++;
									break;
							case '/':
									dc++;
									break;
						}
					}
					return 0;
				}
^{oprnd}[\n]			{	
					printf("\nOnly operand\n");
					exit(0);
				}
%%

int main()
{
	printf("Enter expression to check: ");
	yylex();

	if(valid = 1)
	{
		printf("\nEnter expression is valid arithmetic expresion\n");
		printf("+ = %d\n- = %d\n* = %d\n / = %d\n", pc, sc, mc, dc);
	}
	else
	{
		printf("\nInvalid arithmetic expression\n");
		exit(1);
	}
	return 0;
}

