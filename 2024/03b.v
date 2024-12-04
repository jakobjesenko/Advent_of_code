import os
import regex

fn main(){
	text := os.read_file('03.txt')!
	mut re := regex.regex_opt(r'(mul\(\d{1,3},\d{1,3}\))|(do\(\))|(don' + '\'' + r't\(\))') or { panic(err) }
	ops := re.find_all_str(text)
	mut re2 := regex.regex_opt(r'\d+') or { panic(err) }
	mut sum := 0
	mut enabled := true
	for op in ops {
		if op == 'do()' {
			enabled = true
			continue
		}
		if op == 'don\'t()' {
			enabled = false
			continue
		}
		if enabled {
			pars := re2.find_all_str(op).map(it.int())
			sum += pars[0] * pars[1]
		}
	}
	println(sum)
}

fn abs(x int) int {
	return if x < 0 { -x } else { x }
}