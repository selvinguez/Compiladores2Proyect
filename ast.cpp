#include "ast.h"
#include <set>
#include <iostream>
#include <sstream>


string getTypeName(Type type){
    switch (type)
    {
        case INT:
            return "INT";
        case FLOAT:
            return "FLOAT";
        case VOID:
            return "VOID";
    }

    cout<<"Unkown type"<<endl;
    exit(0);
}

map<string, Type> resultTypes = {
    {"INT,INT", INT},
    {"FLOAT,FLOAT", FLOAT},
    {"INT,FLOAT", FLOAT},
    {"FLOAT,INT", FLOAT}
};

#define IMPLEMENT_BINARY_GET_TYPE(name)\
Type name##Expr::getType(){\
    string leftType = getTypeName(this->leftExpr->getType());\
    string rightType = getTypeName(this->rightExpr->getType());\
    Type resultType = resultTypes[leftType+","+rightType];\
    if(resultType == 0){\
        cerr<<"Error: el tipo "<<leftType<<" no puede ser operado con el tipo "<<rightType<<this->line<<endl;\
        exit(0);\
    }\
    return resultType;\
}\

Type FloatExpr::getType(){
    return FLOAT;
}

Type IntExpr::getType(){
    return INT;
}

Type IdExpr::getType(){
    //TODO: Add context logic.
    return VOID;
}

Type StringExpr::getType(){
    return STRING;
}
Type  BoleanExpr::getType(){
    return BOOL;
}


Type MethodInvocationExpr::getType(){
    //TODO: Tabla de simboos.
    return VOID;
}

Type ArrayExpr::getType(){
    //TODO: Tabla de simboos.
    return VOID;
}

Type UnaryExpr::getType(){
    if (this->expression->getType() != BOOL)
    {
        cerr<<"Unary expression works only for booleans"<<endl;
    }
    
    return BOOL;
}

int ReturnStatement::evaluateSemantic(){
    //TODO: eval
    return 0;
}

IMPLEMENT_BINARY_GET_TYPE(Add);
IMPLEMENT_BINARY_GET_TYPE(Sub);
IMPLEMENT_BINARY_GET_TYPE(Div);
IMPLEMENT_BINARY_GET_TYPE(Mult);
IMPLEMENT_BINARY_GET_TYPE(Eq);
IMPLEMENT_BINARY_GET_TYPE(Neq);
IMPLEMENT_BINARY_GET_TYPE(Gte);
IMPLEMENT_BINARY_GET_TYPE(Gt);
IMPLEMENT_BINARY_GET_TYPE(Lt);
IMPLEMENT_BINARY_GET_TYPE(Lte);
IMPLEMENT_BINARY_GET_TYPE(LogicalAnd);
IMPLEMENT_BINARY_GET_TYPE(LogicalOr);