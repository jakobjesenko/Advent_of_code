import os

struct Location {
mut:
	x int
	y int
}

fn main(){
	lines := os.read_lines('02.txt') or {return}
	keyboard := [
		['', '', '1', '', ''],
		['', '2', '3', '4', ''],
		['5', '6', '7', '8', '9'],
		['', 'A', 'B', 'C', ''],
		['', '', 'D', '', '']
	]
	mut loc := Location{2, 2}
	mut password := ''
	for line in lines {
		for c in line {
			match c {
				`L` {
					loc.x--
					if loc.not_in_bounds() {
						loc.x++
					}
				}
				`U` {
					loc.y--
					if loc.not_in_bounds() {
						loc.y++
					}
				}
				`R` {
					loc.x++
					if loc.not_in_bounds() {
						loc.x--
					}
				}
				`D` {
					loc.y++
					if loc.not_in_bounds() {
						loc.y--
					}
				}
				else {}
			}
		}
		password += keyboard[loc.y][loc.x]
	}
	println(password)
}

fn (loc Location) not_in_bounds() bool {
	return abs(loc.x - 2) + abs(loc.y - 2) > 2
}

fn abs(x int) int {
	return if x < 0 { -x } else { x }
}