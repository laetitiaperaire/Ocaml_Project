open Graph
open Tools

type path = id list


let rec find_path g forb id1 id2 = 

  let rec loop l = 

    match l with 
    | [] -> None
    | (id , a) :: rest -> 
      if a = 0 then loop rest
      else if id == id2  
      then Some (List.append forb [id])  

      else if List.exists (fun i -> i = id) forb
      then  loop rest 

      else 
        let valu = find_path g (List.append forb [id]) id id2 in
        if valu = None then loop rest else valu

  in
  loop (out_arcs g id1)



let rec capa g origin acum = function
  | [] -> acum
  | id :: rest -> 
    let current = find_arc g origin id in
    match (current) with
    | Some c -> capa g id (min acum c) rest
    | _ -> failwith "problem"



let rec modif dispo gr deb = function
  |[] -> gr
  |id :: rest -> 
    let gretape1 = add_arc gr deb id (-dispo) in
    let gretape2 = add_arc gretape1 id deb dispo in 

    modif dispo gretape2 id rest


let ford_fulk g id1 id2 =

  let rec loop gr =

    let chemin = find_path gr [] id1 id2 in

    match chemin with
    | None -> gr
    | Some route ->
      let cap = capa gr id1 max_int route in
      let grmodif = modif cap gr id1 route in 
      (*
        let a = print_string (String.concat " " (List.map string_of_int route));
        Printf.printf "\n";
        ()
        in
        a;
      *)
      loop grmodif
  in
  loop g

