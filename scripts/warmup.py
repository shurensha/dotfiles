#!/usr/bin/env python3

import sys

def roundToNearestPlate(weight, percent):
    return round(float(weight)/5 * percent) * 5

def printPlates(weight):
    plateStr = ""
    x = (weight - 45)/2
    counter = 0
    while x > 0:
        if x / 45 >= 1:
            plateStr += f"{int(x)//45}x45 "
            x -= (x//45) * 45
        elif x / 35 >= 1:
            plateStr += f"{int(x)//35}x35 "
            x -= (x//35) * 35
        elif x / 25 >= 1:
            plateStr += f"{int(x)//25}x25 "
            x -= (x//25) * 25
        elif x / 15 >= 1:
            plateStr += f"{int(x)//15}x15 "
            x -= (x//15) * 15
        elif x / 10 >= 1:
            plateStr += f"{int(x)//10}x10 "
            x -= (x//10) * 10
        elif x / 5 >= 1:
            plateStr += f"{int(x)//5}x5 "
            x -= (x//5) * 5
        elif x / 2.5 >= 1.0:
            plateStr += f"{int(x//2.5)}x2.5 "
            x -= x/2.5 * 2.5
    return plateStr
n = len(sys.argv)

def printSet(weight, percentage):
    nearestPlate = roundToNearestPlate(weight, percentage)
    print(f"{int(percentage * 100)}%: {nearestPlate} Plates: {printPlates(nearestPlate)}")

if n < 2:
    print("Wrong number of arguments!")
    sys.exit()

weight = sys.argv[1]

printSet(weight, .30)
printSet(weight, .50)
printSet(weight, .70)
printSet(weight, .80)
printSet(weight, .90)
printSet(weight, .95)
printSet(weight, 1)
