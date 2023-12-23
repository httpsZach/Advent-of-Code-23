# Advent of Code day 2 part 2
# Created by httpsZach, 12/22/23 (a bit behind)

# takes in a string that's one line of input
# returns the game data (not the game number)
def splitString(fileLine):
    gameArr = fileLine.split(": ")
    gameData = gameArr[1]
    return gameData


# takes in a string that's the gamedata
# returns the min number of red, green, and blue cubes
def minCubes(gameData):
    redCubes, greenCubes, blueCubes = 1, 1, 1
    gameDataArr = gameData.split(";")
    for round in gameDataArr:
        roundInfo = round.split(", ")
        for val in roundInfo:
            num, color = val.split()
            if color.lstrip() == "red" and int(num) > redCubes:
                redCubes = int(num)
            elif color.lstrip() == "green" and int(num) > greenCubes:
                greenCubes = int(num)
            elif color.lstrip() == "blue" and int(num) > blueCubes:
                blueCubes = int(num)
    return redCubes, greenCubes, blueCubes


# filename vars
fileName = "data.txt"
testFile = "testFile.txt"

# open file
file = open(fileName, "r")

# total starts at 0
total = 0

# read the file
fileLines = file.readlines()

# go through line by line
for line in fileLines:
    gameData = splitString(line)
    red, green, blue = minCubes(gameData)
    power = red * green * blue
    total += power

print(total)
