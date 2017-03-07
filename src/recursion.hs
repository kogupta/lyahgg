maximum'
  :: Ord a
  => [a] -> a
maximum' [] = error "maximum of empty list not defined"
maximum' [x] = x
maximum' (x:xs) =
  let maxTail = maximum' xs
  in if x >= maxTail
       then x
       else maxTail

maximum2
  :: Ord a
  => [a] -> a
maximum2 [] = error "maximum of empty list not defined"
maximum2 [x] = x
maximum2 (x:xs)
  | x >= maxTail = x
  | otherwise = maxTail
  where
    maxTail = maximum2 xs

maximum3
  :: Ord a
  => [a] -> a
maximum3 [] = error "maximum of empty list not defined"
maximum3 [x] = x
maximum3 (x:xs) =
  if x >= maxTail
    then x
    else maxTail
  where
    maxTail = maximum3 xs

maximum4
  :: Ord a
  => [a] -> a
maximum4 [] = error "maximum of empty list not defined"
maximum4 [x] = x
maximum4 (x:xs) = max x (maximum4 xs)

replicateM
  :: (Num n, Ord n)
  => n -> a -> [a]
replicateM n x
  | n <= 0 = []
  | otherwise = x : replicateM (n - 1) x

takeN
  :: (Num n, Ord n)
  => n -> [a] -> [a]
takeN n _
  | n <= 0 = []
takeN _ [] = []
takeN n (x:xs) = x : takeN (n - 1) xs

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

--tail recur
--lame version
--to check acc pattern
reverse3 :: [a] -> [a] -> [a]
reverse3 [] acc = acc
reverse3 (x:xs) acc = reverse3 xs (x : acc)

--`reverse3` is `inlined` as helper function
reverse2 :: [a] -> [a]
reverse2 [] = []
reverse2 xs = helper xs []
  where
    helper :: [a] -> [a] -> [a]
    helper [] acc = acc
    helper (x:xs) acc = helper xs (x : acc)

repeat' :: a -> [a]
repeat' a = a : repeat' a

zip' :: [a] -> [b] -> [(a, b)]
zip' _ [] = []
zip' [] _ = []
zip' (a:as) (b:bs) = (a, b) : zip' as bs

elem' :: Eq a => a -> [a] -> Bool
elem' a [] = False
elem' a (x:xs) = (a == x) || elem' a xs

--not really quicksort
qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort (x:xs) =
  let smallerOrEq = [a | a <- xs, a <= x]
      greater = [a | a <- xs, a > x]
  in qsort smallerOrEq ++ [x] ++ qsort greater

