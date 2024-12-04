import os

enum Directions {
	n
	ne
	e
	se
	s
	sw
	w
	nw
}
const word := 'XMAS'

fn main(){
	lines := os.read_lines('04.txt')!
	
	mut count := 0
	

	for y in 1..lines.len-1 {
		for x in 1..lines[0].len-1 {
			if find_x(lines, x, y) {
				count++
			}
		}
	}

	println(count)
}

fn find_x(puzzle []string, x int, y int) bool {
	if puzzle[y][x] != 'A'[0] {
		return false
	}
	mas1 := [puzzle[y-1][x-1], puzzle[y][x], puzzle[y+1][x+1]].bytestr()
	mas2 := [puzzle[y-1][x+1], puzzle[y][x], puzzle[y+1][x-1]].bytestr()
	return (mas1 == 'MAS' || mas1 == 'SAM') && (mas2 == 'MAS' || mas2 == 'SAM')
}

fn abs(x int) int {
	return if x < 0 { -x } else { x }
}