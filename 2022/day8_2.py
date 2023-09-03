#!/bin/env python3


forrest = []

with open("input8.txt", "r") as f:
    for line in f:
        line = line.strip('\n')
        forrest.append([int(x) for x in line])

def findScore(x: int, y: int, forrest: list[int]) -> int:
    up, down, left, right = 0, 0, 0, 0
    h = forrest[y][x]
    # preveri robna drevesa
    if x == 0 or y == 0 or x == len(forrest[0]) - 1 or y == len(forrest) - 1:
        return 0

    for i in range(x, len(forrest[0])):
        if i == x:
            right += 1
            continue
        if forrest[y][i] >= h:
            break
        right += 1
    else:
        right -= 1

    for i in range(x, -1, -1):
        if i == x:
            left += 1
            continue
        if forrest[y][i] >= h:
            break
        left += 1
    else:
        left -= 1

    for j in range(y, len(forrest)):
        if j == y:
            down += 1
            continue
        if forrest[j][x] >= h:
            break
        down += 1
    else:
        down -= 1

    for j in range(y, -1, -1):
        if j == y:
            up += 1
            continue
        if forrest[j][x] >= h:
            break
        up += 1
    else:
        up -= 1

    return up * down * left * right

scores = []

for x in range(len(forrest[0])):
    for y in range(len(forrest)):
        scores.append(findScore(x, y, forrest))


print(max(scores))






