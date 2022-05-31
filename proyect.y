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
%token TK_ASTERISCOIGUAL TK_UPIGUAL TK_MAYOR TK_MAYORIGUAL TK_PLECA TK_PLECAIGUAL  TK_PUNTO TK_PUSH
%token TK_MASMAS TK_IGUAL TK_COMMA TK_PUNTOCOMMA TK_PORCENTAJE TK_PORCENTAJEIGUAL TK_MENOSMENOS
%token TK_EXCLAMACION TK_LIT_STRING TK_DOSPUNTOS TK_IMPORT TK_FROM TK_PRINT TK_FUNCTION TK_ARROWFUNC TK_NEW

%%

input: external_declaration
    ;

external_declaration: statements 
    ;

declaration: declaration_type TK_IDENTIFICADOR TK_DOSPUNTOS type array_brackets TK_PUNTOCOMMA
    ;

array_brackets: TK_ABREC TK_CIERRAC
    | %empty
    ;


declaration_type: TK_VAR
    | TK_LET
    ;

decl_assign_stmt: declaration_type TK_IDENTIFICADOR TK_DOSPUNTOS type array_brackets TK_IGUAL assign_arrow_func_exp TK_PUNTOCOMMA
    | declaration_type TK_IDENTIFICADOR TK_IGUAL assign_arrow_func_exp TK_PUNTOCOMMA
    ;

type: TK_NUMBER
    | TK_BOOLEAN
    | TK_STRING
    ;

array_type: TK_ABREC array_parameter_list TK_CIERRAC
    ;

array_parameter_list: array_parameter_list TK_COMMA array_parameter
    | array_parameter
    ;

array_parameter: logical_or_expression
    ;

assign_arrow_func_exp: logical_or_expression
    | array_type
    | arrow_function
    | TK_NEW TK_ARRAY TK_ABREP TK_LIT_NUMBER TK_CIERRAP
    ;

statements: %empty
    | statements statement
    ;

statement: declaration
    | if_stmt
    | for_stmt
    | while_stmt
    | do_while_stmt
    | decl_assign_stmt
    | const_stmt
    | assignment_expression
    | break_stmt
    | continue_stmt
    | print_stmt
    | import_stmt
    | return_stmt
    | function_stmt
    | arreglo_expression
    | method_expression
    ;

arreglo_expression: TK_IDENTIFICADOR TK_PUNTO TK_PUSH TK_ABREP  primary_expression TK_CIERRAP TK_PUNTOCOMMA;

method_expression: TK_IDENTIFICADOR TK_ABREP method_parameters TK_CIERRAP TK_PUNTOCOMMA
    ;

method_parameters: method_parameters TK_COMMA method_parameter
    | method_parameter
    ;

method_parameter: primary_expression
    | %empty
    ;

if_stmt: TK_IF TK_ABREP expression TK_CIERRAP TK_ABRELLAVE statements TK_CIERRALLAVE elifs elseF
    | TK_IF TK_ABREP expression TK_CIERRAP TK_ABRELLAVE statements TK_CIERRALLAVE elseF
    ;

elseF: TK_ELSE TK_ABRELLAVE statements TK_CIERRALLAVE
    | %empty
    ;

elifs : elifs elif
    | elif
    ;

elif: TK_ELSE TK_IF TK_ABREP expression TK_CIERRAP TK_ABRELLAVE statements TK_CIERRALLAVE
    ;

for_stmt: TK_FOR TK_ABREP decl_assign_stmt expression TK_PUNTOCOMMA unary_expression TK_CIERRAP TK_ABRELLAVE statements TK_CIERRALLAVE
    | TK_FOR TK_ABREP declaration_type TK_IDENTIFICADOR type_for_each TK_IDENTIFICADOR TK_CIERRAP TK_ABRELLAVE statements TK_CIERRALLAVE
    ;

type_for_each: TK_OF
    | TK_IN
    ;

while_stmt: TK_WHILE TK_ABREP expression TK_CIERRAP TK_ABRELLAVE statements TK_CIERRALLAVE
    ;

do_while_stmt: TK_DO TK_ABRELLAVE statements TK_CIERRALLAVE TK_WHILE TK_ABREP expression TK_CIERRAP TK_PUNTOCOMMA
    ;

const_stmt: TK_CONST TK_IDENTIFICADOR TK_IGUAL assign_arrow_func_exp TK_PUNTOCOMMA
    ;

break_stmt: TK_BREAK TK_PUNTOCOMMA
    ;

continue_stmt: TK_CONTINUE TK_PUNTOCOMMA
    ;    

print_stmt: TK_PRINT TK_ABREP expression TK_CIERRAP TK_PUNTOCOMMA
    ;

import_stmt: TK_IMPORT TK_ABRELLAVE TK_IDENTIFICADOR TK_CIERRALLAVE TK_FROM TK_LIT_STRING TK_PUNTOCOMMA
    ;

return_stmt: TK_RETURN expression TK_PUNTOCOMMA
    ;

function_stmt: TK_FUNCTION TK_IDENTIFICADOR TK_ABREP parameter_list TK_CIERRAP TK_ABRELLAVE statements TK_CIERRALLAVE
    ;

parameter_list: parameter_list TK_COMMA parameter
    | parameter
    ;

parameter: TK_IDENTIFICADOR

arrow_function: TK_ABREP arrow_parameters TK_CIERRAP TK_DOSPUNTOS type_arrow_func TK_ARROWFUNC TK_ABRELLAVE statements TK_CIERRALLAVE
    ;

type_arrow_func: type array_brackets
    | TK_VOID
    ;

arrow_parameters: arrow_parameters TK_COMMA arrow_parameter
    | arrow_parameter
    ;

arrow_parameter: TK_IDENTIFICADOR TK_DOSPUNTOS type array_brackets
    ;

primary_expression: TK_ABREP expression TK_CIERRAP 
    | TK_IDENTIFICADOR
    | constant 
    | TK_LIT_STRING
    | TK_TRUE
    | TK_FALSE 
    | array_type 
    ;

assignment_expression: unary_expression assignment_operator assignment_expression TK_PUNTOCOMMA
                     | logical_or_expression
                    
                     ;

postfix_expression: primary_expression 
                    | postfix_expression TK_ABREC expression TK_CIERRAC
                    | postfix_expression TK_ABREP TK_CIERRAP 
                    | postfix_expression TK_ABREP argument_expression_list TK_CIERRAP 
                    | postfix_expression TK_MASMAS 
                    | postfix_expression TK_MENOSMENOS 
                    ;


argument_expression_list: argument_expression_list TK_COMMA assignment_expression 
                        | assignment_expression 
                        ;

unary_expression: TK_MASMAS unary_expression 
                | TK_MENOSMENOS unary_expression
                | TK_EXCLAMACION unary_expression  
                | postfix_expression 
                ;

multiplicative_expression: multiplicative_expression TK_ASTERISCO unary_expression 
      | multiplicative_expression TK_PLECA unary_expression
      | multiplicative_expression TK_PORCENTAJE unary_expression
      | multiplicative_expression TK_UP unary_expression
      | unary_expression 
      ;

additive_expression:  additive_expression TK_SUMA multiplicative_expression
                    | additive_expression TK_RESTA multiplicative_expression 
                    | multiplicative_expression 
                    ;

relational_expression: relational_expression TK_MAYOR additive_expression
                     | relational_expression TK_MENOR additive_expression 
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

assignment_operator: TK_IGUAL 
                   | TK_SUMAIGUAL 
                   | TK_RESTAIGUAL
                   | TK_ASTERISCOIGUAL
                   | TK_PLECAIGUAL
                   | TK_PORCENTAJEIGUAL
                   | TK_UPIGUAL
                   | TK_ORIGUAL
                   | TK_YIGUAL 
                   ;

expression: assignment_expression 
          ;

constant: TK_LIT_NUMBER
        ;
%%