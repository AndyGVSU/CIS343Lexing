%{
	#include <stdio.h>
	int lines = 0;
%}

%%

END 		  { return 0; }
;	          { printf("END_STATEMENT"); }
POINT             { printf("POINT"); }
LINE		  { printf ("LINE"); }
CIRCLE            { printf("CIRCLE"); }
RECTANGLE         { printf("RECTANGLE"); }
SET_COLOR         { printf("SET_COLOR"); }
[0-9]+?\.[0-9]*   { printf("FLOAT"); }
[0-9]+            { printf("INT"); }
 
[ \t]
[\n]              { lines++; }
.                 { printf("Error: Invalid Character on Line ");
		    printf("%d",lines);
		    printf("\n"); 
		    return 1;
		  }

%%

int main(int argc, char** argv) {
	yylex();
	return 0;
}
