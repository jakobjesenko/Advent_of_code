#!/bin/env python3

from collections import deque
from functools import reduce

class Node(object):
    def __init__(self, name, kind, size=None):
        self.children = []
        self.name = name
        self.kind = kind
        self._size = size

    def __repr__(self):
        return f"Node({self.name}, {self.kind})"
    
    def addChild(self, child) -> None:
        self.children.append(child)

    def find(self, name: str):
        for child in self.children:
            if child.name == name:
                return child
        return None
    
    @property
    def size(self) -> int:
        if not self._size is None:
            return self._size
        else:
            self._size = reduce(lambda t, x: t + x.size, self.children, 0)
            return self._size



stack = deque()

with open("input7.txt", "r") as f:
    current = Node("megaroot", "dir")
    current.addChild(Node("/", "dir"))
    for line in f:
        line = line.strip('\n').split(' ')
        if line[0] != "$":
            if line[0] == "dir":
                child = Node(line[1], "dir")
            else:
                child = Node(line[1], "file", int(line[0]))
            current.addChild(child)
        elif line[1] == "ls":
            continue
        elif line[2] == "..":
            current = stack.pop()
        else:
            stack.append(current)
            current = current.find(line[2])


stack.pop()

root = stack.pop()
diskSpace = 70000000
updateSize = 30000000
usedSpace = root.size
neededSpace = usedSpace - (diskSpace - updateSize)

dirSizes = []

def findSizes(node, dirSizes) -> None:
    if node.kind == "file":
        return
    dirSizes.append(node.size)
    for child in node.children:
        findSizes(child, dirSizes)


findSizes(root, dirSizes)
print(min(filter(lambda x: (x - neededSpace) >= 0, dirSizes)))













