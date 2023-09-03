import os
import crypto.md5

fn main() {
	door := os.read_file('05.txt')!.split('\n')[0]
	mut password := []string{len: 8, init: ''}
	mut i := u64(0)
	for {
		hash := md5.hexhash('${door}${i}')
		if hash[..5] == '00000' {
			if hash[5].is_digit() && hash[5] < '8'[0] {
				if password[hash[5..6].int()] == '' {
					password[hash[5..6].int()] = hash[6..7]
				}
			}
			if password.filter(it == '').len < 1 {
				break
			}
		}
		i++
	}
	println(password.join(''))
}