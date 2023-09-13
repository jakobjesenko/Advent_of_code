import os

struct Transaction {
mut:
	assets []int = []int{cap: 2}
	min_to string
	max_to string
}

fn main() {
	lines := os.read_lines('10.txt')!.map(it.split(' '))
	mut transactions := map[string]Transaction{}
	for line in lines {
		match line[0] {
			'value' {
				key := line[4..6].join(' ')
				mut temp := transactions[key] or { Transaction{} }
				temp.assets << line[1].int()
				transactions[key] = temp
			}
			'bot' {
				key := line[..2].join(' ')
				mut temp := transactions[key] or { Transaction{} }
				temp.min_to	= line[5..7].join(' ')
				temp.max_to = line[10..].join(' ')
				transactions[key] = temp
			}
			else { panic('Command unknown') }
		}
	}
	mut pending := transactions.keys()
	for pending.len > 0 {
		for key in pending.filter(transactions[it].assets.len == 2) {
			temp := transactions[key]
			transactions[temp.min_to].assets << min(temp.assets)
			transactions[temp.max_to].assets << max(temp.assets)
			pending.delete(pending.index(key))
		}
	}
	to_find := ['output 0', 'output 1', 'output 2']
	mut acc := 1
	for _, value in transactions {
		if value.max_to in to_find {
			acc *= max(value.assets)
		} else if value.min_to in to_find {
			acc *= min(value.assets)
		}
	}
	println(acc)
}

fn min (assets []int) int {
	return if assets[0] <= assets[1] { assets[0] } else { assets[1] }
}

fn max (assets []int) int {
	return if assets[0] > assets[1] { assets[0] } else { assets[1] }
}