# 1. A Fibonacci sequence starts with two 1s. Each subsequent num- ber is the sum of the two numbers that came before: 1, 1, 2, 3, 5, 8, 13, 21, and so on. Write a program to find the nth Fibonacci number. fib(1) is 1, and fib(4) is 3. As a bonus, solve the problem with recursion and with loops.

recursiveFib := method(number,
  if(number == 1 or number == 2, 1, recursiveFib(number - 1) + recursiveFib(number - 2))
)

loopFib := method(number,
  if(number <= 2,
    1,
    total := 1
    previous := 1
    for(i, 3, number,
      current := total
      total = total + previous
      previous = current
    )
    total
  )
)

# 2. How would you change / to return 0 if the denominator is zero?

Number originalDiv := Number getSlot("/")
# Number / = method(denominator,
#   if(denominator == 0,
#     0,
#     self originalDiv(denominator)
#   )
# )

# 3. Write a program to add up all of the numbers in a two-dimensional array.

sumOfLists := method(listToSum,
  total := 0
  listToSum foreach(subList,
    subList foreach(number, total = total + number)
  )
  total
)

# 4. Add a slot called myAverage to a list that computes the average of all the numbers in a list. What happens if there are no numbers in a list? (Bonus: Raise an Io exception if any item in the list is not a number.)

List myAverage := method(
  total := 0
  self foreach(item,
    if(item proto == Number,
      total = total + item,
      Exception raise("Not all elements are numbers!")
    )
  )
  total / self size
)

list(1, 2, 3, 4) myAverage # => 2.5
list myAverage # => nan

# 5. Write a prototype for a two-dimensional list. The dim(x, y) method should allocate a list of y lists that are x elements long. set(x, y, value) should set a value, and get(x, y) should return that value.

List2D := List clone

# Not sure if I should clone as part of this method, making it kind of "static"?
List2D dim := method(x, y,
  setSize(y)
  for(i, 0, y - 1,
    l := list
    l setSize(x)
    atPut(i, l)
  )
)

List2D get := method(x, y,
  at(y) at(x)
)

List2D set := method(x, y, value,
  at(y) atPut(x, value)
)


# 6. Bonus: Write a transpose method so that (new_matrix get(y, x)) == matrix get(x, y) on the original list.

# Some helper methods
List2D height := method(
  size
)
List2D width := method(
  at(0) size
)

List2D transpose := method(
  newList := List2D clone dim(height, width)
  for(x, 0, width - 1,
    for(y, 0, height - 1,
      newList at(x) atPut(y, self at(y) at(x))
    )
  )
  newList
)

# 7. Write the matrix to a file, and read a matrix from a file.

List2D fromList := method(l,
  height := l size
  width := l at(0) size
  dim(width, height)
  for(x, 0, width - 1,
    for(y, 0, height - 1,
      set(x, y, l at(y) at(x))
    )
  )
  self
)

List2D writeToFile := method(fileName,
  f := File with(fileName)
  f remove
  f openForUpdating
  f write(self serialized)
  f close
)


List2D fromFile := method(fileName,
  f := File with(fileName)
  f openForReading
  l := doString(f readLine)
  f close
  fromList(l)
)


# 8. Write a program that gives you ten tries to guess a random number from 1–100. If you would like, give a hint of “hotter” or “colder” after the first guess.

io := File standardInput

targetNumber := (Random value(99) + 1) floor
targetNumber println

guessesLeft := 10
previousGuess := nil

while(guessesLeft > 0,
  ("You have " .. guessesLeft .. " guesses left") println
  guessesLeft = guessesLeft - 1

  "Guess: " println
  guess := io readLine asNumber

  if(guess == targetNumber,
    "You've guessed correctly!" println
    break,
    if(previousGuess,
      if(((targetNumber - guess) abs) <= (targetNumber - previousGuess) abs,
        "Getting warmer!" println,
        "Getting colder..." println
      ),
      "Guess again!"
    )
  )
  previousGuess = guess
)

