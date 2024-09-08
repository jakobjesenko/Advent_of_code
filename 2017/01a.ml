
let ic = open_in "./01.txt"
let s = input_line ic

let ss = List.map int_of_string (Str.split (Str.regexp "") s)

let sss = List.fold_left
  (fun ini elm -> 
    (
      (if elm = (snd ini) then (fst ini) + elm else (fst ini)),
      elm
    )
  )
  (0, int_of_string (Str.last_chars s 1))
  ss