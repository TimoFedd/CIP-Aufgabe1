grammar AufgabeMiniP;

start		:	PROGRAM OPENSQUARE declaration* CLOSESQUARE;

declaration	:	DATATYPE ID (',' ID)* ';';

PROGRAM		:	P R O G R A M;
// Wieso nun doch Reihenfolge relevant??
DATATYPE        :	I N T E G E R | R E A L | S T R I N G | B O O L E A N;
// Neitzke fragen, wieso Fehler bei Variable, die falsch anfängt, nur im Output-Stream geworfen wird und nicht im Parsetree??
ID		:	LETTER (LETTER|DIGIT|'_')*;

OPENSQUARE	: 	'[';
CLOSESQUARE	: 	']';
OPENROUND	: 	'(';
CLOSEROUND	:	')';
OPENCOMMENT	:	'/*';
CLOSECOMMENT	:	'*/';

	
WS       	:	(' '|'\t'|'\n'|'\r'|'\f')+{ $channel=HIDDEN; };

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