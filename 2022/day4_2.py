#!/bin/env python3

slackers = 0

class Elf:
    def __init__(self, start: int, stop: int):
        if start <= stop:
            self.start = start
            self.stop = stop
        else:
            self.start = stop
            self.stop = start

    def overlap(self, other) -> bool:
        return max(self.start, other.start) <= min(self.stop, other.stop)

with open("input4.txt", "r") as f:
    for line in f:
        line = line.strip('\n').split(',')
        elf0 = Elf(*[int(x) for x in line[0].split('-')])
        elf1 = Elf(*[int(x) for x in line[1].split('-')])
        if elf0.overlap(elf1):
            slackers += 1

print(slackers)
