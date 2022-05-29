/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_TOKENS_H_INCLUDED
# define YY_YY_TOKENS_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
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
    TK_LIT_NUMBER = 278,
    TK_ABRELLAVE = 279,
    TK_CIERRALLAVE = 280,
    TK_IDENTIFICADOR = 281,
    TK_ASTERISCO = 282,
    TK_SUMA = 283,
    TK_SUMAIGUAL = 284,
    TK_YIGUAL = 285,
    TK_AND = 286,
    TK_DOBLEIGUAL = 287,
    TK_OR = 288,
    TK_DISTINTO = 289,
    TK_RESTA = 290,
    TK_ABREP = 291,
    TK_CIERRAP = 292,
    TK_RESTAIGUAL = 293,
    TK_ORIGUAL = 294,
    TK_MENOR = 295,
    TK_MENORIGUAL = 296,
    TK_ABREC = 297,
    TK_CIERRAC = 298,
    TK_UP = 299,
    TK_ASTERISCOIGUAL = 300,
    TK_UPIGUAL = 301,
    TK_MAYOR = 302,
    TK_MAYORIGUAL = 303,
    TK_PLECA = 304,
    TK_PLECAIGUAL = 305,
    TK_PUNTO = 306,
    TK_PUSH = 307,
    TK_MASMAS = 308,
    TK_IGUAL = 309,
    TK_DOSPUNTOSIGUAL = 310,
    TK_COMMA = 311,
    TK_PUNTOCOMMA = 312,
    TK_PORCENTAJE = 313,
    TK_PORCENTAJEIGUAL = 314,
    TK_MENOSMENOS = 315,
    TK_EXCLAMACION = 316,
    TK_LIT_STRING = 317,
    TK_DOSPUNTOS = 318,
    TK_IMPORT = 319,
    TK_FROM = 320,
    TK_PRINT = 321,
    TK_FUNCTION = 322,
    TK_ARROWFUNC = 323,
    TK_NEW = 324
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 13 "proyect.y"

    const char* string_t;
    int int_t;
    float float_t;

#line 133 "tokens.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_TOKENS_H_INCLUDED  */
