import os
import arrays

struct Display {
mut:
	pixels [][]u8
}

fn main(){
	lines := os.read_lines('08.txt')!.map(it.split(' '))
	mut display := Display{}
	display.init(50, 6)
	for line in lines {
		if line[0] == 'rect' {
			dim := line.last().split('x').map(it.int())
			display.rect(dim[0], dim[1])
		} else if line [1] == 'row' {
			display.rotate_row(line[2][2..].int(), line.last().int())
		} else {
			display.rotate_col(line[2][2..].int(), line.last().int())
		}
	}
	println(display.pixels.map(it.map(if it == 1 {'⬛'} else {'⬜'}).join('')).join('\n'))
}

fn (mut display Display) init(width int, height int){
	for _ in 0..height {
		display.pixels << []u8{len: width, init: 0}
	}
}

fn (mut display Display) rect(width int, height int) {
	for i in 0..width {
		for j in 0..height {
			display.pixels[j][i] = 1
		}
	}
}

fn (mut display Display) rotate_row(row int, offset int){
	arrays.rotate_right(mut display.pixels[row], offset)
}

fn (mut display Display) rotate_col(col int, offset int){
	mut column := display.pixels.clone().map(it[col])
	arrays.rotate_right(mut column, offset)
	for index, val in column {
		display.pixels[index][col] = val
	}
}