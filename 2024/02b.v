import os

fn main(){
	mut safe_count := 0
	for line in os.read_lines('02.txt')! {
		line2 := line.split(' ').map(it.int())
		mut slice_safe := false
		for i in 0..line2.len {
			mut slice := []int{}
			slice << line2[..i]
			slice << line2[i+1..]
			if is_safe(slice) {
				slice_safe = true
			}
		}
		if slice_safe || is_safe(line2) {
			safe_count++
		}
	}
	println(safe_count)
}

fn abs(x int) int {
	return if x < 0 { -x } else { x }
}

fn is_safe(arr []int) bool {
	mut ascending := 0
	mut descending := 0
	for i in 1..arr.len {
		diff := arr[i] - arr[i - 1]
		if !(abs(diff) in 1..4) {
			return false
		}
		if diff > 0 {
			ascending++
		} else {
			descending++
		}
	}
	if ascending * descending == 0 {
		return true
	} else {
		return false
	}
}