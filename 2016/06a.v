import os

fn main() {
	lines := os.read_lines('06.txt') or {return}
	mut message := ''
	for i in 0 .. lines[0].len {
		mut counts := map[u8]int{}
		for line in lines {
			counts[line[i]]++
		}
		mut max_count := 0
		mut max_key := u8(0)
		for key, count in counts {
			if count > max_count {
				max_count = count
				max_key = key
			}
		}
		message += max_key.ascii_str()
	}
	println(message)
}