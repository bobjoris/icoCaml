%{
open Printf
open Syntax
%}

/* Ocamlyacc Declarations */
%token <int> NUM
%token BEGIN END DOT
%token PROGRAM
%token FUNCTION PROCEDURE
%token INTEGER
%token <string> ID
%token LPAREN RPAREN COLONEQ COLON SEMICOLON 
%token LT LE GT GE EQ NE
%token IF THEN ELSE
%token PLUS

%start input
%type  <unit> input

/* Grammar follows */
%%
input: /* empty */ {}
	|PROGRAM definitions DOT { printf "program\n" ; flush stdout }
;

definitions: /*empty*/ {}
	|FUNCTION ID LPAREN RPAREN COLON INTEGER SEMICOLON block SEMICOLON definitions { printf "function %s\n" $2; flush stdout }	
	|PROCEDURE ID LPAREN ID COLON INTEGER RPAREN SEMICOLON block SEMICOLON definitions { printf "procedure %s %s\n" $2 $4 ; flush stdout }	
	|block {} 
;

block: BEGIN cond END { printf "begin end\n" ; flush stdout  }
;

cond: IF expr THEN expr ELSE expr { printf "if else\n" ; flush stdout }
	|expr {}
;

expr: ID COLONEQ expr {}
	|NUM SEMICOLON expr { printf "%d\n" $1 ; flush stdout  }
	|NUM { printf "%d\n" $1 ; flush stdout  }
	|ID LT NUM { printf "LT\n" ; flush stdout }
	|ID LE NUM { printf "LE\n" ; flush stdout }
	|ID GT NUM { printf "GT\n" ; flush stdout }
	|ID GE NUM { printf "GE\n" ; flush stdout }
	|ID EQ NUM { printf "EQ\n" ; flush stdout }
	|ID NE NUM { printf "NE\n" ; flush stdout }
	|NUM PLUS NUM { printf "plus %d %d\n" $1 $3 ; flush stdout }
	| {}
;
%%