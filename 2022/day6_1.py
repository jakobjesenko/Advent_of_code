#!/bin/env python3

from collections import deque

with open("input6.txt", "r") as f:
    stream = f.read()

buffer = deque(maxlen = 4)

for i, c in enumerate(stream, start = 1):
    buffer.append(c)
    if i < buffer.maxlen:
        continue
    if len(set(buffer)) == buffer.maxlen:
        print(i)
        break






