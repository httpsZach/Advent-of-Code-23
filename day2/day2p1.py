# takes in a string that's one line of input, returns the game number and a
# string that's all the game data
def splitString(fileLine):
    gameArr = fileLine.split(": ")
    gameInfo = gameArr[0]
    gameData = gameArr[1]
    _, gameNum = gameInfo.split(" ")
    return int(gameNum), gameData


# takes in a string that's all the game data, determines if the game
# is true or not and returns a bool
def isGamePossible(gameData):
    gamePossible = True
    gameDataArr = gameData.split("; ")
    for val in gameDataArr:
        roundInfo = val.split(", ")
        for round in roundInfo:
            num, color = round.split()
            if int(num) > 14:
                gamePossible = False
                return gamePossible
            elif int(num) == 14 and (color == "green" or color == "red"):
                gamePossible = False
                return gamePossible
            elif int(num) == 13 and (color == "red"):
                gamePossible = False
                return gamePossible
    return gamePossible


# filename vars
testFileName = "testFile.txt"
fileName = "data.txt"

# creates file
file = open(fileName, "r")
# total num starts at 0
total = 0

# read the file
fileLines = file.readlines()

# go through line by line
for line in fileLines:
    num, data = splitString(line)
    gamePossible = isGamePossible(data)
    # if the game is possible, add to the total
    if gamePossible:
        total += num

# print out the total
print(total)
