let main () =
  try
  let ic = open_in Sys.argv.(1) in
    let lexbuf = Lexing.from_channel ic in
    (* while true do *)
      let pgm = Pseudopascal.input Lexer.token lexbuf in
      Printf.printf "Parsing OK\n" ; exit 0
    (* done *)
  with End_of_file -> exit 0
;;

let _ = Printexc.print main ()
;;

main()
;;