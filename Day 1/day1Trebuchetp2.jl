# day 1 part 2 of Advent of Code '23
# this one is pretty ineffiecient, I've been out of the game for too long. I loop through a lot of stuff twice and it can all be combined so it searches through for the first and last at the same time, then changes those to numbers at the same time, etc.
#
# initialize variables
firstDigitChar = '0'
lastDigitChar = '0'

numChar = '0'
num = 0

total = 0

# array of desired substrings to look for
nums = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "zero", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]

# iterate through each line in the file
for line in eachline("coords.txt")
	
	firstDigitCharRange = 100:100
	lastDigitCharRange = 1:1
	# iterate through each of the desired substrings
	
	for digit in nums
		# if the substring is in the string, then save the first instance of it to firstDigitCharRange, then as we go through the array, keep saving the lowest val and we'll end up with the first instance of any of the nums
		if typeof(findfirst(digit, line)) == UnitRange{Int64}
			# save the range in a temp variable
			tempRange = findfirst(digit, line)

		#	print("temp range: ")
		#	print(tempRange)
		#	print("\n")
			# compare the temp to the saved one (initial value will always be higher) and if the temp is lower than set the saved one to the temp one
			if tempRange < firstDigitCharRange 
				firstDigitCharRange = tempRange
			end
		end
		#print("first digit range: ")
		#print(firstDigitCharRange)
		#print("\n")
	end

	# assigns the range to the global char value
	global firstDigitChar = line[firstDigitCharRange]

	# if the range resulted in a word rather than a num, assign the num here
	for i in 1:10
		if firstDigitChar == nums[i]
			firstDigitChar = nums[i + 10]
			break
		end
	end

	# now we do it all again but for the last instance rather than the first
	for digit in nums
		if typeof(findlast(digit, line)) == UnitRange{Int64}
			  tempRange = findlast(digit, line)

			  if tempRange > lastDigitCharRange
				  lastDigitCharRange = tempRange
			  end
		  end
	  end

	  global lastDigitChar = line[lastDigitCharRange]

	  for i in 1:10
		  if lastDigitChar == nums[i]
			  lastDigitChar = nums[i + 10]
			  break
		  end
	  end

	  global numChar = firstDigitChar * lastDigitChar
	  global num = parse(Int, numChar)
	  global total += num

end

print(total)
