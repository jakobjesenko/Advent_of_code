
let read_lines name : int list list =
  let ic = open_in name in
  let try_read () =
    try Some (List.map int_of_string (Str.split (Str.regexp "[ \t]") (input_line ic))) with End_of_file -> None in
  let rec loop acc = match try_read () with
    | Some s -> loop (s :: acc)
    | None -> close_in ic; List.rev acc in
  loop []

let s = read_lines "./02.txt"

let ref_div x y = ((x mod y) = 0 || (y mod x) = 0) && x != y

let rec devisive_pair double_a a = 
  match double_a with
  | (x::x_tl, y::y_tl) -> if ref_div x y  then (max x y) / (min x y) else devisive_pair (x_tl, y::y_tl) a
  | ([], _::snd_tl) -> devisive_pair (a, snd_tl) a
  | ([], []) -> 0
  | _ -> 0

let ss = List.fold_left (fun ini elm -> ini + (devisive_pair (elm, elm) elm)) 0 s