open Gfile
open Ff 

let () =

  (* Check the number of command-line arguments *)
  if Array.length Sys.argv <> 5 then
    begin
      Printf.printf "\nUsage: %s infile source sink outfile\n\n%!" Sys.argv.(0) ;
      exit 0
    end ;


  (* Arguments are : infile(1) source-id(2) sink-id(3) outfile(4) *)

  let infile = Sys.argv.(1)
  and outfile = Sys.argv.(4)

  (* These command-line arguments are not used for the moment. *)
  and _source = int_of_string Sys.argv.(2)
  and _sink = int_of_string Sys.argv.(3)
  in

  (* Open file *)
  let graph = from_file infile in

  (* TEST DE FORD FURK*)

  let graph_int = Tools.gmap graph int_of_string in

  let graph_ford = Ff.ford_fulk graph_int 0 5 in 

  let graph_str = Tools.gmap graph_ford string_of_int in

  let () = write_file outfile graph_str ;
    Gfile.export "graphs/graph_ford.txt" graph_str 
  in

  ()
