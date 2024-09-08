let vhod = 
  let cin = open_in "./03.txt" in
    let l = input_line cin in
      int_of_string l

let rec closest_larger_odd_square x n =
  if (n * n >= x) then
    n
  else
    closest_larger_odd_square x (n + 2)

let is_corner x n =
  if x = n*n then true
  else if x + n - 1 = n*n then true
  else (if x + 2*n - 2 = n*n then true
  else (((if x + 3*n - 3 = n*n then true
  else false
  ))))

let rec get_value = function
| 1 -> 1
| 2 -> 1
| n -> (* v kotu -> 2 soseda / na robu -> 3 sosedi*) n