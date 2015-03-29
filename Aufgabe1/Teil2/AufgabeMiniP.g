grammar AufgabeMiniP;

start		:	PROGRAM  OPENSQUARE declaration* CLOSESQUARE statement* END;
declaration	:	DATATYPE ID (',' ID)* SEM;
statement       :	(assignment | read_statement | while_statement) SEM;

assignment      :	ID ':=' (compare | STRINGCONST);     //Hier fehlen noch die arithmetic_expressions
read_statement 	: 	READ OPENROUND ID CLOSEROUND;
while_statement :	WHILE compare DO statement* OD; 

compare 	:	OPENROUND ID COMPARATOR ID CLOSEROUND; 

OD		:       O D;	
DO		:       D O;	
WHILE 		:       W H I L E;	
READ 		:	R E A D;
COMPARATOR 	:	'==' | '<>' | '<' | '>';   
IF 		:	I F;
THEN 		:	T H E N;
ELSE 		:	E L S E;
FI		:	F I;
END 		:	E N D;
PROGRAM		:	P R O G R A M;
DATATYPE        :	I N T E G E R | R E A L | S T R I N G | B O O L E A N;
// Neitzke fragen, wieso Fehler bei Variable, die falsch anfängt, nur im Output-Stream geworfen wird und nicht im Parsetree??
ID		:	LETTER (LETTER|DIGIT|'_')*;

OPENSQUARE	: 	'[';
CLOSESQUARE	: 	']';
OPENROUND	: 	'(';
CLOSEROUND	:	')';
SEM  		:	 ';';
	
WS       	:	(' '|'\t'|'\n'|'\r'|'\f')+{ $channel=HIDDEN; };
COMENTS		: 	('/*' .* '*/')   { $channel=HIDDEN; };  // das .* bedeutet in ANTLR, beliebiges Zeichen beliebig oft
STRINGCONST	:       '\'' .* '\'';	


//****************************************Fragmente******************************************************************


fragment LETTER	:	('a'..'z'|'A'..'Z');
fragment DIGIT	:	('0'..'9');

fragment A	:	('a' | 'A');
fragment B	:	('b' | 'B');
fragment C	:	('c' | 'C');
fragment D	:	('d' | 'D');
fragment E	:	('e' | 'E');
fragment F	:	('f' | 'F');
fragment G	:	('g' | 'G');
fragment H	:	('h' | 'H');
fragment I	:	('i' | 'I');
fragment J	:	('j' | 'J');
fragment K	:	('k' | 'K');
fragment L	:	('l' | 'L');
fragment M	:	('m' | 'M');
fragment N	:	('n' | 'N');
fragment O	:	('o' | 'O');
fragment P	:	('p' | 'P');
fragment Q	:	('q' | 'Q');
fragment R	:	('r' | 'R');
fragment S	:	('s' | 'S');
fragment T	:	('t' | 'T');
fragment U	:	('u' | 'U');
fragment V	:	('v' | 'V');
fragment W	:	('w' | 'W');
fragment X	:	('x' | 'X');
fragment Y	:	('y' | 'Y');
fragment Z	:	('z' | 'Z');