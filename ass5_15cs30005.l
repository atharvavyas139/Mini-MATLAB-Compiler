%{
#include "ass5_15cs30005_translator.h"
#include "y.tab.h"
#include <math.h>
void yyerror (char *);  /* prints grammar violation message */
%}

/* Regular Expression Definitions */
MATRIX "Matrix"
UNSIGNED "unsigned"
BREAK "break"
RETURN "return"
VOID "void"
CASE "case"
FLOAT "float"
SHORT "short"
CHAR "char"
FOR "for"
SIGNED "signed"
WHILE "while"
GOTO "goto"
BOOL "Bool"
CONTINUE "continue"
IF "if"
DEFAULT "default"
DO "do"
INT "int"
SWITCH "switch"
DOUBLE "double"
LONG "long"
ELSE "else"
CONST "const"
DIGIT					[0-9]
IN 			 		[a-zA-Z_]
IDENTIFIER 				{IN}({IN}|{DIGIT})*
SIGN					[+-]
EXPONENTP				([Ee]{SIGN}?{DIGIT}+)
INTEGER 					[1-9]{DIGIT}*
ZERO					"0"
FRACTIONAL 			({FRACTIONALF}{EXPONENTP}?)|({DIGIT}+{EXPONENTP})
FRACTIONALF 				(({DIGIT}+)?"."{DIGIT}+)|(({DIGIT}+)".")
ESC_SEQ				\\['"?\\abfnrtv]
CCHAR 				[^'\\\n]|{ESC_SEQ}
CCHARSEQ 			'({CCHAR})+'
SCHAR 				[^"\\\n]|{ESC_SEQ}
SC 				["]({SCHAR}+)["]
ESCAPESEQ 			\\['"?\\abftrnv]|[ \n\t]
SINGLE_COMMENT 			\/\/.*
MULTILINE_COMMENT 		\/\*([^*]|[\r\n]|(\*+([^*/]|[\r\n])))*\*\/
%%

{SINGLE_COMMENT}			{}
{MULTILINE_COMMENT}	   	{  }
{MATRIX} {return MATRIX;}
{UNSIGNED} {return UNSIGNED;}
{BREAK} {return BREAK;}
{RETURN} {return RETURN;}
{CASE} {return CASE;}
{FLOAT} {return FLOAT;}
{SHORT}	{return SHORT;}
{CHAR} {return CHAR;}
{FOR} {return FOR;}
{SIGNED} {return SIGNED;}
{WHILE} {return WHILE;}
{GOTO} {return GOTO;}
{BOOL} {return BOOL;}
{CONTINUE} {return CONTINUE;}
{IF} {return IF;}
{DEFAULT} {return DEFAULT;}
{DO} {return DO;}
{INT} {return INT;}
{SWITCH} {return SWITCH;}
{DOUBLE} {return DOUBLE;}
{LONG} {return LONG;}
{ELSE} {return ELSE;}
{CONST} {return CONST;}
"void"          { return VOID; }
{SC} 			{ 	yylval.strval = yytext;
				return STRING_LITERAL; }
{IDENTIFIER}			{	yylval.symp = symbol_table->lookup(yytext);/*if the identifier does not exist new row is created as symbol_row pointer*/
				return IDENTIFIER;  }
{INTEGER} 			{ 	yylval.intval = atoi(yytext);
				return INT_CONSTANT; }
{ZERO} 			{ 	yylval.intval = atoi(yytext);
				return ZERO_CONSTANT; }
{FRACTIONAL} 			{ 	yylval.strval = yytext;
				return FLOAT_CONSTANT; }
{CCHARSEQ} 			{  	return CHAR_CONSTANT; }

"["		{ return yytext[0];}
"]" 		{ return yytext[0]; }
"(" 		{ return yytext[0];}
")" 		{return yytext[0];}
"{" 		{ return yytext[0];}
"}" 		{ return yytext[0];}
"." 		{ return yytext[0];}
"->" 		{ return POINTER_OP; }

"++" 		{ return INCREMENT_OP; }
"--" 		{ return DECREMENT_OP; }
"&"		{ return yytext[0]; }
"*"		{ return yytext[0];}
"+"		{ return yytext[0];}
"-"		{ return yytext[0];}
"~"		{ return yytext[0];}
"!"		{ return yytext[0]; }

"/"		{ return yytext[0]; }
"%"		{return yytext[0];}
"<<"		{ return SHIFT_LEFT; }
">>"		{ return SHIFT_RIGHT; }
"<"		{ return yytext[0];}
">"		{ return yytext[0]; }
"<="		{ return LESS_EQUAL; }
">="		{ return GREATER_EQUAL; }
"=="		{ return EQUAL_OP; }
"!="		{ return NOTEQUAL_OP; }
"^"		{ return yytext[0]; }
"|"		{ return yytext[0]; }
"&&"	  	{ return LOGAND; }
"||"		{ return LOGOR; }

"?"		{ return yytext[0]; }
":"		{ return yytext[0]; }
";"		{ return yytext[0];}
"..."		{ return ELLIPSIS; }

"="		{ return yytext[0]; }
"*="		{ return MUL_EQUAL; }
"/="		{ return DIV_EQUAL; }
"%="		{ return MOD_EQUAL; }
"+="		{ return ADD_EQUAL; }
"-="		{ return SUB_EQUAL; }
"<<="		{ return LEFT_SHIFT_EQUAL; }
">>="		{ return RIGHT_SHIFT_EQUAL; }
"&="		{ return AND_EQUAL; }
"^="		{ return XOR_EQUAL; }
"|="		{ return OR_EQUAL; }
".'" 		{return TRANSPOSE;}	
","		{ return yytext[0]; }
"#"		{ return yytext[0];}

{ESCAPESEQ}			{}
%%
