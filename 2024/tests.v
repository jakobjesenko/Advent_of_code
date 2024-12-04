fn main() {
	a := [3, 5, 7, 9]
	for i in 0..a.len {
		mut slice := []int{}
		slice << a[..i]
		slice << a[i+1..]
		println(slice)
	}
}