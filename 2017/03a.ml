
let vhod = 
  let cin = open_in "./03.txt" in
    let l = input_line cin in
      int_of_string l

let rec closest_larger_odd_square x n =
  if (n * n >= x) then
    n
  else
    closest_larger_odd_square x (n + 2)

let ss = 
  let n = closest_larger_odd_square vhod 1 in
    n / 2 +
    abs ((n*n - vhod) mod (n - 1) - n / 2)