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
\".*\" { printf("Token %s",yytext);return TK_LIT_STRING; }
\'.*\' { printf("Token %s",yytext);return TK_LIT_STRING; }
"number" {printf("Token %s",yytext);return TK_NUMBER;}
"boolean" {printf("Token %s",yytext);return TK_BOOLEAN;}
"string" {printf("Token %s",yytext);return TK_STRING ;}
"array" {printf("Token %s",yytext);return TK_ARRAY;}
"break" {printf("Token %s",yytext); return TK_BREAK; }
"const" {printf("Token %s",yytext);return TK_CONST;}
"do" { printf("Token %s",yytext);return TK_DO;}
"else" {printf("Token %s",yytext); return TK_ELSE;}
"false" {printf("Token %s",yytext); return TK_FALSE;}
"for" { printf("Token %s",yytext); return TK_FOR;}
"if" { printf("Token %s",yytext);return TK_IF;}
"in" {printf("Token %s",yytext); return TK_IN;}
"return" {printf("Token %s",yytext); return TK_RETURN;}
"true" {printf("Token %s",yytext);return TK_TRUE;}
"var" {printf("Token %s",yytext); return TK_VAR;}
"void"  {printf("Token %s",yytext);return TK_VOID;}
"while" {printf("Token %s",yytext); return TK_WHILE;}
"let" { printf("Token %s",yytext);return TK_LET;}
"of" { printf("Token %s",yytext);return TK_OF;}
"continue" {printf("Token %s",yytext); return TK_CONTINUE;}
"import" { printf("Token %s",yytext);return TK_IMPORT;}
"from" {printf("Token %s",yytext); return TK_FROM;}
"console.log" {printf("Token %s",yytext); return TK_PRINT;}
"function" {printf("Token %s",yytext); return TK_FUNCTION;}
[0-9]+ { printf("Token %s",yytext); return TK_LIT_NUMBER;}
{IDENTIFICADOR} { printf("Token %s",yytext);  return TK_IDENTIFICADOR; }

\* { printf("Token %s",yytext);return TK_ASTERISCO;}
"+" { printf("Token %s",yytext);return TK_SUMA;}
"+="     { printf("Token %s",yytext);return TK_SUMAIGUAL; }
"&="   { printf("Token %s",yytext); return TK_YIGUAL; }
"&&"     { printf("Token %s",yytext); return TK_AND; }
"=="    { printf("Token %s",yytext); return TK_DOBLEIGUAL; }
"!="     { printf("Token %s",yytext); return TK_DISTINTO; }
"-" {printf("Token %s",yytext); return TK_RESTA;}
"(" {printf("Token %s",yytext);return TK_ABREP;}
")" {printf("Token %s",yytext);return TK_CIERRAP;}
"-=" {printf("Token %s",yytext);return TK_RESTAIGUAL;}
"|=" {printf("Token %s",yytext);return TK_ORIGUAL;}
"||" {printf("Token %s",yytext);return TK_OR;}
"<" {printf("Token %s",yytext);return TK_MENOR;}
"<=" {printf("Token %s",yytext);return TK_MENORIGUAL;}
"[" {printf("Token %s",yytext);return TK_ABREC;}
"]" {printf("Token %s",yytext);return TK_CIERRAC;}
"^" {printf("Token %s",yytext);return TK_UP;}
"*=" {printf("Token %s",yytext);return TK_ASTERISCOIGUAL;}
"^=" {printf("Token %s",yytext);return TK_UPIGUAL;}
">" {printf("Token %s",yytext);return TK_MAYOR;}
">=" {printf("Token %s",yytext);return TK_MAYORIGUAL;}
"{" {printf("Token %s",yytext);return TK_ABRELLAVE;}
"}" {printf("Token %s",yytext);return TK_CIERRALLAVE;}
"/" {printf("Token %s",yytext);return TK_PLECA;}
"/=" {printf("Token %s",yytext);return TK_PLECAIGUAL;}
"++" {printf("Token %s",yytext);return TK_MASMAS;}
"=" {printf("Token %s",yytext);return TK_IGUAL;}
":=" {printf("Token %s",yytext);return TK_DOSPUNTOSIGUAL;}
"," {printf("Token %s",yytext);return TK_COMMA;}
";" {printf("Token %s",yytext);return TK_PUNTOCOMMA;}
"%" {printf("Token %s",yytext);return TK_PORCENTAJE;}
"%=" {printf("Token %s",yytext);return TK_PORCENTAJEIGUAL;}
"--" {printf("Token %s",yytext);return TK_MENOSMENOS;}
"!" {printf("Token %s",yytext);return TK_EXCLAMACION;}
":" {printf("Token %s",yytext);return TK_DOSPUNTOS;}
"=>" {printf("Token %s",yytext);return TK_ARROWFUNC;}




. {printf("Invalid character %c\n",*yytext);}

<comment>"*/" {printf("Comentario encontrado %s\n",yytext); BEGIN(INITIAL);}
<comment>.|\n {/* nada*/}
<comment><<EOF>> {printf("incomplete comment, line %d\n",yylineno);}

<comment2>"\n" {printf("Comentario encontrado %s",yytext); BEGIN(INITIAL);}
<comment2>. {/* nada*/}
<comment2><<EOF>> {printf("incomplete comment, line %d\n",yylineno);}
%%