# # 1) Evaluate 1 + 1 and then 1 + "one". Is Io strongly typed or weakly typed? Support your answer with code.
#
# 1 + 1 # => 2
# 1 + "one" # => Exception: argument 0 to method '+' must be a Number, not a 'Sequence'
#
# # Io is strongly typed
#
# # 2) Is 0 true or false? What about the empty string? Is nil true or false? Support your answer with code.
#
# truthy := method(val, if(val, true println, false println))
#
# truthy(0) # => true
# truthy("") # => true
# truthy(nil) # => false
#
# # 3) How can you tell what slots a prototype supports?
#
# # The easy answer is:
# Object slotNames
#
# # But this just lists the slots for the prototype itself, not its ancestors, so:

allSlots := method(prototype,
  prototype slotNames foreach(slotName, slotName println)
  if(println type != "Object", allSlots(prototype proto))
)

# 4) What is the difference between = (equals), := (colon equals), and ::= (colon colon equals)? When would you use each one?

# = Will assign a slot if it exists and error if it doesn't
# := Will assign a slot, creating if needed
# ::= Will assign a slot, creating if needed. It'll also create a setter, setX for any x:

Foo := Object clone
Foo bar ::= "Bar"
Foo setBar("Woo")
Foo bar # => "Woo"

# 5) Running a file is as simple as io filename.io

# 6) Execute the code in a slot given its name.

Person := Object clone
Person sayHi := method("Hi" println)
Person getSlot("sayHi")
# ==> method(
#     "Hi" println
# )
Person getSlot("sayHi") call
# Hi
# ==> Hi
# Io>
