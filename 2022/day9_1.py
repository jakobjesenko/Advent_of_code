#!/bin/env python3


def move_direction(direction: str) -> None:
    global hx, hy
    if direction == 'U':
        hy -= 1
    elif direction == 'R':
        hx += 1
    elif direction == 'L':
        hx -= 1
    elif direction == 'D':
        hy += 1
    else:
        raise Exception("unreachable")


def update_tail() -> None:
    global hx, hy, tx, ty, visited
    visited.append((tx, ty))
    dx = hx - tx
    dy = hy - ty

    if abs(dx) <= 1 and abs(dy) <= 1:
        return

    if dx > 1:
        tx += 1
    if dx < -1:
        tx -= 1

    if dy > 1:
        ty += 1
    if dy < -1:
        ty -= 1

    if dx == 1 and abs(dy) > 1:
        tx += 1
    if dx == -1 and abs(dy) > 1:
        tx -= 1

    if dy == 1 and abs(dx) > 1:
        ty += 1
    if dy == -1 and abs(dx) > 1:
        ty -= 1




visited = []
tx, ty = 0, 0
hx, hy = 0, 0

with open("input9.txt", "r") as f:
    steps = (tuple(line.strip('\n').split(' ')) for line in f)
    for direction, length in steps:
        for i in range(int(length)):
            move_direction(direction)
            update_tail()


print(len(set(visited)))


















