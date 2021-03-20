fizz_buzz = fn
    0, 0, _ -> "FizzBuzz"
    0, _, _ -> "Fizz"
    _, 0, _ -> "Buzz"
    _, _, a -> a
end

fizz_buzz.(0,0,3)
fizz_buzz.(0,2,3)
fizz_buzz.(3,0,3)
fizz_buzz.(4,4, "not fizz buzz")
