open Syntax;;

let rec remove_dups lst = 
    match lst with 
    | [] -> []
    | h::t -> h::(remove_dups (List.filter (fun x -> x<>h) t))
;;


let rec make_call_graph_expr expr = 
    match expr with
    | Un(u,e) -> make_call_graph_expr e
    | Bin(b,e1,e2) -> (make_call_graph_expr e1) @ (make_call_graph_expr e2)
    | Function_call(s,e::el) -> (make_call_graph_expr e) @ (make_call_graph_expr (Function_call(s,el))) @ [s]
    | Function_call(s,_) -> [s]
    | Geti(e1,e2) -> (make_call_graph_expr e1) @ (make_call_graph_expr e2)
    | Read -> ["read"]
    | Readln -> ["readln"]
    | _ -> []
;;

let rec make_call_graph_instr instr = 
    match instr with
    | Sequence(i::l) ->  (make_call_graph_instr i) @ (make_call_graph_instr (Sequence(l)))
    | Set(s,e) -> (make_call_graph_expr e)
    | If(e,i1,i2) -> (make_call_graph_expr e) @ (make_call_graph_instr i1) @ (make_call_graph_instr i2)
    | While(e,i) -> (make_call_graph_expr e) @ (make_call_graph_instr i)
    | Procedure_call(s,e::el) -> (make_call_graph_expr e) @ (make_call_graph_instr (Procedure_call(s,el))) @ [s]
    | Procedure_call(s,_) -> [s]
    | Write(e) -> ["write"] @ (make_call_graph_expr e)
    | Writeln(e) -> ["writeln"] @ (make_call_graph_expr e)
    | Seti(e1,e2,e3) -> (make_call_graph_expr e1) @ make_call_graph_expr e2 @ (make_call_graph_expr e3)
    | _ -> []
;;


let rec make_call_graph_fonct fonctions graph_appel = 
	match fonctions with
	| Func_def(nom, Definition(w,x,c,instr))::r -> make_call_graph_fonct r graph_appel ; 
                           (List.iter (Hashtbl.add graph_appel nom) (remove_dups(make_call_graph_instr instr)))
    | _ -> ()
;;



let make_call_graph abr_syntaxe = 
    (* Création de la table de hash pour stocker les couples de fonctions appelant/appeler *)
	let t_hash = Hashtbl.create 100 in
		match abr_syntaxe with
	| Program(var_decl, fonctions, instructions) -> make_call_graph_fonct fonctions t_hash ; 
                      (List.iter (Hashtbl.add t_hash "program") (remove_dups(make_call_graph_instr instructions))) ; 
                      t_hash
;;
