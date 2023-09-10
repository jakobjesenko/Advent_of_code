import os

struct Location {
mut:
	x int
	y int
}

fn main(){
	lines := os.read_lines('02.txt') or {return}
	keyboard := [
		['1', '2', '3'],
		['4', '5', '6'],
		['7', '8', '9']
	]
	mut loc := Location{1, 1}
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
	return loc.x < 0 || loc.y < 0 || loc.x > 2 || loc.y > 2
}