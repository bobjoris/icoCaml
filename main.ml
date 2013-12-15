open MiddleEnd;;


let main () =
  try
  let name = Sys.argv.(1) in
  let ic = open_in name in
    let lexbuf = Lexing.from_channel ic in
    (* while true do *)
      let pgm = Pseudopascal.input Lexer.token lexbuf in
      let graph_appel = make_call_graph pgm in print_call_graph graph_appel name;
      (*Printf.printf "Parsing OK\n" *); 
      exit 0;
    (* done *)
  with End_of_file -> exit 0
;;

let _ = Printexc.print main ()
;;

main()
;;