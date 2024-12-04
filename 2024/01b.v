import os

fn main(){
	mut left := []int{}
	mut right := []int{}
	for line in os.read_lines('01.txt')! {
		line2 := line.split('   ').map(it.int())
		left << line2[0]
		right << line2[1]
	}
	mut dist := 0
	for i in 0..left.len {

		dist += left[i] * count(right, left[i])
	}

	
	println(dist)
}

fn count (arr []int, x int) int {
	mut n := 0
	for v in arr {
		if v == x {
			n++
		}
	}
	return n
}