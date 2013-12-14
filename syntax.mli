(* Syntaxe abstraite des expression de type *)
type type_expr = Integer | Boolean | Array of type_expr;;
type var_list = ((string list)* type_expr) list;;

type instruction = string ;;
type definition = var_list * type_expr option * var_list * instruction ;;
type definition1 = string * int ;;

type program = var_list * ((string * definition) list) * (instruction list) ;;
(* {
     global_vars : var_list; 
    (* variables globales *)
    definitions : (string * definition) list;
    (* fonctions et procédures globales *)
    main : instruction;
    (* corps principal du programme *)
  } 
and definition = {
    arguments : var_list; result : type_expr option;
    (* arguments  et type du résultat *)
    local_vars : var_list;
    (* variables locales *)
    body : instruction;
    (* corps de la fonction *)
  }

and expression =
  | Int of int | Bool of bool
    (* constantes *)
  | Bin of binop * expression * expression
    (* expressions arithétiques *)
  | Get of string
    (* accès à une variable *)
  | Function_call of string * expression list
    (* appel de fonction *)
  | Geti of expression * expression
    accès dans un tableau à une position
  | Alloc of expression * type_expr
    (* Création d'un tableau d'une certaine taille *)

and binop =
  | Plus | Minus | Times | Div
    (* arithmétique *)
  | Lt | Le | Gt | Ge | Eq | Ne 
    (* comparaisons *) 

and instruction = 
  | Set of string * expression
    (* Affectation d'une variable *)
  | Sequence of instruction list
    (* Suite d'instructions *)
  | If of expression * instruction * instruction
  | While of expression * instruction
  | Procedure_call of string * expression list
    (* Appel de procédure *)
  | Write_int of expression
  | Writeln_int of expression
    (* Ecriture d'un entier sans ou avec retour à la ligne *)
  | Read_int of string
    (* Affectation dans un tableau *)
  | Seti of expression * expression * expression
 *)