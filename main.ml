open MiddleEnd;;
open BackEnd;;


let main () =
  try
  let name = Sys.argv.(1) in
  let ic = open_in name in
    let lexbuf = Lexing.from_channel ic in
      let pgm = Pseudopascal.input Lexer.token lexbuf in
      let graph_appel = make_call_graph pgm in print_call_graph graph_appel name; export_call_graph graph_appel name;
      exit 0;
  with End_of_file -> exit 0
;;

let _ = Printexc.print main ()
;;

main()
;;