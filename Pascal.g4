/***** PROJECT 2 *****/
// Student Group: Nicole Ajoy & Yvette Williamson

/***** HOW TO RUN *****/
/* 
cd C:\Javalib\pascal
antlr4 Pascal.g4
javac Main.java
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
   : varDecBlock
   ;

varDecBlock
   : VAR (varDec ';')+
   ;

varDec 
   : varSingleDec
   | varListDec
   ;

bool
   : (TRUE | FALSE)
   ;

varSingleDec
   : ID ':' BOOLEAN '=' bool #varSingleBoolDec
   | ID ':' REAL '=' REAL_NUMBER #varSingleRealDec
   ;

varListDec
   : ID (',' ID)* ':' BOOLEAN #varListBoolDec
   | ID (',' ID)* ':' REAL #varListRealDec
   ;

mainBlock
   : BEGIN statements END '.'
   ;

statements
   : (statement ';')*
   ;

statement
   : // emptyStatement
   | assignmentStatement
   | ifStatement 
   | caseStatement
   | whileDoLoop
   | forDoLoop
   | writeStatement
   | readStatement
   ;

assignmentStatement
   : ID ':=' expression #initRealVar
   | ID ':=' condition #initBoolVar
   ;

expression
   : '(' e=expression ')' #exprExpr
   | SQRT e=expression #sqrtExpr
   | SIN e=expression #sinExpr
   | COS e=expression #cosExpr
   | LN e=expression #logExpr
   | EXP e=expression #expExpr
   | eL=expression PRODUCT eR=expression #mulExpr
   | eL=expression DIVIDE eR=expression #divExpr
   | eL=expression PLUS eR=expression #addExpr
   | eL=expression MINUS eR=expression #subExpr
   | eL=expression MOD eR=expression #modExpr
   | MINUS REAL_NUMBER #negExpr
   | REAL_NUMBER #numExpr
   | ID #varExpr
   ;

condition
   : '(' e=condition ')' #conCond
   | eL=condition AND eR=condition #andcond
   | eL=condition OR eR=condition #orCond
   | NOT e=condition #notCond
   | eL=condition XOR eR=condition #xorCond
   | cL=expression EQ cR=expression #eqCond
   | cL=expression NEQ cR=expression #neqCod
   | cL=expression GT cR=expression #gtCond
   | cL=expression LT cR=expression #ltCond
   | cL=expression GE cR=expression #geCond
   | cL=expression LE cR=expression #leCond
   | NOT c=condition #notCond
   | bool #boolCond
   | ID #varCond
   ;

ifStatement
   : IF condition THEN statement (ELSE statement)?
   ;

caseStatement
   : CASE expression OF (REAL_NUMBER ':' statements)+ END
   | CASE condition OF (bool ':' statements)+ END
   | CASE ID OF (ID ':' statements)+ END
   ;

whileDoLoop
   : WHILE condition DO BEGIN statements END
   ;

forDoLoop
   : FOR ID ':=' REAL_NUMBER TO REAL_NUMBER DO BEGIN statements END
   ;

writeStatement
   : WRITELN '()' #printNewline
   | WRITELN '(' writeParameter (',' writeParameter)* ')' #printStuffInside
   ;

writeParameter
   : expression #printExpr
   | condition #printCond
   | STRING_LIT #printString
   | ID #printVarVal
   ;

readStatement
   : READLN ('()')? #readPause
   | READLN '(' ID (',' ID )* ')' #readInput
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
XOR            : 'xor';

// Logical operators
EQ             : '=';
NEQ            : '<>';
GT             : '>';
LT             : '<';
GE             : '>=';
LE             : '<=';

// Comments
COMMENT_B      : '{' (.*?) '}' -> skip;
COMMENT_P      : '(*' (.*?) '*)' -> skip;

// Other keywords
BEGIN          : 'begin';
BOOLEAN        : 'boolean';
CASE           : 'case';
CONST          : 'const';
DO             : 'do';
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
VAR            : 'var';
WHILE          : 'while';
WRITELN        : 'writeln';

// Essentials
ID             : [A-Za-z][_A-Za-z0-9]*;
REAL_NUMBER    : [0-9]+('.'[0-9]+)?;
STRING_LIT     : '\'' (.*?) '\'';
WS             : [ \t\r\n]+ -> skip;
