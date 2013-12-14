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
	{ $2 , $3 , $4 } /*printf "program\n" ; flush stdout ; */
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
		{ $2, ($4, Some $7, $9, $10 ) } /*printf "function %s\n" $2; flush stdout*/
	|PROCEDURE ID LPAREN args RPAREN SEMICOLON vars instructions 
		{ $2, ($4, None , $7, $8 ) } /*printf "procedure %s %s\n" $2 $2 ; flush stdout*/	
;
args: { [] }
/*	|var args1 {}*/
	| ID args1 COLON type_expr { [($1 :: $2 , $4)] } /*printf "var  args1\n"  ; flush stdout*/
	| ID args1 COLON type_expr SEMICOLON args { ($1 :: $2 , $4) :: $6 } /*printf "var  args1\n"  ; flush stdout*/
;
args1: { [] }
	| COMMA ID args1 { $2 :: $3 } /*printf "COMMA %s args1\n" $2 ; flush stdout*/
;
instructions: ID COLONEQ expr { Set ($1, $3) }
	| BEGIN blocs END { Sequence $2 }
	| IF expr THEN instructions ELSE instructions { If ($2, $4, $6) }
	| WHILE expr DO instructions { While ($2, $4) }
	| ID LPAREN arguments RPAREN { Procedure_call ($1, $3) }
	| READ LPAREN ID RPAREN            { Read ($3) }
	| WRITE LPAREN expr RPAREN      { Write ($3) }
	| WRITELN LPAREN expr RPAREN    { Writeln ($3) }
	| expr LBRACKET expr RBRACKET COLONEQ expr { Seti ($1, $3, $6) }
;
/*commentaire : {}
	| LBRACKET STRING RBRACKET { printf "comment %s\n" $2; flush stdout }
;*/
blocs: { [] }
	| instructions bloc { $1 :: $2 }
;
bloc: { [] }
	| SEMICOLON instructions bloc { $2 :: $3 }
;
arguments: { [] }
	| expr argument { $1 :: $2 }
;
argument: { [] }
	| COMMA expr argument { $2 :: $3 }
;
expr: LPAREN expr RPAREN { $2 }
	| NUM { Int $1  }
	| MINUS expr /*%prec UMINUS */ { Un (UMinus, $2) }
	| BOOL {Bool $1 }
	| READLN LPAREN RPAREN { Readln }
	| NEW type_expr { New $2 }
	| ID { Get $1 }
	| ID LPAREN arguments RPAREN { Function_call ($1, $3) }
	| expr LBRACKET expr RBRACKET { Geti ($1, $3) }
	|expr PLUS expr { Bin (Plus, $1, $3) }
	|expr MINUS expr { Bin (Minus, $1, $3)}
	|expr TIMES expr { Bin (Times, $1, $3) }
	|expr DIV expr { Bin (Div, $1, $3) }
	|expr LT expr { Bin (Lt, $1, $3) }
	|expr LE expr { Bin (Le, $1, $3) }
	|expr GT expr { Bin (Gt, $1, $3) }
	|expr GE expr { Bin (Ge, $1, $3) }
	|expr EQ expr { Bin (Eq, $1, $3) }
	|expr NE expr { Bin (Ne, $1, $3) }
	|expr OR expr { Bin (Or, $1, $3) }
	|expr AND expr { Bin (And, $1, $3) }
	|NOT expr { Un (Not, $2) }
;
type_expr : INTEGER { Integer } /*printf "INTEGER\n" ; flush stdout*/
	| BOOLEAN { Boolean } /*printf "BOOLEAN\n" ; flush stdout*/
	| ARRAY OF type_expr { Array ($3) } /*printf "ARRAY OF\n" ; flush stdout*/
;
%%