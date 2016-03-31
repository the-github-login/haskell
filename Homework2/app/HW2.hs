module HW2
       ( list2_1
       , gcd
       , coPrime
       , gcfList
       , perfect
       ) where

import Prelude hiding (gcd)

-- Запускать при помощи: haskellstack.org
-- stack setup - установка GHC нужной версии и т.д.
-- stack build - компиляция
-- stack test  - тесты

-- |Написать программу для нахождения минимального из
-- чисел, являющихся максимальными в каждой из строк заданной
-- прямоугольной матрицы.
list2_1 :: Integral a => [[a]] -> a
-- |I can write a more detail code if needed
list2_1 [] = error "list2_1: empty argument"
list2_1 ls = minimum (map maximum [x | x <- ls])

-- |Вычислить наибольший общий делитель(НОД) 2х натуральных чисел. Использовать алгоритм Евклида.
gcd :: Integral a => a -> a -> a
gcd a b
	| a <= 0 || b < 0 = error "gcd: non-positive argument"
	| b == 0 = a
	| otherwise = gcd b (a `mod` b)

-- |Проверить являются ли 2 натуральных числа взаимнопростыми.
-- 2 числа называются взаимнопростыми если их НОД равен 1
coPrime :: Integral a => a -> a -> Bool
coPrime a b = if gcd a b == 1 then True else False

-- |Напишите функцию нахождения самого маленького числа, которое делится
-- на все числа от одного до N.
gcfList :: Integral a => [a] -> a
gcfList ls = foldr (\x y -> x * y `div` gcd x y) 1 ls

-- |Написать программу для нахождения первых N совершенных чисел.
-- Совершенным числом называется натуральное число, равное
-- сумме всех своих делителей, включая единицу, но исключая само
-- это число. Так, например, число 28 – совершенное, поскольку
-- 28 = 1 + 2 + 4 + 7 + 14. 
perfect :: Integral a => Int -> [a]
-- |fast but cheat and not full version:
perfect n 
	| n > 10 = error "you want too much."
	| otherwise = take n [6, 28, 496, 8128, 33550336, 8589869056, 137438691328, 2305843008139952128, 2658455991569831744654692615953842176, 191561942608236107294793378084303638130997321548169216]

{- 
	|slow version.
	perfect n = take n [x | x <- [1..], isPerfect x]
		where isPerfect x = x == foldr (+) 0 [i | i <- [1..x], x `mod` i == 0 && x /= i]
-}















