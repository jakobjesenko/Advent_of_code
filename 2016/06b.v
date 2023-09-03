import os

fn main() {
	lines := os.read_lines('06.txt') or {return}
	mut message := ''
	for i in 0 .. lines[0].len {
		mut counts := map[u8]int{}
		for line in lines {
			counts[line[i]]++
		}
		mut min_count := lines.len
		mut min_key := u8(0)
		for key, count in counts {
			if count < min_count {
				min_count = count
				min_key = key
			}
		}
		message += min_key.ascii_str()
	}
	println(message)
}