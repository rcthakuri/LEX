%{
	#include <stdio.h>
	int flag = 0;
%}

%%
(" "[aA][nN][dD]" ")|(" "[oO][rR]" ")|(" "[bB][uU][tT]" ") 	flag = 1;
%%

int main()
{
	printf("Enter test statement: ");
	yylex();

	if(flag == 1)
	{
		printf("Compund Staement");
	}
	else
	{
		printf("Not compund Statement");
	}
	return 0;
}
