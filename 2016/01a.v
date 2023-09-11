import os

fn main(){
	line := os.read_lines('01.txt')![0].split(', ')
	mut distance := []int{len: 4, init: 0}
	mut direction := 0
	for move in line {
		if move[0] == `R` {
			direction = (direction + 1) % 4
		} else {
			direction = (direction + 3) % 4
		}
		distance[direction] += move[1..].int()
	}
	println(abs(distance[0] - distance[2]) + abs(distance[1] - distance[3]))
}

fn abs(x int) int {
	return if x < 0 { -x } else { x }
}