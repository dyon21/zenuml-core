lexer grammar sequenceLexer;

DS
 : '//' -> pushMode(COMMENT_MODE)
 ;


COL
 : ':' -> pushMode(EVENT)
 ;

ARROW
 : '->'
 ;

AT : '@';
OR : '||';
AND : '&&';
EQ : '==';
NEQ : '!=';
GT : '>';
LT : '<';
GTEQ : '>=';
LTEQ : '<=';
PLUS : '+';
MINUS : '-';
MULT : '*';
DIV : '/';
MOD : '%';
POW : '^';
NOT : '!';

SCOL : ';';
COMMA : ',';
ASSIGN : '=';
OPAR : '(';
CPAR : ')';
OBRACE : '{';
CBRACE : '}';

TRUE : 'true';
FALSE : 'false';
NIL : 'nil';
IF : 'if';
ELSE : 'else';
WHILE : 'while' | 'for' | 'foreach' | 'forEach' | 'loop';
RETURN : 'return';
NEW: 'new';
STARTER_LXR: 'Starter';
THEME_LXR: 'Theme';

DOT
 : '.'
 ;

ID
 : [a-zA-Z_] [a-zA-Z_0-9]*
 ;

INT
 : [0-9]+
 ;

FLOAT
 : [0-9]+ '.' [0-9]*
 | '.' [0-9]+
 ;

STRING
 : '"' (~["\r\n] | '""')* '"'
 ;

CR
 : [\r\n] -> channel(HIDDEN)
 ;

SPACE
 : [ \t] -> channel(HIDDEN)
 ;

OTHER
 : .
 ;

mode EVENT;

EVENT_PAYLOAD_LXR
 : ~[\r\n]+
 ;

EVENT_END
 : [\r\n] -> popMode
 ;


mode COMMENT_MODE;

COMMENT_LXR
 : ~[\r\n]+
 ;

COMMENT_END
 : [\r\n] -> popMode
 ;

WS
: [ ] -> channel(HIDDEN)
;