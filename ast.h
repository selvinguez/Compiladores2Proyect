#ifndef _AST_H_
#define _AST_H_

#include <string>
#include "type.h"
#include <map>
#include <list>

using namespace std;

class Expr;

typedef list<Expr *> ArgumentList;

class Expr{
    public:
        int line;
        virtual Type getType() = 0;
};

class Statement{
    public:
        int line;
        virtual int evaluateSemantic() = 0;
};

class BinaryExpr : public Expr{
    public:
        BinaryExpr(Expr * leftExpr, Expr * rightExpr, int line){
            this->leftExpr = leftExpr;
            this->rightExpr = rightExpr;
            this->line = line;
        }
        Expr * leftExpr;
        Expr * rightExpr;
        int line;
};

#define IMPLEMENT_BINARY_EXPR(name) \
class name##Expr: public BinaryExpr{ \
    public: \
        name##Expr(Expr * leftExpr, Expr * rightExpr, int line) : BinaryExpr(leftExpr, rightExpr, line){}\
        Type getType();\
};\

class FloatExpr : public Expr{
    public:
        FloatExpr(float value, int line){
            this->value = value;
            this->line = line;
        }
        float value;
        int line;
        Type getType();
};

class IntExpr : public Expr{
    public:
        IntExpr(int value, int line){
            this->value = value;
            this->line = line;
        }
        int value;
        int line;
        Type getType();
};

class IdExpr : public Expr{
    public:
        IdExpr(string name, int line){
            this->name = name;
            this->line = line;
        }
        string name;
        int line;
        Type getType();
};

class StringExpr : public Expr{
    public:
        StringExpr(string value, int line){
            this->value = value;
            this->line = line;
        }
        string value;
        int line;
        Type getType();
};

class BoleanExpr : public Expr{
    public:
        BoleanExpr(bool value, int line){
            this->value = value;
            this->line = line;
        }
        bool value;
        int line;
        Type getType();
};
class MethodInvocationExpr: public Expr{
    public:
        MethodInvocationExpr(IdExpr * id, ArgumentList args, int line){
            this->id = id;
            this->args = args;
            this->line = line;
        }
        IdExpr * id;
        ArgumentList args;
        int line;
        Type getType();
};

class ArrayExpr: public Expr{
    public:
        ArrayExpr(IdExpr * id, Expr * indexExpression, int line){
            this->id = id;
            this->indexExpression = indexExpression;
            this->line = line;
        }
        IdExpr* id;
        Expr * indexExpression;
        int line;
        Type getType();
};

class UnaryExpr: public Expr{
    public:
        UnaryExpr(int type, Expr* expression){
            this->type = type;
            this->expression = expression;
        }

        int type;
        Expr* expression;
        Type getType();
};

class ReturnStatement : public Statement{
    public:
        ReturnStatement(Expr * expr, int line){
            this->expr = expr;
            this->line = line;
        }
        Expr * expr;
        int line;
        int evaluateSemantic();
};

class IfStatement: public Statement{
    public:
        IfStatement(Expr * condition, Statement * trueStatement, Statement * falseStatement){
            this->condition = condition;
            this->trueStatement = trueStatement;
            this->falseStatement = falseStatement;
        }
        Expr * condition;
        Statement * trueStatement;
        Statement * falseStatement;
};


IMPLEMENT_BINARY_EXPR(Add);
IMPLEMENT_BINARY_EXPR(Sub);
IMPLEMENT_BINARY_EXPR(Div);
IMPLEMENT_BINARY_EXPR(Mult);
IMPLEMENT_BINARY_EXPR(Eq);
IMPLEMENT_BINARY_EXPR(Neq);
IMPLEMENT_BINARY_EXPR(Gte);
IMPLEMENT_BINARY_EXPR(Gt);
IMPLEMENT_BINARY_EXPR(Lt);
IMPLEMENT_BINARY_EXPR(Lte);
IMPLEMENT_BINARY_EXPR(LogicalAnd);
IMPLEMENT_BINARY_EXPR(LogicalOr);
IMPLEMENT_BINARY_EXPR(Assign);
IMPLEMENT_BINARY_EXPR(PlusAssign);
IMPLEMENT_BINARY_EXPR(MinusAssign);


#endif