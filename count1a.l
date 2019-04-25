%{
	/*Lex program to count word, char, blank and new line */
	#include <stdio.h>
	#include <stdlib.h>

	int wordc  = 0;
	int charc  = 0;
	int blankc = 0;
	int linec = 0;
%}

word [^ \t\n]+
eol [\n]

%%

{word}		{ wordc++; 
		  charc += yyleng;
		}

[ ] 		{ blankc++;
		  charc++;
		}
[\t]		{ blankc += 6;
		  charc += 6;
		}
{eol} 		linec++;
%%

int main(int argc, char **argv)
{
	if(argc > 1)
	{
		FILE *file;
		file = fopen(argv[1], "r");

		if(!file)
		{
			printf("\n%s can not be read, please check the file name\n", argv[1]);
			exit(1);
		}
		
		yyin = file;
		yylex();

		printf("Word = %d\nChar = %d\nBlank = %d\nLine = %d\n", wordc, charc, blankc, linec);
	}
	else
	{
		printf("\nPlease pass file as arguments\n");
		exit(1);
	}	
	return 0;
}
