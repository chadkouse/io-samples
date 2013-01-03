1+1==true println

#next line throws an exception illustrating Io is strongly typed
#1+"one" == true println

"0 is: " print
(true and 0) println

"\"\" is: " print
(true and "") println

"nil is: " print
(true and nil) println

"" println

Vehicle := Object clone
Vehicle purpose := "drive around"
"Vehicle has the following slots: " print
Vehicle slotNames println

"" println

"= assigns to an existing slot" println
":= assigns to a slot and creates it if it doesn't exist yet" println
"::= assigns to a slot, creates it if it doesn't exist yet, and makes a setter method" println

"" println

"This is an Io program you can run from a file" println
"To run it: io answers.io" println

"" println

Vehicle drive := method("Vrooooooom!" println)
ferarri := Vehicle clone
"what sound does a ferrari make when you drive it?" println
ferarri drive
ferarri drive
ferarri drive
ferarri drive
ferarri drive
