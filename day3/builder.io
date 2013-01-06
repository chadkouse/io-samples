# this was enhanced to show indentation structure
# this was also enhanced to allow attributes.
# The attribute portion was made much more difficult by trying to do it
# "in-code" rather than reading the markup from a file.  Since it was 
# "in-code" I had to deal with "Sequence" responding to : so I couldn't
# use : as an assigmentOperator as in previous examples.

curlyBrackets := method(
  r := Map clone
  call message arguments foreach(arg,
    arg = arg asString split(" : ")
    r atPut(arg at(0) removePrefix("\"") removeSuffix("\""), arg at(1))
    )
  r
)

Builder := Object clone

Builder indentLevel := -2

Builder getIndent := method(
  outStr := ""
  for (i, 0, indentLevel, outStr = outStr .. "  ")
  outStr
)

Builder forward := method(
  indentLevel = indentLevel + 1
  outStr := "<#{call message name}" interpolate
  contentVal := ""
  attributes := ""
  call message arguments foreach(arg,
    content := self doMessage(arg);
    if(content type == "Map",
      content foreach(k, v,
        attributes = attributes .. " #{k}=#{v}" interpolate
      )
    )

    if(content type == "Sequence",
      indentLevel = indentLevel + 1
      contentVal = contentVal .. getIndent .. content .. "\n"
      indentLevel = indentLevel - 1
    )
  )
  outStr = outStr .. "#{attributes}>\n" interpolate

  outStr = "#{outStr}#{contentVal}#{getIndent}</#{call message name}>" interpolate
  indentLevel = indentLevel - 1
  outStr

)

Builder ul(
          li({"class": "lang", "style": "font-size:2em; color:red;"}, "Io"),
          li({"class": "lang"}, "Lua"),
          li({"class": "lang"}, "Javascript")
) println

