let print_call_graph_couple i f init =
    init^"  "^i^" -> "^f^";\n"
;;


let print_call_graph graphe_appel nom_fichier = 
	print_string ("digraph "^ nom_fichier ^"\n{\n program;\n"^ (Hashtbl.fold print_call_graph_couple graphe_appel "") ^ "}\n")

let export_call_graph graphe_appel nom_fichier =
 let fichier_dot = open_out ("export/"^nom_fichier^".dot") in
 output_string fichier_dot ("digraph "^ nom_fichier ^"\n{\n program;\n");
 output_string fichier_dot (Hashtbl.fold print_call_graph_couple graphe_appel "");
 output_string fichier_dot "}\n"; 
 close_out fichier_dot;; 