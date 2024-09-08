(*#load "str.cma";;*)
let read_lines name : int list list =
  let ic = open_in name in
  let try_read () =
    try Some (List.map int_of_string (Str.split (Str.regexp "[ \t]") (input_line ic))) with End_of_file -> None in
  let rec loop acc = match try_read () with
    | Some s -> loop (s :: acc)
    | None -> close_in ic; List.rev acc in
  loop []

let s = read_lines "./02.txt"

let l_min a: int = 
  List.fold_left min (List.hd a) a

let l_max a: int = 
  List.fold_left max (List.hd a) a
let ss = List.fold_left
  (fun ini elm ->
    ini + ((l_max elm) - (l_min elm))
  )
  0
  s