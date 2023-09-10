import os

fn main() {
	triples := os.read_lines('03.txt')!.map(it.split(' ').filter(it.len > 0).map(it.int()))
	mut count := 0
	for t in triples {
		if t[0] + t[1] > t[2] &&
			t[1] + t[2] > t[0] &&
			t[0] + t[2] > t[1] {

			count++
		}
	}
	println(count)
}