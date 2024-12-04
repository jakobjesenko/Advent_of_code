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
	

	for y in 0..lines.len {
		for x in 0..lines[0].len {
			for dir in int(Directions.n)..int(Directions.nw)+1 {
				if find_word(lines, x, y, Directions.from(dir)!, 0) {
					count++
				}
			}
		}
	}

	println(count)
}

fn find_word(puzzle []string, x int, y int, dir Directions, length int) bool {
	if length == 4 {
		return true
	}
	if !((x in 0..puzzle[0].len) && (y in 0..puzzle.len)) {
		return false
	}
	if word[length] != puzzle[y][x] {
		return false
	}
	match dir {
		.n { return find_word(puzzle, x, y-1, dir, length+1) }
		.ne { return find_word(puzzle, x+1, y-1, dir, length+1) }
		.e { return find_word(puzzle, x+1, y, dir, length+1) }
		.se { return find_word(puzzle, x+1, y+1, dir, length+1) }
		.s { return find_word(puzzle, x, y+1, dir, length+1) }
		.sw { return find_word(puzzle, x-1, y+1, dir, length+1) }
		.w { return find_word(puzzle, x-1, y, dir, length+1) }
		.nw { return find_word(puzzle, x-1, y-1, dir, length+1) }
	}
}

fn abs(x int) int {
	return if x < 0 { -x } else { x }
}