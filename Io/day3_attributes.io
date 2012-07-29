# Enhance the XML program to handle attributes: if the first argument is a map (use the curly brackets syntax), add attributes to the XML program. For example:
# book({"author": "Tate"}...) would print <book author="Tate">:

# For some reason, I have to load this file before I can load the actual content.
# How is this managed in actual Io programs?
OperatorTable addAssignOperator(":", "atPutNumber")

Map atPutNumber := method(
    self atPut(
        call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
        call evalArgAt(1)
    )
)

curlyBrackets := method(
    r := Map clone
    call message arguments foreach(arg,
        r doMessage(arg)
    )
    r
)

doFile("day3_attributes_content.io")