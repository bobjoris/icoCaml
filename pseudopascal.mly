%{
open Printf;;
open Syntax;;
%}

/* Déclaration des tokens Ocamlyacc */
%token <int> NUM
%token <string> ID
%token <bool> BOOL
%token PROGRAM BEGIN END DOT
%token FUNCTION PROCEDURE VAR
%token INTEGER BOOLEAN ARRAY OF TYPE NEW
%token LT LE GT GE EQ NE OR AND NOT
%token LPAREN RPAREN LBRACKET RBRACKET
%token COLONEQ COLON SEMICOLON COMMA
%token IF THEN ELSE WHILE DO 
%token PLUS MINUS TIMES DIV 
%token WRITE WRITELN READ READLN

%left LT LE GT GE EQ NE
%left AND OR
%left PLUS MINUS 
%left TIMES DIV 

%nonassoc UMINUS
%nonassoc LBRACKET
%nonassoc NOT 

%start input
%type <Syntax.program> input

/* Regles de la grammaire pseudo-pascal */
%%
/* Séparation des variables globales, les definitions de fonctions et procedures et les instructions du programme */
input: PROGRAM variables definitions instructions DOT { Program($2 , $3 , $4) } 
;
/* Variables globales et locales */
variables: { [] }
	| VAR variable SEMICOLON variables_multiples { $2 :: $4 }
;
variables_multiples: { [] }
	| variable SEMICOLON variables_multiples { $1 :: $3 }
;
variable: idlist COLON type_expr { $1 , $3 } 
;
idlist: ID { [$1] }
	| ID COMMA idlist { $1 :: $3 }
;
/* Definitions des fonctions et procedures */
definitions: { [] }
	| fonctions SEMICOLON definitions { $1 :: $3 }
;
fonctions: FUNCTION ID LPAREN arguments_fonctions RPAREN COLON type_expr SEMICOLON variables instructions 
		{ Func_def($2, Definition($4, Some $7, $9, $10 )) }
	| PROCEDURE ID LPAREN arguments_fonctions RPAREN SEMICOLON variables instructions 
		{ Func_def($2, Definition($4, None , $7, $8 )) }	
;
arguments_fonctions: { [] }
	| ID arguments_multiples COLON type_expr { [($1 :: $2 , $4)] } 
	| ID arguments_multiples COLON type_expr SEMICOLON arguments_fonctions { ($1 :: $2 , $4) :: $6 }
;
arguments_multiples: { [] }
	| COMMA ID arguments_multiples { $2 :: $3 }
;
/* Blocs d'instructions */
instructions: ID COLONEQ expr { Set ($1, $3) }
	| BEGIN blocs END { Sequence $2 }
	| IF expr THEN instructions ELSE instructions { If ($2, $4, $6) }
	| WHILE expr DO instructions { While ($2, $4) }
	| ID LPAREN arguments RPAREN { Procedure_call ($1, $3) }
	| WRITE LPAREN expr RPAREN      { Write ($3) }
	| WRITELN LPAREN expr RPAREN    { Writeln ($3) }
	| expr LBRACKET expr RBRACKET COLONEQ expr { Seti ($1, $3, $6) }
;
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
/* Definitions des expressions */
expr: LPAREN expr RPAREN { $2 }
	| NUM { Int $1  }
	| MINUS expr { Un (UMinus, $2) }
	| BOOL {Bool $1 }
	| READ LPAREN RPAREN         	{ Read }
	| READLN LPAREN RPAREN       	{ Readln }
	| NEW type_expr { New $2 }
	| ID { Get $1 }
	| ID LPAREN arguments RPAREN { Function_call ($1, $3) }
	| expr LBRACKET expr RBRACKET { Geti ($1, $3) }
	| expr PLUS expr { Bin (Plus, $1, $3) }
	| expr MINUS expr { Bin (Minus, $1, $3)}
	| expr TIMES expr { Bin (Times, $1, $3) }
	| expr DIV expr { Bin (Div, $1, $3) }
	| expr LT expr { Bin (Lt, $1, $3) }
	| expr LE expr { Bin (Le, $1, $3) }
	| expr GT expr { Bin (Gt, $1, $3) }
	| expr GE expr { Bin (Ge, $1, $3) }
	| expr EQ expr { Bin (Eq, $1, $3) }
	| expr NE expr { Bin (Ne, $1, $3) }
	| expr OR expr { Bin (Or, $1, $3) }
	| expr AND expr { Bin (And, $1, $3) }
	| NOT expr { Un (Not, $2) }
;
/* Definitions des types des expressions (booleen, entier ou liste de booleen ou d'entier) */
type_expr : INTEGER { Integer }
	| BOOLEAN { Boolean } 
	| ARRAY OF type_expr { Array ($3) }
;
%%