%{
#include <stdio.h>
#include <string.h>

int yylex();
int yyparse();
int getTemperature();
int heaterIsOn();

void yyerror(const char *str)
{
    printf("error: %s\n", str);
}
 
int yywrap()
{
    return 1;
} 
  
int main()
{
    yyparse();
} 
%}

%token TOKGET
%token TOKHELP
%token NUMBER
%token TOKHEATER
%token STATE
%token TOKSET
%token TOKISON
%token TOKTELL
%token TOKTEMPERATURE
%token TOKJOKE
%token TOKCOMPLIMENT
%token TOKERROR

%%

commands: command
    | commands command
    ;

command:
    | heatSwitch
    | setTemperature
    | getTemperature
    | tellJoke
    | tellAdvice
    | isOn
    | help
    ;

heatSwitch: TOKHEATER STATE                                     {if ($2) printf("\tAquecedor ligado\n"); else printf("\tAquecedor desligado\n");}
    ;

setTemperature: TOKHEATER TOKSET TOKTEMPERATURE NUMBER          {printf("\tTemperatura definida para %d\n", $4);}
    ;

getTemperature: TOKHEATER TOKGET TOKTEMPERATURE                 {printf("\tTemperatura atual é %d\n", getTemperature());}
    ;

isOn: TOKHEATER TOKISON                                         {if (heaterIsOn()) printf("\tAquecedor ligado\n"); else printf("\tAquecedor desligado\n");}
    ;

tellJoke: TOKHEATER TOKTELL TOKJOKE                             {printf("\tO que são dois pontos cinzas no mar? Um two-barão!\n");}
    ;

tellAdvice: TOKHEATER TOKTELL TOKCOMPLIMENT                     {printf("\tVocê é demais!!!!!\n");};
    ;

help: TOKHEATER TOKHELP                                         {printf("\tUso: aquecedor [comandos] [argumento]\nComandos:\n\tligar\n\tdesligar\n\tsetar temperatura INTEIRO\n\testá ligado?\n\tver temperatura\n\tconte uma piada\n");}
    ;