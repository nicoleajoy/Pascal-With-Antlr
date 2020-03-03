/***** PROJECT 2 *****/
// Student Group: Nicole Ajoy & Yvette Williamson

/***** HOW TO RUN *****/
/* 
cd C:\Javalib\pascal
antlr4 Pascal.g4
javac *.java
java Main tests/test16.pas
(# between 1-19)
*/

/*********************************************************/

grammar Pascal;

program
   : programHeader ((partBlock)* mainBlock)+
   ;

programHeader
   : PROGRAM ID ';'
   ;

partBlock
   : subprogramBlock
   | varDecBlock
   ;

subprogramBlock
   : FUNCTION ID '(' parameters ')' ':' type=(BOOLEAN | REAL) ';' (varDecBlock)* BEGIN statements END ';'   #functionBlock
   | PROCEDURE ID '(' parameters ')' ';' (varDecBlock)* BEGIN statements END ';'                            #procedureBlock
   ;

parameters
   : varDec (';' varDec)*
   ;

varDecBlock
   : VAR (varDec ';')+
   ;

varDec 
   : ID ':' type=(BOOLEAN | REAL) '=' expression   #varSingleDec
   | ID (',' ID)* ':' type=(BOOLEAN | REAL)        #varListDec
   ;

mainBlock
   : BEGIN statements END '.'
   ;

statements
   : (statement ';')*
   ;

statement
   : // emptyStatement
   | assignStatement
   | ifStatement
   | caseStatement
   | whileDoLoop
   | forDoLoop
   | writeStatement
   | readStatement
   | subprogramCall
   ;

assignStatement
   : ID ':=' expression
   ;

expression
   : '(' expression ')'                                  #parenthesisExpression
   | subprogramCall                                      #subprogramCallExpression
   // Special functions
   | SQRT expression                                     #sqrtExpression
   | SIN expression                                      #sinExpression
   | COS expression                                      #cosExpression
   | LN expression                                       #logExpression
   | EXP expression                                      #expExpression
   // Arithmetic expressions
   | expression op=(PRODUCT | DIVIDE | MOD) expression   #multiplicativeExpression
   | expression op=(PLUS | MINUS) expression             #additiveExpression
   | MINUS expression                                    #negExpression
   // Conditional operators
   | expression AND expression                           #andExpression
   | expression OR expression                            #orExpression
   | NOT expression                                      #notExpression
   | expression op=(EQ | NEQ) expression                 #equalityExpression
   | expression op=(GT | LT | GTE | LTE) expression      #relationalExpression
   | NOT expression                                      #notExpression
   // Tiny expressions
   | atom                                                #atomExpression
   ;

subprogramCall
   : ID '(' arguments ')'
   ;

arguments
   : ID (',' ID)*
   ;

atom
   : REAL_NUMBER        #numberAtom
   | (TRUE | FALSE)     #booleanAtom
   | ID                 #idAtom
   | STRING             #stringAtom
   ;

ifStatement
   : IF expression THEN statement (ELSE statement)?
   ;

caseStatement
   : CASE expression OF (expression ':' statements)+ END
   ;

whileDoLoop
   : WHILE expression DO BEGIN statements END
   ;

forDoLoop
   : FOR ID ':=' expression TO expression DO BEGIN statements END
   ;

writeStatement
   : WRITELN '()'                                        #writeNewline
   | WRITELN '(' expression (',' expression)* ')'        #writeInside
   ;

readStatement
   : READLN ('()')?                 #readPause
   | READLN '(' ID (',' ID )* ')'   #readInput
   ;


// Arithmetic operators
PLUS           : '+';
MINUS          : '-';
PRODUCT        : '*';
DIVIDE         : '/';
MOD            : 'mod';
SQRT           : 'sqrt';
SIN            : 'sin';
COS            : 'cos';
LN             : 'ln';
EXP            : 'exp';

// Boolean operators
TRUE           : 'true';
FALSE          : 'false';
AND            : 'and';	
NOT            : 'not';
OR             : 'or';

// Logical operators
EQ             : '=';
NEQ            : '<>';
GT             : '>';
LT             : '<';
GTE            : '>=';
LTE            : '<=';

// Comments
COMMENT_B      : '{' (.*?) '}' -> skip;
COMMENT_P      : '(*' (.*?) '*)' -> skip;

// Other keywords
BEGIN          : 'begin';
BOOLEAN        : 'boolean';
CASE           : 'case';
CONST          : 'const';
DO             : 'do';
FUNCTION       : 'function';
OF             : 'of';
ELSE           : 'else';
END            : 'end';
FOR            : 'for';
IF             : 'if';
PROGRAM        : 'program';
READLN         : 'readln';
REAL           : 'real';
TO             : 'to';
THEN           : 'then';
PROCEDURE      : 'procedure';
VAR            : 'var';
WHILE          : 'while';
WRITELN        : 'writeln';

// Essentials
ID             : [A-Za-z][_A-Za-z0-9]*;
REAL_NUMBER    : [0-9]+('.'[0-9]+)?;
STRING         : '\'' (.*?) '\'';
WS             : [ \t\r\n]+ -> skip;
