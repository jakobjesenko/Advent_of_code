import os

fn main(){
	data := os.read_lines('09.txt')!.join('')
	//data := '(25x3)(3x3)ABC(2x3)XY(5x2)PQRSTX(18x9)(3x2)TWO(5x7)SEVEN'
	//data := '(27x12)(20x12)(13x14)(7x10)(1x12)A'
	println(decompressed_length(data))
}

fn decompressed_length(data string) u64 {
	first := data.index('(') or {
		return u64(data.len)
	}
	second := u64(data.index(')') or { return 0})

	marker := data[first+1..second+1].split('x').map(u64(it.int()))
	return u64(data[..first].len) +
		u64(marker[1] * decompressed_length(data[second+1..second+1+marker[0]])) +
		u64(decompressed_length(data[second+1+marker[0]..]))
}
