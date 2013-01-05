#these are 1 based indexed as asked for in the book so the 4th position would = 3
fibLoop := method(n, 
	lastSum := 1
	lasterSum := 1
	temp := 0
	for(i, 3, n,
		temp = lastSum + lasterSum
		lasterSum = lastSum
		lastSum = temp
	)
	lastSum		
		
)

fibRecurs := method(n,
	if (n <= 2, 1, fibRecurs(n-1)+fibRecurs(n-2))
)
	
for(i, 1, 10,
("Fib " .. i) println
fibLoop(i) println
fibRecurs(i) println
)
