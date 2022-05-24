%{
    #include <cstdio>
    using namespace std;
    int yylex();
    extern int yylineno;

    void yyerror(const char * s){
        fprintf(stderr, "Line %d, error: %s\n", yylineno, s);
    }
%}


%union{
    const char* string_t;
    int int_t;
    float float_t;
}

%token TK_NUMBER TK_BOOLEAN TK_STRING TK_ARRAY TK_BREAK
%token TK_CONST TK_DO TK_ELSE TK_FALSE TK_FOR TK_IF TK_IN TK_RETURN 
%token TK_TRUE TK_VAR TK_VOID TK_WHILE TK_LET TK_OF TK_CONTINUE TK_LIT_NUMBER TK_ABRELLAVE TK_CIERRALLAVE
%token TK_IDENTIFICADOR TK_ASTERISCO TK_SUMA TK_SUMAIGUAL TK_YIGUAL TK_AND TK_DOBLEIGUAL TK_OR TK_DISTINTO 
%token TK_RESTA TK_ABREP TK_CIERRAP TK_RESTAIGUAL TK_ORIGUAL TK_MENOR TK_MENORIGUAL TK_ABREC TK_CIERRAC TK_UP 
%token TK_ASTERISCOIGUAL TK_UPIGUAL TK_MAYOR TK_MAYORIGUAL TK_PLECA TK_PLECAIGUAL 
%token TK_MASMAS TK_IGUAL TK_DOSPUNTOSIGUAL TK_COMMA TK_PUNTOCOMMA TK_PORCENTAJE TK_PORCENTAJEIGUAL TK_MENOSMENOS
%token TK_EXCLAMACION TK_LIT_STRING TK_DOSPUNTOS TK_IMPORT TK_FROM TK_PRINT TK_FUNCTION TK_ARROWFUNC

%%

input:input external_declaration
    | external_declaration
    ;

external_declaration: declaration
    | statements 
    ;

declaration: TK_VAR TK_IDENTIFICADOR TK_DOSPUNTOS type TK_PUNTOCOMMA
    ;

type: TK_NUMBER
    | TK_BOOLEAN
    | TK_STRING
    ;

statements:
    | statements statement
    ;

statement: if_stmt
    | for_stmt
    | while_stmt
    | assignation_stmt
    | break_stmt
    | continue_stmt
    ;

if_stmt: TK_IF TK_ABREP expression TK_CIERRAP TK_ABRELLAVE statement TK_CIERRALLAVE
    | TK_IF TK_ABREP expression TK_CIERRAP TK_ABRELLAVE statement TK_CIERRALLAVE TK_ELSE TK_ABRELLAVE statement TK_CIERRALLAVE
    ;

for_stmt: TK_FOR
    ;

while_stmt: TK_WHILE
    ;

assignation_stmt: TK_CONST
    ;

break_stmt: TK_BREAK TK_PUNTOCOMMA
    ;

continue_stmt: TK_CONTINUE TK_PUNTOCOMMA
    ;    

primary_expression: '(' expression ')' 
    | TK_IDENTIFICADOR
    | constant 
    | TK_LIT_STRING 
    ;

assignment_expression: unary_expression assignment_operator assignment_expression 
                     | logical_or_expression 
                     ;

postfix_expression: primary_expression 
                    | postfix_expression '[' expression ']'
                    | postfix_expression '(' ')' 
                    | postfix_expression '(' argument_expression_list ')' 
                    | postfix_expression TK_MASMAS 
                    | postfix_expression TK_MENOSMENOS 
                    ;


argument_expression_list: argument_expression_list ',' assignment_expression 
                        | assignment_expression 
                        ;

unary_expression: TK_MASMAS unary_expression 
                | TK_MENOSMENOS unary_expression
                | TK_EXCLAMACION unary_expression  
                | postfix_expression 
                ;

multiplicative_expression: multiplicative_expression '*' unary_expression 
      | multiplicative_expression '/' unary_expression
      | unary_expression 
      ;

additive_expression:  additive_expression '+' multiplicative_expression
                    | additive_expression '-' multiplicative_expression 
                    | multiplicative_expression 
                    ;

relational_expression: relational_expression '>' additive_expression
                     | relational_expression '<' additive_expression 
                     | relational_expression TK_MAYORIGUAL additive_expression 
                     | relational_expression TK_MENORIGUAL additive_expression 
                     | additive_expression 
                     ;

equality_expression:  equality_expression TK_DOBLEIGUAL relational_expression 
                   | equality_expression TK_DISTINTO relational_expression 
                   | relational_expression 
                   ;

logical_or_expression: logical_or_expression TK_OR logical_and_expression 
                    | logical_and_expression 
                    ;

logical_and_expression: logical_and_expression TK_AND equality_expression
                      | equality_expression 
                      ;

assignment_operator: '=' 
                   | TK_SUMAIGUAL 
                   | TK_RESTAIGUAL 
                   ;

expression: assignment_expression 
          ;

constant: TK_LIT_NUMBER
        ;
%%