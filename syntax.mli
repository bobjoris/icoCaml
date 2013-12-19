(* Syntaxe abstraite du pseudo-pascal *)

type type_expr = Integer | Boolean | Array of type_expr;;

type var_list = ((string list)* type_expr) list;;

type unop =
  | UMinus | Not ;;

type binop =
  | Plus | Minus | Times | Div
  | Or | And 
  | Lt | Le | Gt | Ge | Eq | Ne ;;

type expression =
  | Int of int | Bool of bool
  | Un of unop * expression
  | Bin of binop * expression * expression
  | Get of string
  | Function_call of string * expression list
  | Geti of expression * expression
  | New of type_expr
  | Read
  | Readln ;;

type instruction =  
  | Set of string * expression
  | Sequence of instruction list
  | If of expression * instruction * instruction
  | While of expression * instruction
  | Procedure_call of string * expression list
  | Write of expression
  | Writeln of expression
  | Seti of expression * expression * expression ;;

  
type definition = Definition of var_list * type_expr option * var_list * instruction ;;

type func_def = Func_def of string * definition;;

type program = Program of var_list * (func_def list) * instruction ;;
