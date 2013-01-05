
TwoDList := Object clone
TwoDList myList := List clone
TwoDList dim := method(x, y, 
	myList = List clone
	for (i, 1, y,
		tmpList := List clone
		for (n, 1, x,
			tmpList append(0)
		)
		myList append(tmpList)
	)
)

TwoDList set := method(x, y, value, 
	myList at(y) atPut (x, value)
)

TwoDList get := method(x, y, 
	myList at(y) at(x)
)

TwoDList asString := method(
	strOut := ""
	for (i, 0, myList size - 1,
		for (n, 0, myList at(i) size - 1, 
			#have to swap the arguments from what
			#you might think because x is actually
			#related to the size of the nested list
			strOut = strOut .. get(n, i) .. "\t"
		)
		strOut = strOut .. "\n"
	)
	strOut
)

TwoDList transpose := method(
	newList := TwoDList clone
	newList dim(myList size, myList at(0) size)
	for (i, 0, myList size - 1,
		for (n, 0, myList at(i) size - 1,
			newList set(i, n, get(n, i))
		)
	)
	newList
)

TwoDList toFile := method(filename,
	f := File with(filename)
	f remove
	f openForUpdating
	f write(asString)
	f close
)

TwoDList fromFile := method(filename,
	f := File with(filename)
	f openForReading
	lines := f readLines
	#dim(lines at(0) split("\t") size, lines size)
	dim(0, 0)
	lines foreach(n, line,
		s := line split("\t")
		myList append(s)
	)
	f close
	self
)

myList := TwoDList clone
myList dim(2, 4)
myList asString println
myList set(1, 3, 6)
myList get(1, 3) println
"" println
myList asString println

myNewList := myList transpose
myNewList asString println

if (myList get(1, 3) == myNewList get(3, 1), "Transpose Worked" println, "Transpose Failed" println)

myList toFile("TwoDAsFile.txt")

myListFromFile := (TwoDList clone fromFile("TwoDInFile.txt"))

myListFromFile asString println
