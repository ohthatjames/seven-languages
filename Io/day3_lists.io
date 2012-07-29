# Create a list syntax that uses brackets.

curlyBrackets := method(
  call message arguments map(arg,
    doMessage(arg)
  )
)

