///// Deliverable 1 (11/13): 
// Arithmetic Operators: +, -, *, /, %,
// Assignment Operators: =, +=, -=, *=, /=

///// Deliverable 2 (11/20): 
// if/elif/else blocks
// Conditional Statements: <, <=, >, >=, ==, !=, and, or, not

///// Deliverable 3 (12/11): 
// while/for Loops
// Nested Structures
// Support for Comments

///// Documentation (12/11)
// Report
// README.md 
// Demo Video

////////////////////////// Grammar Start //////////////////////////
grammar PythonGrammar;

program
: (statement? NEWLINE)* statement? EOF
;

statement
: NAME ASSIGN expr  
| NAME augmentedAssign expr
;

expr
: expr op=(MUL | DIV | MOD) expr
| expr op=(ADD | SUB) expr
| LPAREN expr RPAREN
| list
| atom
;

list
: LBRACK (expr (COMMA expr)*)? RBRACK
;

augmentedAssign
: ADD_ASSIGN
| SUB_ASSIGN
| MUL_ASSIGN
| DIV_ASSIGN
| MOD_ASSIGN
;

atom
: INT
| FLOAT
| CHAR
| STRING
| NAME
| bool
;

bool
: TRUE
| FALSE
;


/////////////////////////////////////////////
///////         LEXER RULES           ///////
/////////////////////////////////////////////

ASSIGN : '=' ;

//Assignment Operators (longest match wins, so '+=' beats '+')
ADD_ASSIGN : '+=' ;
SUB_ASSIGN : '-=' ;
MUL_ASSIGN : '*=' ;
DIV_ASSIGN : '/=' ;
MOD_ASSIGN : '%=' ;


//Arithmetic Operators
ADD : '+' ;
SUB : '-' ;
MUL : '*' ;
DIV : '/' ;
MOD : '%' ;

LPAREN : '(' ;
RPAREN : ')' ;
LBRACK : '[' ;
RBRACK : ']' ;
COMMA  : ',' ;

//Keywords have to be before NAME so they win the tie
TRUE  : 'True' ;
FALSE : 'False' ;

NAME : [a-zA-Z_] [a-zA-Z_0-9]* ;

INT : [0-9]+ ;

FLOAT
    : [0-9]+ '.' [0-9]*
    | '.' [0-9]+
    ;

CHAR : '\'' ( ~['\\\r\n] | '\\' . ) '\'' ;

STRING
    : '"'  ( ~["\\\r\n]  | '\\' . )* '"'
    | '\'' ( ~['\\\r\n]  | '\\' . )* '\''
    ;


NEWLINE : '\r'? '\n' ;

COMMENT : '#' ~[\r\n]* -> skip ;
WS      : [ \t]+       -> skip ;