grammar Aufgabe1;


riddle	:	line lineop line linesum line;

line	:	block OP block EQUAL block;
lineop	:	OP OP OP;
linesum	:	EQUAL EQUAL EQUAL;
block	: 	SYMBOL+;

SYMBOL	: ('A'..'Z');
OP	: '+'|'-';
EQUAL	:  '=';


WS       :           (' '|'\t'|'\f'|'\n'|'\r')+{ $channel=HIDDEN; };







