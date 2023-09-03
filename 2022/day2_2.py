#!/bin/env python3

with open("input2.txt", "r") as f:
    guide = list(map(lambda x: x.strip('\n').split(" "), f.readlines()))

key = {
    'A': {'X': 'C', 'Y': 'A', 'Z': 'B'},
    'B': {'X': 'A', 'Y': 'B', 'Z': 'C'},
    'C': {'X': 'B', 'Y': 'C', 'Z': 'A'},
}
points = {
    'A': 1,
    'B': 2,
    'C': 3
}
worths = {
    'X': 0,
    'Y': 3,
    'Z': 6
}

score = 0

for they, instruction in guide:
    score += worths[instruction]
    you = key[they][instruction]
    score += points[you]

print(score)
