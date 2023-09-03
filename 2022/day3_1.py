#!/bin/env python3

with open("input3.txt") as f:
    sacks = []
    for line in f:
        line = line.strip('\n')
        compartment_size = len(line) // 2
        sacks.append([line[:compartment_size], line[compartment_size:]])



values = {}
points = 1
for i in range(ord('a'), ord('z')+1):
    values[chr(i)] = points
    points += 1
for i in range(ord('A'), ord('Z')+1):
    values[chr(i)] = points
    points += 1



def find_match(comp1: str, comp2: str) -> str:
    for c in comp1:
        if c in comp2:
            return c
    return None

score = 0

for comp1, comp2 in sacks:
    score += values[find_match(comp1, comp2)]



print(score)
