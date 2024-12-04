import os

fn main(){
	mut safe_count := 0
	for line in os.read_lines('02.txt')! {
		line2 := line.split(' ').map(it.int())
		if is_safe(line2) {
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