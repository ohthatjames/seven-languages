# Enhance the XML program to add spaces to show the indentation structure.

Builder := Object clone

Builder indent ::= 0
Builder indentToken := "  "
Builder indentString := method(
  indentToken repeated(indent)
)

Builder forward := method(
  writeln(indentString, "<", call message name, ">")
  setIndent(indent + 1)
  call message arguments foreach(
    arg,
    content := self doMessage(arg);
    if(content type == "Sequence", writeln(indentString, content)))
  setIndent(indent - 1)
  writeln(indentString, "</", call message name, ">"))

Builder ul(
            li("Io" ),
            li("Lua" ),
            li("JavaScript" ))

