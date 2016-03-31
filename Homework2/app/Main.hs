module Main where

import HW2
import Prelude hiding (gcd)

main :: IO ()
main = do
	putStrLn $ show $ list2_1 [[1,2,3], [5,5,5], [-1,-1,-1,-1,-1]]
	putStrLn $ show $ gcd 24 8
	putStrLn $ show $ coPrime 15 4
	putStrLn $ show $ gcfList [6, 7, 12]
	putStrLn $ show $ perfect 5
