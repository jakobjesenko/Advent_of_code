import os

fn main(){
	data := os.read_lines('09.txt')!.join('')
	mut output := ''
	mut index := 0
	mut in_marker := false
	mut snippet := ''
	for {
		if index >= data.len {
			break
		}
		if data[index] == `(` {
			in_marker = true
			index++
			continue
		} else if data[index] == `)` {
			marker := snippet.split('x').map(it.int())
			in_marker = false
			
			index++
			snippet = data[index..index+marker[0]]
			index += marker[0]
			for _ in 0..marker[1] {
				output += snippet
			}
			snippet = ''
			continue
		}
		if in_marker {
			snippet += data[index..index+1]
			index++
			continue
		}
		output += data[index..index+1]
		index++
	}
	println(output.len)
}