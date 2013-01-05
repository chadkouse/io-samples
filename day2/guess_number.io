myNumber := Random value(100) round
#uncomment for testing
#myNumber println

lastDistance := 100
guesses := 0
solved := false
guess := -1
while (guesses < 10 and guess != myNumber, 
	("Guess a number between 1 and 100: (try "  .. guesses+1 .. " of 10)") print
	guess := ReadLine readLine asNumber
	guesses = guesses + 1
	if (guesses == 1,
		"Nope! Try Again!" println
		lastDistance = (myNumber - guess) abs
	,
		distance := (myNumber - guess) abs
		if (distance > lastDistance,
			"Colder!" println
		,
			"Warmer!" println
		)
		lastDistance = distance
	)
)
if (guess == myNumber, 
	"You got it!" println,
	("Sorry you lose! The number was " .. myNumber) println
)
