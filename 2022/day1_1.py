#!/bin/env python3

curent_sum = 0
max_ration = 0

with open("input1.txt") as f:
    for line in f:
        if line == "\n":
            max_ration = max(max_ration, curent_sum)
            curent_sum = 0
            continue
        curent_sum += int(line.strip('\n'))

print(max_ration)
