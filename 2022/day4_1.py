#!/bin/env python3

slackers = 0

with open("input4.txt", "r") as f:
    for line in f:
        line = line.strip('\n').split(',')
        elf0 = [int(x) for x in line[0].split('-')]
        elf1 = [int(x) for x in line[1].split('-')]
        if elf0[0] >= elf1[0] and elf0[1] <= elf1[1] or elf1[0] >= elf0[0] and elf1[1] <= elf0[1]:
            slackers += 1

print(slackers)
        
