#!/bin/env python3

with open("input2.txt", "r") as f:
    guide = list(map(lambda x: x.strip('\n').split(" "), f.readlines()))


points = {
    'X': 1,
    'Y': 2,
    'Z': 3
}
draws = {
    'X': 'A',
    'Y': 'B',
    'Z': 'C'
}
beats = {
    'X': 'C',
    'Y': 'A',
    'Z': 'B'
}


score = 0

for they, you in guide:
    score += points[you]
    if draws[you] == they:
        score += 3
    elif beats[you] == they:
        score += 6
    else:
        score += 0

print(score)
