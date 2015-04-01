grammar AufgabeMiniP;


start		:	PROGRAM  OPENSQUARE declaration* CLOSESQUARE BEGIN statement* END;
declaration	:	DATATYPE ID (',' ID)* SEM;
statement       :	(assignment | read_statement | while_statement) SEM;

assignment      :	ID ':=' (compare | STRINGCONST | BOOLEANCONST);     //Hier fehlen noch die arithmetic_expressions
read_statement 	: 	READ OPENROUND ID CLOSEROUND;
while_statement :	WHILE compare DO statement* OD; 

// TODO arithmetischer Vergleich
compare 	:	OPENROUND ID COMPARATOR ID CLOSEROUND; 

OD		:       'od';	
DO		:       'do';	
WHILE 		:       'while';	
READ 		:	'read';
COMPARATOR 	:	'==' | '<>' | '<' | '>';   
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
SEM  		:	 ';';
	
WS       	:	(' '|'\t'|'\n'|'\r'|'\f')+{ $channel=HIDDEN; };
COMMENTS	: 	('/*' .* '*/')   { $channel=HIDDEN; };  // das .* bedeutet in ANTLR, beliebiges Zeichen beliebig oft
BOOLEANCONST	:	'true' | 'false';
STRINGCONST	:       '\'' .* '\'';	
ID		:	LETTER (LETTER|DIGIT|'_')*;

//****************************************Fragmente******************************************************************


fragment LETTER	:	('a'..'z'|'A'..'Z');
fragment DIGIT	:	('0'..'9');