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
%token INTEGER BOOLEAN ARRAY OF TYPE NEW
%token LT LE GT GE EQ NE OR AND NOT
%token LPAREN RPAREN LBRACKET RBRACKET
%token COLONEQ COLON SEMICOLON COMMA
%token IF THEN ELSE WHILE DO 
%token PLUS MINUS TIMES DIV 
%token WRITE WRITELN READ READLN
%token COMMENT

%left LT LE GT GE EQ NE
%left AND OR
%left PLUS MINUS 
%left TIMES DIV 
%nonassoc UMINUS
%nonassoc LBRACKET 
%nonassoc NOT

%start input
%type <Syntax.program> input

/* Grammar follows */
%%
input: PROGRAM vars definitions instructions DOT 
	{ $2 , $3 , ["instruction"] } /*printf "program\n" ; flush stdout ; */
;
/*vars: {}
	| VAR var SEMICOLON vars1 {}
;
vars1: var SEMICOLON {}
	| var SEMICOLON vars1 {}
;*/
vars: { [] }
	| VAR var SEMICOLON vars1 { $2 :: $4 }
;
vars1: { [] }
	| var SEMICOLON vars1 { $1 :: $3 }
;
var: idlist COLON type_expr { $1 , $3 } /*printf "VAR DEF %s\n" $1 ; flush stdout */
	/*| ID COMMA var { $1 :: $3 } printf "%s COMMA\n" $1 ; flush stdout*/
/*VAR ID COLON type_expr { printf "VAR DEF" ; flush stdout }
	| ID COLON type_expr { printf "VAR DEF" ; flush stdout } */
;
idlist: ID { [$1] }
	| ID COMMA idlist { $1 :: $3 }
;
definitions: /*empty*/ { [] }
	|fonctions SEMICOLON definitions { $1 :: $3 }
;
fonctions: FUNCTION ID LPAREN args RPAREN COLON type_expr SEMICOLON vars instructions 
		{ $2, ($4, Some $7, $9, $10) } /*printf "function %s\n" $2; flush stdout*/
	|PROCEDURE ID LPAREN args RPAREN SEMICOLON vars instructions 
		{ $2, ($4, None , $7, $8) } /*printf "procedure %s %s\n" $2 $2 ; flush stdout*/	
;
args: { [] }
/*	|var args1 {}*/
	| ID args1 COLON type_expr { [($1 :: $2 , $4)] } /*printf "var  args1\n"  ; flush stdout*/
	| ID args1 COLON type_expr SEMICOLON args { ($1 :: $2 , $4) :: $6 } /*printf "var  args1\n"  ; flush stdout*/
;
args1: { [] }
	| COMMA ID args1 { $2 :: $3 } /*printf "COMMA %s args1\n" $2 ; flush stdout*/
;
instructions: ID COLONEQ expr { "test" }
	| BEGIN blocs END { "test" }
	| IF expr THEN instructions ELSE instructions { "test" }
	| WHILE expr DO instructions { "test" }
	| ID LPAREN arguments RPAREN { "test" }
	| READ LPAREN ID RPAREN            { "test" }
	| WRITE LPAREN expr RPAREN      { "test" }
	| WRITELN LPAREN expr RPAREN    { "test" }
	| expr LBRACKET expr RBRACKET COLONEQ expr { "test" }
;
/*commentaire : {}
	| LBRACKET STRING RBRACKET { printf "comment %s\n" $2; flush stdout }
;*/
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
	| MINUS expr /*%prec UMINUS */ { printf "UMINUS\n"  ; flush stdout }
	| BOOL {}
	| READLN LPAREN RPAREN            { printf "readln\n" ; flush stdout }
	| NEW type_expr { printf "NEW\n" ; flush stdout}
	| ID { printf "ID %s\n" $1 }
	| ID LPAREN arguments RPAREN { printf "appel fonction\n" ; flush stdout }
	| expr LBRACKET expr RBRACKET { printf "geti\n" ; flush stdout}
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
	|expr OR expr { printf "OR\n" ; flush stdout }
	|expr AND expr { printf "AND\n" ; flush stdout }
	|NOT expr { printf "NOT\n" ; flush stdout }
;
type_expr : INTEGER { Integer } /*printf "INTEGER\n" ; flush stdout*/
	| BOOLEAN { Boolean } /*printf "BOOLEAN\n" ; flush stdout*/
	| ARRAY OF type_expr { Array ($3) } /*printf "ARRAY OF\n" ; flush stdout*/
;
%%