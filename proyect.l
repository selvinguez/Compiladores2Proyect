%option noyywrap
%option yylineno
%x comment 
%x comment2 
%{
    #define YYSTYPE char*
    enum yytokentype{
        TK_NUMBER = 258,
        TK_BOOLEAN = 259,
        TK_STRING = 260,
        TK_ARRAY = 261, 
        TK_BREAK = 262,
        TK_CONST = 263,
        TK_DO = 264,
        TK_ELSE = 265, 
        TK_FALSE = 266,
        TK_FOR = 267,
        TK_IF = 268,
        TK_IN = 269,
        TK_RETURN = 270,
        TK_TRUE = 271,
        TK_VAR = 272,
        TK_VOID = 273,
        TK_WHILE = 274,
        TK_LET = 275,
        TK_OF = 276,
        TK_CONTINUE = 277,
        TK_NUMBERR = 278,
        TK_IDENTIFICADOR = 279,
        TK_ASTERISCO = 280,
        TK_SUMA = 281,
        TK_SUMAIGUAL = 282,
        TK_YIGUAL =283,
        TK_AND = 284,
        TK_DOBLEIGUAL = 285,
        TK_OR = 286,
        TK_DISTINTO = 287,
        TK_RESTA = 288,
        TK_ABREP = 289,
        TK_CIERRAP = 290,
        TK_RESTAIGUAL = 291,
        TK_ORIGUAL = 292,
        TK_MENOR = 293,
        TK_MENORIGUAL = 294,
        TK_ABREC = 295,
        TK_CIERRAC = 296,
        TK_UP = 297,
        TK_ASTERISCOIGUAL = 298,
        TK_UPIGUAL = 299,
        TK_MAYOR = 300,
        TK_MAYORIGUAL = 301,
        TK_ABREIGUAL = 302,
        TK_CIERRAIGUAL = 303,
        TK_PLECA = 304,
        TK_PLECAIGUAL = 305,
        TK_MASMAS = 306,
        TK_IGUAL = 307,
        TK_DOSPUNTOSIGUAL = 308,
        TK_COMMA = 309,
        TK_PUNTOCOMMA = 310,
        TK_PORCENTAJE = 311,
        TK_PORCENTAJEIGUAL = 312,
        TK_MENOSMENOS = 313,
        TK_EXCLAMACION = 314,
        TK_LIT_STRING = 315,
        TK_DOSPUNTOS = 316,
        TK_IMPORT = 317,
        TK_FROM = 318,
        TK_PRINT = 319,
        TK_FUNCTION = 320,
        TK_ARROWFUNC = 321
    };
  
    extern char* yylval;
   
    
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
[0-9]+ { yylval = strdup(yytext);printf("Token %s",yytext); return TK_NUMBERR;}
{IDENTIFICADOR} { printf("Token %s",yytext); yylval = strdup( yytext); return TK_IDENTIFICADOR; }

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
"{" {printf("Token %s",yytext);return TK_ABREIGUAL;}
"}" {printf("Token %s",yytext);return TK_CIERRAIGUAL;}
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