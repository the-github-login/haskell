module Main where

import HW1

main :: IO ()
main = do
	putStrLn $ show $ hw1_1 5 6

	putStrLn $ show $ hw1_2 3

	putStrLn $ show $ fact2 6
	putStrLn $ show $ fact2 7

	putStrLn $ show $ isPrime 17
	putStrLn $ show $ isPrime 18

	putStrLn $ show $ [8..15]
	putStrLn $ show $ primeSum 8 15

	
	


