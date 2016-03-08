module HW1
       ( hw1_1
       , hw1_2
       , fact2
       , isPrime
       , primeSum
       ) where

-- Запускать при помощи: haskellstack.org
-- stack setup - установка GHC нужной версии и т.д.
-- stack build - компиляция
-- stack test  - тесты

-- |Вычислить сумму двух аргументов
hw1_1 :: Integer -> Integer -> Integer
hw1_1 a b = a + b;

-- |Вычислить сумму N членов ряда
--
--
--  N
-- ---
-- \    1
--  >  ---
-- /   k^k
-- ---
-- k=1
--
-- Использовать fromIntegral для перевода из Integer в Double
hw1_2 :: Integer -> Double
hw1_2' :: Integer -> Double -> Double
hw1_2 n 
	| n <= 0 = error "hw1_2: non-positive argument"
	| n > 0 = hw1_2' n 0.0
hw1_2' n res 
	| n == 0 = res
	| n > 0 = hw1_2' (n - 1) (res + 1 / fromIntegral (n*n))

-- |Вычислить двойной факториал
-- n!! = 1*3*5*...*n, если n - нечетное
-- n!! = 2*4*6*...*n, если n - четное
fact2 :: Integer -> Integer
fact2' :: Integer -> Integer -> Integer
fact2 n  
	| n < 0 = error "fact2: non-positive argument"
	| n >= 0 = fact2' n 1
fact2' n res
	| n <= 1 = res
	| n > 1 = fact2' (n - 2) (res * n)  

-- |Проверить заданное число на простоту
-- Использовать div для целочисленного деления
-- или mod для остатка от деления
isPrime :: Integer -> Bool
isPrime' :: Integer -> Integer -> Bool
isPrime n 
	| n <= 0 = error "isPrime: non-positive argument"
	| n > 0 = isPrime' n 2
isPrime' n d
	| d * d > n = True 
	| n `mod` d == 0 = False
	| otherwise = isPrime' n (d + 1)

-- |Найти сумму всех простых чисел в диапазоне [a;b]
primeSum :: Integer -> Integer -> Integer
primeSum' :: [Integer] -> Integer
primeSum a b
	| a > b = primeSum b a
	| a < 0 = error "primeSum: non-positive argument" 
	| otherwise = primeSum' [a..b]
primeSum' [] = 0
primeSum' (x:lt) = if isPrime x then x + primeSum' lt else primeSum' lt
