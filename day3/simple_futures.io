futureResult := URL with("http://www.tunewiki.com") @fetch

"Do something in the foreground while fetch goes on in the background.." println
"This will block until the result is available." println
writeln("fetched ", futureResult size, " bytes")
