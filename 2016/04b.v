import os

struct CharCounts {
mut:
	chars []string
	counts []int
}

fn main() {
	lines := os.read_lines('04.txt') or {return}
	for line in lines {
		mut char_counts := CharCounts{}
		for c in line {
			if c == `-` {
				continue
			} else if c.is_digit() {
				break
			}
			if c.ascii_str() in char_counts.chars {
				char_counts.counts[char_counts.chars.index(c.ascii_str())]++
			} else {
				char_counts.chars << c.ascii_str()
				char_counts.counts << 1
			}
		}
		char_counts.sort()
		if decypher(line).contains('pole') {
			println(char_counts.room_value(line))
		}
	}
}

fn (mut char_counts CharCounts) sort() {
	for i in 0..char_counts.chars.len {
		for j in i+1..char_counts.chars.len {
			if char_counts.counts[j] > char_counts.counts[i] {
				char_counts.chars[i], char_counts.chars[j] = char_counts.chars[j], char_counts.chars[i]
				char_counts.counts[i], char_counts.counts[j] = char_counts.counts[j], char_counts.counts[i]
			} else if char_counts.counts[j] == char_counts.counts[i]  {
				if char_counts.chars[j][0] < char_counts.chars[i][0] {
					char_counts.chars[i], char_counts.chars[j] = char_counts.chars[j], char_counts.chars[i]
					char_counts.counts[i], char_counts.counts[j] = char_counts.counts[j], char_counts.counts[i]
				}
			}
		}
	}
}

fn (mut char_counts CharCounts) room_value(line string) int {
	check := line.split('[')[1][..5]
	if char_counts.chars[..5].join('') == check {
		return line.split('-').last().split('[')[0].int()
	} else {
		return 0
	}
}

fn decypher(line string) string {
	a := 'a'[0]
	amount := line.split('-').last().split('[')[0].int()
	mut result := ''
	for c in line {
		if c == `-` {
			result += ' '
		} else if c.is_digit() {
			break
		} else {
			result += u8((c - a + amount) % 26 + a).ascii_str()
		}
	}
	return result
}