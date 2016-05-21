module Main where

import HW3
import Data.List
import Data.Char

data Tree a = Empty | Node (Tree a) a (Tree a)

main :: IO ()
main = do
	putStrLn $ show $ root 0.0001

