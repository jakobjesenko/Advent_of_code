import os

struct ItemPositions {
mut:
	types []string
	generators []int
	chips []int
	elevator int
	visited []string
}

fn main() {
	lines := os.read_lines('11.txt')!.map(it.split(' '))
	mut item_positions := ItemPositions{}
	for floor, line in lines {
		for index, token in line {
			if token == 'a' {
				item_positions.insert(line[index + 1], floor)
			}
		}
	}
	println(item_positions)
	println(item_positions.hash())
	println(item_positions.is_solved())
	println(item_positions.is_invalid())
}

fn (mut item_positions ItemPositions) calculate_steps(steps int) int {
	if item_positions.is_solved() {
		return 0
	}
	move
	if item_positions.hash() in item_positions.visited {
		return steps
	}
}

fn (mut item_positions ItemPositions) insert(token string, floor int) {
	arr := token.split('-')
	mut index := item_positions.types.index(arr[0])
	if index < 0 {
		index = item_positions.types.len
		item_positions.types << arr[0]
		item_positions.generators << 0
		item_positions.chips << 0
	}
	if arr.len > 1 {
		item_positions.chips[index] = floor
	} else {
		item_positions.generators[index] = floor
	}
}

fn (item_positions ItemPositions) hash() string {
	return item_positions.generators.map('${it}').join('') +
		item_positions.chips.map('${it}').join('') +
		'${item_positions.elevator}'
}

fn (item_positions ItemPositions) is_solved() bool {
	return item_positions.generators.all(it==3) &&
		item_positions.chips.all(it==3) &&
		item_positions.elevator == 3
}

fn (item_positions ItemPositions) is_invalid() bool {
	if item_positions.elevator < 0 || item_positions.elevator > 3 {
		return true
	}
	for index, chip in item_positions.chips {
		if chip != item_positions.generators[index] && item_positions.generators.any(it == chip) {
			return true
		}
	}
	return false
}