%{
	#include <stdio.h>
 	#include <stdlib.h>

	int commentC = 0;
%}

%x CMNT

%%
"/*" 	{ BEGIN CMNT;
	  commentC++;
	}

<CMNT>. ;
<CMNT>\n ;
<CMNT>"*/" { BEGIN 0; }
%%

int main(int argc, char **argv)
{
	if(argc != 3)
	{
		printf("\nPlease pass two argument, first arg as input file and second arg as ouput file\n");
		exit(1);
	}

	FILE *file1;
	FILE *file2;

	file1 = fopen(argv[1], "r");
	file2 = fopen(argv[2], "w");

	yyin = file1;
	yyout = file2;
	
	if(!file1)
	{
		printf("\nInput file does not exist, check file name\n");
		exit(1);
	}

	yylex();
	printf("\ntotal comment is %d\n", commentC);

	return 0;
}
