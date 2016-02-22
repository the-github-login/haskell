module Fibn where

main :: IO()
main = do 
	putStrLn "Please, enter the number n to get Fib(n):"
	n <- readLn
	print $ operate n
	where operate n
		| n < 0 = error "n should be >= 0" 
		| n == 0 = 0
		| n == 1 = 1
		| otherwise = operate(n - 1) + operate(n - 2)

