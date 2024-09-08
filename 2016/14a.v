import os
import crypto.md5

fn main() {
	salt := os.read_lines('14.txt')![0]

	store := []string{}

	println(makes_key(0, salt, store))
}

fn makes_key(num int, s string, store []string) bool {
	return true
}

fn many_hash(num int, s string, mut store []string) string {
	if store.len > num {
		return store[num]
	}
	mut temp := s + num.str()
	for _ in 0..2017 {
		temp = md5.hexhash(temp)
	}
	store << temp
	return temp
}
