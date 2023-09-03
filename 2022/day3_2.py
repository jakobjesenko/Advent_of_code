#!/bin/env python3

with open("input3.txt") as f:
    sacks = f.readlines()



values = {}
points = 1
for i in range(ord('a'), ord('z')+1):
    values[chr(i)] = points
    points += 1
for i in range(ord('A'), ord('Z')+1):
    values[chr(i)] = points
    points += 1


score = 0

for i in range(0, len(sacks), 3):
    for c in sacks[i]:
        if c in sacks[i+1] and c in sacks[i+2]:
            score += values[c]
            break

print(score)
