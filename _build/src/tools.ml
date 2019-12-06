open Graph


let clone_nodes g = 
  n_fold g (new_node) empty_graph 


let gmap g f = 

  let inter gbase id1 id2 varc =
    new_arc gbase id1 id2 (f varc)
  in 

  e_fold g (inter) (clone_nodes g)


let add_arc g id1 id2 n = 

  if find_arc g id1 id2 = None 
  then new_arc g id1 id2 n
  else
    let add_n id_1 id_2 v_init =
      if id_1 = id1 && id_2 = id2
      then v_init + n
      else v_init
    in
    let inter gbase id1 id2 varc =
      new_arc gbase id1 id2 (add_n id1 id2 varc)
    in 

    e_fold g (inter) (clone_nodes g)




