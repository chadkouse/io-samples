slower := Object clone
faster := Object clone

slower start := method(wait(2); "slowly" println)
faster start := method(wait(1); "quickly" println)

"synchronous: " println
slower start; faster start;

"asynchronous: " println
slower @@start; faster @@start; wait(3)
