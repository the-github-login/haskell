module HW3
       ( root
       , sequence2_3_f
       , symmetric
       , listDigits
       , isHeap
       ) where

import Data.List
import Data.Char

-- |Функция root должна вычислить приближенное значение корня уравнения
-- tan x = 1 - x с точностью, заданной первым (и единственным) аргументом
-- функции
f :: Double -> Double
f x = tan x + x - 1

root :: Double -> Double
root eps = head [i | i <- [0, eps..], abs (f i) < eps]

-- |Бесконечная упорядоченная последовательность целых чисел без повторений
-- составлена из всех квадратов, кубов и факториалов натуральных чисел
-- ([1, 2, 4, 6, 8, 9, 16, 24, 25, 27, 36, 49, 64, ..]). Написать программу для
-- вычисления n-го члена этой последовательности.
sequence2_3_f :: Int -> Integer
sequence2_3_f n = sort (take (n^3) (1 : (foldr (++) [] [[x*x, x*x*x, product [1..x]] | x <- [2..]]))) !! (n - 1)

-- |Написать функцию symmetric для проверки симметричности бинарного дерева.
-- Бинарное дерево является симметричным, если, проведя вертикальную линию
-- через корневой узел, правое поддерево будет являться зеркальным отражением
-- левого поддерева. Сравнивается лишь симметрия структуры дерева. Значение в
-- узле сравнивать не надо.
data Tree a = Empty | Node (Tree a) a (Tree a)
symmetric ::  Tree a -> Bool
symmetric' :: Tree a -> Tree b -> Bool

symmetric (Node a _ b) = symmetric' a b
symmetric' Empty Empty = True
symmetric' (Node l _ r) (Node a _ b) = symmetric' l b && symmetric' r a
symmetric' _ _ = False

-- |Написать функцию listDigits, которая для заданного дерева из строк выдает
-- список всех строк, содержащих хотя бы одну цифру.
listDigits :: Tree String -> [String]
listDigits tree = [string | string <- flatten tree, check string]

flatten :: Tree a -> [a]
flatten Empty = []
flatten (Node t1 n t2) = (flatten t1) ++ (n : (flatten t2))

check :: String -> Bool
check string = foldr (||) False (map (\x -> isDigit x) string)

-- |Функция isHeap проверяет является ли дерево пирамидой, то есть значение
-- в каждом из его узлов меньше значений, хранящихся в поддеревьях у этого узла.
data MultiTree a = Branch a [MultiTree a]

isHeap :: Ord a => MultiTree a -> Bool
isHeap (Branch x t) = all f t 
	where f n@(Branch y _) = x<y && isHeap n

