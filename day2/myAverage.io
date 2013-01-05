#from previous practice code - overriding / to return 0 if
#the denominator is 0 rather than an Exception
oldDiv := Number getSlot("/")
Number / := method(d, 
	if (d != 0, oldDiv(d), 0)
)

#adding a slot to List prototype
List myAverage := method(
	theCount := 0
	theSum := 0
	for (i, 0, (self size) - 1, 
		if (self at(i) type != "Number", raise Exception("Invalid Type - Not a Number"))
		theCount = theCount + 1
		theSum = theSum + self at(i)
	)

	theSum / theCount
)

myArray := list(1, 2, 3, 4, 5, 6, 7, 8, 9)

myArray myAverage println
