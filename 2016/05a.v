import os
import crypto.md5

fn main() {
	door := os.read_file('05.txt')!.split('\n')[0]
	mut password := ''
	mut i := u64(0)
	for {
		hash := md5.hexhash('${door}${i}')
		if hash[..5] == '00000' {
			password += hash[5..6]
			if password.len >= 8 {
				break
			}
		}
		i++
	}
	println(password)
}