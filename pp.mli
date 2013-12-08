(* Syntaxe abstraite des expression de type *)
type type_expr = Integer | Boolean | Array of type_expr;;
type var_list = (string * type_expr) list;;

type program = {
    global_vars : var_list; 
    (* variables globales *)
    definitions : (string * definition) list;
    (* fonctions et proc�dures globales *)
    main : instruction;
    (* corps principal du programme *)
  } 
and definition = {
    arguments : var_list; result : type_expr option;
    (* arguments  et type du r�sultat *)
    local_vars : var_list;
    (* variables locales *)
    body : instruction;
    (* corps de la fonction *)
  }

and expression =
  | Int of int | Bool of bool
    (* constantes *)
  | Bin of binop * expression * expression
    (* expressions arith�tiques *)
  | Get of string
    (* acc�s � une variable *)
  | Function_call of string * expression list
    (* appel de fonction *)
  | Geti of expression * expression
    (* acc�s dans un tableau � une position *)
  | Alloc of expression * type_expr
    (* Cr�ation d'un tableau d'une certaine taille *)

and binop =
  | Plus | Minus | Times | Div
    (* arithm�tique *)
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
    (* Appel de proc�dure *)
  | Write_int of expression
  | Writeln_int of expression
    (* Ecriture d'un entier sans ou avec retour � la ligne *)
  | Read_int of string
    (* Affectation dans un tableau *)
  | Seti of expression * expression * expression
