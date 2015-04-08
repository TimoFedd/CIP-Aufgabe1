grammar AufgabeMiniP;


start		:	PROGRAM  OPENSQUARE declaration* CLOSESQUARE BEGIN statement+ END;
declaration	:	DATATYPE ID (COMMA ID)* SEM;
statement       :	(assignment | read_statement | while_statement) SEM;

assignment      :	ID ASSIGNOR (arithmetik	| compare | STRINGCONST | BOOLEANCONST);
read_statement 	: 	READ OPENROUND ID CLOSEROUND;
while_statement :	WHILE compare DO statement* OD; 
compare 	:	OPENROUND (ID| constants ) COMPARATOR (ID|constants) CLOSEROUND; //IDs sind die Arytmetischen Variablen. Da können natürlich auch ausversehen String Variablen landen, aber das kann man dann wohl erst in der Semantikanaylse mit der Symboltabelle feststellen.

constants	:	BOOLEANCONST | STRINGCONST | REALCONST | INTEGERCONST;


arithmetik	  	 :	 multiplicationExpression(ADD_SUB multiplicationExpression)*;
multiplicationExpression :       atom(MULT_DIV atom)* ;
atom			 :       '-'? ( INTEGERCONST | ID |OPENROUND arithmetik CLOSEROUND );


OD		:       'od';	
DO		:       'do';	
WHILE 		:       'while';	
READ 		:	'read';
COMPARATOR 	:	'=' | '<>' | '<' | '<=' | '>' | '>=';   
ASSIGNOR	:	':=';
IF 		:	'if';
THEN 		:	'then';
ELSE 		:	'else';
FI		:	'fi';
END 		:	'end';
PROGRAM		:	'program';
BEGIN		:	'begin';
DATATYPE        :	'integer' | 'real' | 'string' | 'boolean';
// Neitzke fragen, wieso Fehler bei Variable, die falsch anfängt, nur im Output-Stream geworfen wird und nicht im Parsetree??

OPENSQUARE	: 	'[';
CLOSESQUARE	: 	']';
OPENROUND	: 	'(';
CLOSEROUND	:	')';
COMMA		:	',';
SEM  		:	 ';';
ADD_SUB		:	'+' | '-';
MULT_DIV	:	'*' | '/';

WS       	:	(' '|'\t'|'\n'|'\r'|'\f')+{ $channel=HIDDEN; };
COMMENTS	: 	('/*' .* '*/')   { $channel=HIDDEN; };  // das .* bedeutet in ANTLR, beliebiges Zeichen beliebig oft
BOOLEANCONST	:	'true' | 'false';
STRINGCONST	:       '\'' .* '\'';	
REALCONST	:	DIGIT+ '.' DIGIT+;
INTEGERCONST	:	DIGIT+;
ID		:	LETTER (LETTER|DIGIT|'_')*;

//****************************************Fragmente******************************************************************


fragment LETTER	:	('a'..'z'|'A'..'Z');
fragment DIGIT	:	('0'..'9');