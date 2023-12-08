# day 1 part 1 of Advent of Code '23.
#
# initialize variabes
firstDigitChar = '0'
lastDigitChar = '0'

numchar = '0'
num = 0

total = 0

# iterate through each line in file
for line in eachline("coords.txt")
	# iterate through each character in the line
	for char in line
		# if it's a number, assign it to lastDigitChar (using last since idk how to just end the loop at the first number
		if Int(char) >= 48 && Int(char) <= 57
			global lastDigitChar = char
		end
	end
	
	# now iterate through the string reversed
	for char in reverse(line)
		# same as above, but now it's the first digit
		if Int(char) >= 48 && Int(char) <= 57
			global firstDigitChar = char
		end
	end

	# now we combine the two digits to get the 2 digit number, then convert it to an actual number instead of a string and add it to the total
	global numchar = firstDigitChar * lastDigitChar
	global num = parse(Int, numchar)
	global total += num
end

print(total)
