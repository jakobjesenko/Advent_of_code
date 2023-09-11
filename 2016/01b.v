import os

fn main(){
	line := os.read_lines('01.txt')![0].split(', ')
	mut visited := [[0, 0]]
	mut position := [0, 0]
	mut direction := 0
	for move in line {
		if move[0] == `R` {
			direction = (direction + 1) % 4
		} else {
			direction = (direction + 3) % 4
		}
		for _ in 0..move[1..].int() {
			match direction {
				0 {
					position[0]++
				}
				1 {
					position[1]++
				}
				2 {
					position[0]--
				}
				3 {
					position[1]--
				}
				else {}
			}
			if position in visited {
				println(abs(position[0]) + abs(position[1]))
				return
			}
			visited << position.clone()
		}
	}
	println(abs(position[0]) + abs(position[1]))
}

fn abs(x int) int {
	return if x < 0 { -x } else { x }
}