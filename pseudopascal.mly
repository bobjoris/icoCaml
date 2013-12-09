%{
open Printf;;
open Syntax;;
%}

/* Ocamlyacc Declarations */
%token <int> NUM
%token <string> ID
%token <bool> BOOL
%token <string> STRING
%token BEGIN END DOT
%token PROGRAM
%token FUNCTION PROCEDURE VAR
%token INTEGER BOOLEAN ARRAY OF TYPE
%token LT LE GT GE EQ NE
%token LPAREN RPAREN LBRACKET RBRACKET
%token COLONEQ COLON SEMICOLON COMMA
%token IF THEN ELSE WHILE DO
%token PLUS MINUS TIMES DIV 
%token WRITE WRITELN READ
%token COMMENT

%left LT LE GT GE EQ NE
%left PLUS MINUS 
%left TIMES DIV 
%nonassoc UMINUS
%nonassoc LBRACKET 

%start input
%type <unit> input

/* Grammar follows */
%%
input: PROGRAM vars definitions instructions DOT { printf "program\n" ; flush stdout }
;
vars: {}
	| var SEMICOLON vars {}
;
var: VAR ID COLON type_expr { printf "VAR DEF" ; flush stdout }
;
definitions: /*empty*/ {}
	|fonctions SEMICOLON commentaire definitions {}
;
fonctions: FUNCTION ID LPAREN args RPAREN COLON type_expr SEMICOLON vars instructions { printf "function %s\n" $2; flush stdout }	
	|PROCEDURE ID LPAREN args RPAREN SEMICOLON vars instructions { printf "procedure %s %s\n" $2 $2 ; flush stdout }	
;
args: {}
	| ID args1 COLON type_expr { printf "var args1\n" ; flush stdout }
;
args1: {}
	| COMMA ID args1 { printf "var args1\n" ; flush stdout}
;
instructions: ID COLONEQ expr {}
	| BEGIN blocs END { printf "begin end\n" ; flush stdout  }
	| IF expr THEN instructions ELSE instructions { printf "if else\n" ; flush stdout }
	| WHILE expr DO instructions { printf "while do\n" ; flush stdout }
	| ID LPAREN arguments RPAREN { printf "appel proc\n" ; flush stdout }
	| READ LPAREN ID RPAREN            { printf "read\n" ; flush stdout }
	| WRITE LPAREN expr RPAREN      { printf "write\n" ; flush stdout }
	| WRITELN LPAREN expr RPAREN    { printf "writeln\n" ; flush stdout }
	| expr LBRACKET expr RBRACKET COLONEQ expr { printf "seti[]\n" ; flush stdout }
;
commentaire : {}
	| LBRACKET ID RBRACKET { printf "comment %s\n" $2; flush stdout }
;
blocs: {}
	| instructions bloc { }
;
bloc: {}
	| SEMICOLON instructions bloc {}
;
arguments: {}
	| expr argument {}
;
argument: {}
	| COMMA expr argument {}
;
expr: LPAREN expr RPAREN {}
	| NUM { printf "%d\n" $1 ; flush stdout  }
	| MINUS NUM %prec UMINUS { printf "-%d\n" $2 ; flush stdout }
	| BOOL {}
	| ID {}
	| ID LPAREN arguments RPAREN { printf "appel fonction" ; flush stdout }
	| expr LBRACKET expr RBRACKET { printf "geti" ; flush stdout}
	|expr PLUS expr { printf "PLUS\n" ; flush stdout }
	|expr MINUS expr { printf "minus\n" ; flush stdout }
	|expr TIMES expr { printf "fois\n" ; flush stdout }
	|expr DIV expr { printf "div\n" ; flush stdout }
	|expr LT expr { printf "LT\n" ; flush stdout }
	|expr LE expr { printf "LE\n" ; flush stdout }
	|expr GT expr { printf "GT\n" ; flush stdout }
	|expr GE expr { printf "GE\n" ; flush stdout }
	|expr EQ expr { printf "EQ\n" ; flush stdout }
	|expr NE expr { printf "NE\n" ; flush stdout }
;
type_expr : INTEGER { printf "INTEGER" ; flush stdout }
	| BOOLEAN { printf "BOOLEAN" ; flush stdout }
	| ARRAY OF type_expr { printf "ARRAY OF" ; flush stdout }
;
%%