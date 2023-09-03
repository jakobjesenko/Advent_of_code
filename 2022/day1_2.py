#!/bin/env python3


with open("input1.txt") as f:
    lines = f.readlines()


curent_sum = 0
rations = []

for line in lines:
    if line == "\n":
        rations.append(curent_sum)
        curent_sum = 0
        continue
    curent_sum += int(line.strip('\n'))

max3 = sum(sorted(rations, reverse = True)[:3])
print(max3)
