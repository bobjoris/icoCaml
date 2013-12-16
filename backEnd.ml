let print_call_graph_couple i f init =
    init^"  "^i^" -> "^f^";\n"
;;

(* Affiche le resultat sur la sortie standard *)
let print_call_graph graphe_appel nom_fichier = 
	print_string ("digraph diagprog\n{\n program;\n"^ (Hashtbl.fold print_call_graph_couple graphe_appel "") ^ "}\n");;


(* Export le resultat dans un fichier dot *)
let export_call_graph graphe_appel nom_fichier =
 let fichier_dot = open_out (nom_fichier^".dot") in
 output_string fichier_dot ("digraph diagprog\n{\n program;\n");
 output_string fichier_dot (Hashtbl.fold print_call_graph_couple graphe_appel "");
 output_string fichier_dot "}\n"; 
 close_out fichier_dot;; 