#!/bin/env python3


forrest = []

with open("input8.txt", "r") as f:
    for line in f:
        line = line.strip('\n')
        forrest.append([int(x) for x in line])


visibleCount = 0

for x in range(len(forrest[0])):
    for y in range(len(forrest)):
        h = forrest[y][x]
        up, down, left, right = True, True, True, True
        for i in range(x):
            if forrest[y][i] >= h:
                left = False
                break
        for i in range(len(forrest[0]) - 1, x, -1):
            if forrest[y][i] >= h:
                right = False
                break
        for j in range(y):
            if forrest[j][x] >= h:
                up = False
                break
        for j in range(len(forrest) - 1, y, -1):
            if forrest[j][x] >= h:
                down = False
                break
        if up or down or left or right:
            visibleCount += 1

print(visibleCount)
