
let ic = open_in "./01.txt"
let s = input_line ic

let ss = List.map int_of_string (Str.split (Str.regexp "") s)

let s_size = List.length ss

let sss = List.fold_left
  (fun ini elm -> 
    (
      (if elm = List.nth ss (snd ini) then (fst ini) + elm else (fst ini)),
      ((snd ini) + 1) mod s_size
    )
  )
  (0, s_size / 2)
  ss