grammar AufgabeMiniP;


start		:	PROGRAM  OPENSQUARE declaration* CLOSESQUARE BEGIN statement* END;
declaration	:	DATATYPE ID (COMMA ID)* SEM;
statement       :	(assignment | read_statement | while_statement) SEM;

assignment      :	ID ASSIGNOR (compare | arithmetic | STRINGCONST | BOOLEANCONST);
read_statement 	: 	READ OPENROUND ID CLOSEROUND;
while_statement :	WHILE compare DO statement* OD; 

// TODO arithmetischer Vergleich
compare 	:	OPENROUND ID COMPARATOR ID CLOSEROUND; 
arithmetic	:	(bracket | no_bracket)+;
no_bracket	:	(ADD_SUB* (INTEGERCONST | ID)) (MULT_DIV no_bracket);
bracket		:	OPENROUND no_bracket CLOSEROUND;
operator	:	MULT_DIV | ADD_SUB;

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
INTEGERCONST	:	DIGIT+;
ID		:	LETTER (LETTER|DIGIT|'_')*;

//****************************************Fragmente******************************************************************


fragment LETTER	:	('a'..'z'|'A'..'Z');
fragment DIGIT	:	('0'..'9');