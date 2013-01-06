# implementation of the same exercise we did in ruby -- using forward
# like method_missing to interpret roman numerals
roman := Object clone

Sequence countChar := method(c,
  count := 0
  for(i, 0, size-1,
      if(exSlice(i, i+1) == c, count = count+1)
  )
  count
)

roman forward := method(
  theName := call message name asMutable
  theName replaceSeq("IV", "IIII")
  theName replaceSeq("IX", "VIIII")
  theName replaceSeq("XL", "XXXX")
  theName replaceSeq("XC", "LXXXX")

  (theName countChar("I") +
   theName countChar("V")*5 +
   theName countChar("X")*10 +
   theName countChar("L")*50 +
   theName countChar("C")*100)
)

roman X println
roman XC println
roman XII println
roman X println
