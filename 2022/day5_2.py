#!/bin/env python3

import re


class Stack:
    def __init__(self):
        self.items = []
        self.top = 0

    def push(self, item) -> None:
        self.items.append(item)
        self.top += 1

    def pop(self):
        self.top -= 1
        return self.items.pop(self.top)

    def peek(self):
        return self.items[self.top - 1]

    def is_empty(self) -> bool:
        return self.top == 0


with open("input5.txt", "r") as f:
    lines = f.readlines()
    state = lines[:lines.index('\n')]
    state.pop(-1)
    proc = lines[lines.index('\n')+1:]

data_columns = [1, 5, 9, 13, 17, 21, 25, 29, 33]

stacks = [Stack() for i in range(len(data_columns))]

for line in state[::-1]:
    for i, x in enumerate(data_columns):
        crate = line[x]
        if crate != ' ':
            stacks[i].push(crate)

pattern = re.compile(r'\d+')
proc = list(map(lambda x: list(map(int, re.findall(pattern, x))), proc))

for instruction in proc:
    intermediate = Stack()
    for i in range(instruction[0]):
        intermediate.push(stacks[instruction[1]-1].pop())
    for i in range(instruction[0]):
        stacks[instruction[2]-1].push(intermediate.pop())


print(''.join((x.peek() for x in stacks)))




