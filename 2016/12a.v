import os

struct Machine {
mut:
	registers map[string]int
	pc int
	halted bool
	program_length int
}

fn Machine.new(program_length int) Machine {
	return Machine{
		{
			'a': 0
			'b': 0
			'c': 0
			'd': 0
		},
		0,
		false,
		program_length
	}
}

fn main(){
	instructions := os.read_lines('12.txt')!.map(it.split(' '))
	mut machine := Machine.new(instructions.len)
	for {
		line := instructions[machine.pc]
		machine.eval(line)
		if machine.halted {
			eprintln(machine)
			println(machine.registers['a'])
			return
		}
	}
}

fn (mut machine Machine) eval(line []string){
	if machine.pc >= machine.program_length {
		machine.halted = true
		return
	}
	match line[0]{
		'cpy' {
			if line[1][0].is_digit() {
				machine.registers[line[2]] = line[1].int()
			} else {
				machine.registers[line[2]] = machine.registers[line[1]]
			}
		}
		'jnz' {
			condition := if line[1][0].is_digit() {
				line[1].int()
			} else {
				machine.registers[line[1]]
			}
			jump := if line[2][0].is_digit() {
				line[2].int()
			} else {
				machine.registers[line[2]]
			}
			machine.pc += if condition == 0 { 1 } else { jump }
			return
		}
		'inc' {
			machine.registers[line[1]]++
		}
		'dec' {
			machine.registers[line[1]]--
		}
		else {
			eprintln('bad instruction')
			machine.halted = true
			return
		}
	}
	machine.pc++
}