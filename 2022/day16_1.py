#!/bin/env python3

import re

class Valve:
    def __init__(self, name: str, rate: int, *neighbours: list[str]):
        self.name = name
        self.rate = rate
        self.neighbours = neighbours

    def __repr__(self):
        return f"Valve({self.name}, {self.rate}, {self.neighbours})"



valves = {}





with open("input16.txt", "r") as f:
    for line in f:
        names = re.findall("[A-Z]{2}", line)
        rate = re.findall("\d+", line)[0]
        valves[names[0]] = Valve(names[0], rate, names[1:])

print(valves)
