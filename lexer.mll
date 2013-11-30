{
  open Pseudopascal
}

let digit = ['0'-'9']

rule token = parse
  | [' ' '\t' '\n']	{ token lexbuf }
  | digit+ as num 
    { NUM (int_of_string num) }
  | ';'   { SEMICOLON }
  | "<"   { LT }
  | "<="  { LE }
  | ">"   { GT }
  | ">="  { GE }
  | "="   { EQ }
  | "<>"  { NE }
  | "("   { LPAREN }
  | ")"   { RPAREN }
  | ":="  { COLONEQ } 
  | ":"   { COLON }
  | "." { DOT }
  | "program"  { PROGRAM }
  | "begin"  { BEGIN }
  | "end"  { END }
  | "procedure"  { PROCEDURE }
  | "function"  { FUNCTION }
  | "integer"   { INTEGER }
  | "if"  { IF }
  | "then"  { THEN }
  | "else"  { ELSE }
  | ['A'-'Z''a'-'z']['A'-'Z''a'-'z''0'-'9']* as id { ID (id) }
  | eof		{ raise End_of_file }