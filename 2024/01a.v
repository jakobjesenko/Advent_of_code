import os

fn main(){
	mut left := []int{}
	mut right := []int{}
	for line in os.read_lines('01.txt')! {
		line2 := line.split('   ').map(it.int())
		left << line2[0]
		right << line2[1]
	}
	left.sort()
	right.sort()
	mut dist := 0
	for i in 0..left.len {

		dist += abs(left[i] - right[i])
	}

	
	println(dist)
}

fn abs(x int) int {
	return if x < 0 { -x } else { x }
}