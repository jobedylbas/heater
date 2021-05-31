%{
#include <stdio.h>
#include "y.tab.h"
#include "string.h"

int temperature = 22;
int isOn = 0;
int lineNumber = 0;
int getLineNumber() { return lineNumber; };
int getTemperature() { return temperature; };
int heaterIsOn() { return isOn; };
%}

%%
[0-9]+                   { temperature = atoi(yytext); yylval=atoi(yytext); return NUMBER; }

"aquecedor"              { return TOKHEATER; }

ligar|desligar           { isOn=!strcmp(yytext,"ligar"); yylval=!strcmp(yytext,"ligar"); return STATE; }

"setar"                  { return TOKSET; }

"ver"                    { return TOKGET; }

"conte"                  { return TOKTELL; }

"uma piada"              { return TOKJOKE; }

"um elogio"              { return TOKCOMPLIMENT; }

"temperatura"            { return TOKTEMPERATURE; }

"esta ligado?"           { return TOKISON; }

"ajuda"                  { return TOKHELP; }

[ \t]+

\n                    

.                        { return TOKERROR; }

%%