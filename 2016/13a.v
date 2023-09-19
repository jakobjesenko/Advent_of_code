import os

struct Tile {
	x int
	y int
	distance int
}

struct Point {
mut:
	x int
	y int
}

fn Point.new(t Tile) Point {
	return Point{t.x, t.y}
}

fn main() {
	salt := os.read_lines('13.txt')![0].int()


	start := Tile{1, 1, 0}
	finish := Point{31, 39}

	println(steps_to_finish(start, finish, salt))
}

fn steps_to_finish(start Tile, finish Point, salt int) int {
	mut queue := []Tile{}
	mut visited := []Point{}
	queue << start

	for queue.len > 0 {
		position := queue.first()
		queue.drop(1)
		if Point.new(position) == finish {
			return position.distance
		}
		visited << Point.new(position)
		for n in list_neighbours(position, visited, salt) {
			queue << n
		}
	}
	return -1
}

fn list_neighbours(position Tile, visited []Point, salt int) []Tile {
	mut temp := []Tile{}
	mut pos := Point.new(position)

	pos.x--
	if pos.x >= 0 && !(pos in visited) && is_free(pos.x, pos.y, salt) {
		temp << Tile{pos.x, pos.y, position.distance+1}
	}
	pos.x += 2
	if !(pos in visited) && is_free(pos.x, pos.y, salt) {
		temp << Tile{pos.x, pos.y, position.distance+1}
	}
	pos.x--
	pos.y--
	if pos.y >= 0 && !(pos in visited) && is_free(pos.x, pos.y, salt) {
		temp << Tile{pos.x, pos.y, position.distance+1}
	}
	pos.y += 2
	if !(pos in visited) && is_free(pos.x, pos.y, salt) {
		temp << Tile{pos.x, pos.y, position.distance+1}
	}
	return temp
}

fn is_free(x int, y int, salt int) bool {
	mut temp := u64(x*x + 3*x + 2*x*y + y + y*y + salt)
	mut count := u64(0)
	for temp > 0 {
		count += temp & 1
		temp >>>= 1
	}
	return count % 2 == 0
}