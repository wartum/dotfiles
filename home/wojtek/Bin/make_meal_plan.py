#!/usr/bin/python
from random import shuffle, seed


meals_path='../Documents/meals'
labels = ("pn", "wt", "śr", "cz", "pt", "sb", "nd")

def find_long_lasting(line):
    index = line.find("]")
    if index != -1:
        name = (line[index+1:])
        time = (int(line[1:index]))
        return {name: time}
    return {}

long_lasting={}

with open(meals_path) as f:
    meals = f.readlines()
meals = [x.strip() for x in meals]
for m in meals:
    long_lasting.update(find_long_lasting(m))
meals = [x.strip("[]0123456789") for x in meals]

shuffle(meals)
for m in long_lasting:
    for i in range(1, long_lasting[m]):
        meals.insert(meals.index(m), m)

for meal, label in zip(meals[:len(labels)], labels):
    print(label, meal, sep=": ")