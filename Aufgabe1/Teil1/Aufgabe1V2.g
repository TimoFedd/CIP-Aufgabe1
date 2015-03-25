grammar Aufgabe1V2;


riddle		:	line lineop line linesum lastline;

line		:	block OP block EQUAL block EOF;
lastline	:	block OP block EQUAL block;
lineop		:	OP OP OP EOF;
linesum		:	EQUAL EQUAL EQUAL EOF;
block		: 	SYMBOL+;

SYMBOL	: ('A'..'Z');
OP	: '+'|'-';
EQUAL	:  '=';
EOF	: '\n';

WS       :           (' '|'\t'|'\f'|'\r')+{ $channel=HIDDEN; };







