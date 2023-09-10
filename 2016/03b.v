import os

fn main() {
	triples_ := os.read_lines('03.txt')!.map(it.split(' ').filter(it.len > 0).map(it.int()))
	mut triples := [][]int{len: triples_.len, init: []int{len: 3}}
	mut count := 0
	for i in 0..triples.len*3 {
		triples[i/3][i%3] = triples_[i%triples.len][i/triples.len]
	}
	for t in triples {
		if t[0] + t[1] > t[2] &&
			t[1] + t[2] > t[0] &&
			t[0] + t[2] > t[1] {

			count++
		}
	}
	println(count)
}