import os
import arrays

fn main() {
	lines := os.read_lines('07.txt')!.map(tokenize(it))
	println(arrays.fold[[]string, int](lines, 0,
		fn (acc int, element []string) int {return acc + if has_abba(element) {1} else {0}}
	))
}

fn tokenize(line string) []string {
	mut tokens := ['']
	mut token_index := 0
	for c in line {
		match c {
			'\n'[0] {break}
			'['[0], ']'[0] {
				tokens << ''
				token_index++
				}
			else {
				tokens[token_index] += c.ascii_str()
			}
		}
	}
	return tokens
}

fn has_abba(line []string) bool {
	mut super := ''
	mut hyper := ''

	for index, token in line {
		if index % 2 == 0 {
			super += ' ' + token
		} else {
			hyper += ' ' + token
		}
	}
	return string_has_abba(super) && !string_has_abba(hyper)
}

fn string_has_abba(addr string) bool {
	mut part := '0000'
	for i in 0 .. addr.len - 3 {
		part = addr[i..i + 4]
		if part[0] == part[3] && part[1] == part[2] && part[0] != part[1] {
			return true
		}
	}
	return false
}