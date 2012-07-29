# See day3_attributes.io
Builder := Object clone

Builder indent ::= 0
Builder indentToken := "  "
Builder indentString := method(
  indentToken repeated(indent)
)

Builder forward := method(
  write(indentString, "<")
  setIndent(indent + 1)
  args := call message arguments
  for(i, 0, args size - 1,
    arg := args at(i)
    if(i == 0,
      if(arg name == "curlyBrackets",
        (self doMessage(arg)) foreach(k, v,
          write(k, "=\"", v, "\" ")
        )
      )
      writeln(call message name, ">")
    )
    content := self doMessage(arg);
    if(content type == "Sequence", writeln(indentString, content)))
  setIndent(indent - 1)
  writeln(indentString, "</", call message name, ">"))


Builder ul(
            li({"foo": "bar"}, "Io" ),
            li("Lua" ),
            li("JavaScript" ))

