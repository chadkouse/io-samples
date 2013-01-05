oldDiv := Number getSlot("/")

Number / := method(i,
	if (i != 0, oldDiv(i), 0)
)

"4 / 2 = " print
(4 / 2) println

"4 / 0 = " print
(4 / 0) println

