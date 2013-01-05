#this is to demonstrate how to actually write a "program" to do this task.
#handles only 2D
add2DArray := method(theArray, 
	mySum := 0
	for(i, 0, (theArray size)-1,
		for (n, 0, (theArray at(i) size) - 1, 
			mySum = mySum + theArray at(i) at(n)
		)
	)
	mySum
)

#handles any number of nests lists
addArrayRecurs := method(theArray,
	mySum := 0
	for (i, 0, (theArray size)-1,
		if(theArray at(i) type != "List" and theArray at(i) type != "Number", Exception raise("Invalid type"), 
		if(theArray at(i) type == "List", mySum = mySum + addArrayRecurs(theArray at(i)), mySum = mySum + theArray at(i))
		)
	)
	mySum 
)
	

#this is the way you'd want to do it in real life
add2DArrayLazy := method(theArray, theArray flatten reduce(+))

myArray := list(
	list(1, 2, 3, 4, 5, 6, 7, 8, 9),
	list(1, 2, 3, 4, 5, 6, 7, 8, 9),
	list(1, 2, 3, 4, 5, 6, 7, 8, 9),
	list(1, 2, 3, 4, 5, 6, 7, 8, 9),
	list(1, 2, 3, 4, 5, 6, 7, 8, 9),
	list(1, 2, 3, 4, 5, 6, 7, 8, 9),
	list(1, 2, 3, 4, 5, 6, 7, 8, 9),
	list(1, 2, 3, 4, 5, 6, 7, 8, 9),
	list(1, 2, 3, 4, 5, 6, 7, 8, 9)
)

myArrayMulti := list(
	list(list(1, 2, 3, 4, 5, 6, 7, 8, 9), 2, 3, 4, 5, 6, 7, 8, 9),
	list(1, 2, 3, 4, 5, 6, 7, 8, 9),
	list(1, 2, 3, 4, 5, 6, 7, 8, 9),
	list(1, 2, 3, 4, 5, 6, 7, 8, 9),
	list(1, 2, 3, 4, 5, 6, 7, 8, 9),
	list(1, 2, 3, 4, 5, 6, 7, 8, 9),
	list(1, 2, 3, 4, 5, 6, 7, 8, 9),
	list(1, 2, 3, 4, 5, 6, 7, 8, 9),
	list(1, 2, 3, 4, 5, 6, 7, 8, 9)
)

add2DArray(myArray) println
addArrayRecurs(myArray) println
add2DArrayLazy(myArray) println


e := try(add2DArray(myArrayMulti) println)
e catch(Exception, writeln("I don't do that... " .. e coroutine runMessage))
addArrayRecurs(myArrayMulti) println
add2DArrayLazy(myArrayMulti) println
