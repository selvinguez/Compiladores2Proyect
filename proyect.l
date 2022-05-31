%option noyywrap
%option yylineno
%x comment 
%x comment2 
%{
    #include "tokens.h"
%}


IDENTIFICADOR [A-Za-z][A-Za-z0-9]*

%%
[\t \r \n] {/*ignore*/ }
"/*" {BEGIN(comment);}
"//" {BEGIN(comment2);}
\".*\" { return TK_LIT_STRING; }
\'.*\' { return TK_LIT_STRING; }
"number" {return TK_NUMBER;}
"new" {return TK_NEW;}
"push" {return TK_PUSH;}
"boolean" {return TK_BOOLEAN;}
"string" {return TK_STRING ;}
"Array" {return TK_ARRAY;}
"break" { return TK_BREAK; }
"const" {return TK_CONST;}
"do" {return TK_DO;}
"else" { return TK_ELSE;}
"false" { return TK_FALSE;}
"for" {  return TK_FOR;}
"if" { return TK_IF;}
"in" { return TK_IN;}
"return" { return TK_RETURN;}
"true" {return TK_TRUE;}
"var" {return TK_VAR;}
"void"  {return TK_VOID;}
"while" { return TK_WHILE;}
"let" { return TK_LET;}
"of" { return TK_OF;}
"continue" { return TK_CONTINUE;}
"import" { return TK_IMPORT;}
"from" {return TK_FROM;}
"console.log" { return TK_PRINT;}
"function" { return TK_FUNCTION;}
[0-9]+ {  return TK_LIT_NUMBER;}
{IDENTIFICADOR} {   return TK_IDENTIFICADOR; }

\* { return TK_ASTERISCO;}
"++" {return TK_MASMAS;}
"." {return TK_PUNTO;}
"+" { return TK_SUMA;}
"+="     { return TK_SUMAIGUAL; }
"&="   { return TK_YIGUAL; }
"&&"     {  return TK_AND; }
"=="    {  return TK_DOBLEIGUAL; }
"!="     {  return TK_DISTINTO; }
"--" {return TK_MENOSMENOS;}
"-" { return TK_RESTA;}
"(" {return TK_ABREP;}
")" {return TK_CIERRAP;}
"-=" {return TK_RESTAIGUAL;}
"|=" {return TK_ORIGUAL;}
"||" {return TK_OR;}
"<" {return TK_MENOR;}
"<=" {return TK_MENORIGUAL;}
"[" {return TK_ABREC;}
"]" {return TK_CIERRAC;}
"^" {return TK_UP;}
"*=" {return TK_ASTERISCOIGUAL;}
"^=" {return TK_UPIGUAL;}
">" {return TK_MAYOR;}
">=" {return TK_MAYORIGUAL;}
"{" {return TK_ABRELLAVE;}
"}" {return TK_CIERRALLAVE;}
"/" {return TK_PLECA;}
"/=" {return TK_PLECAIGUAL;}

"=" {return TK_IGUAL;}
"," {return TK_COMMA;}
";" {return TK_PUNTOCOMMA;}
"%" {return TK_PORCENTAJE;}
"%=" {return TK_PORCENTAJEIGUAL;}

"!" {return TK_EXCLAMACION;}
":" {return TK_DOSPUNTOS;}
"=>" {return TK_ARROWFUNC;}




. {printf("Invalid character %c\n",*yytext);}

<comment>"*/" {BEGIN(INITIAL);}
<comment>.|\n {/* nada*/}
<comment><<EOF>> {printf("incomplete comment, line %d\n",yylineno);}

<comment2>"\n" { BEGIN(INITIAL);}
<comment2>. {/* nada*/}
<comment2><<EOF>> {printf("incomplete comment, line %d\n",yylineno);}
%%