maximum' :: Ord a => [a] -> a
maximum' [] = error "maximum of empty list not defined"
maximum' [x] = x
maximum' (x:xs) =
  let maxTail = maximum' xs
  in if x >= maxTail
       then x
       else maxTail

maximum2 :: Ord a => [a] -> a
maximum2 [] = error "maximum of empty list not defined"
maximum2 [x] = x
maximum2 (x:xs)
  | x >= maxTail = x
  | otherwise = maxTail
  where
    maxTail = maximum2 xs

maximum3 :: Ord a => [a] -> a
maximum3 [] = error "maximum of empty list not defined"
maximum3 [x] = x
maximum3 (x:xs) =
  if x >= maxTail
    then x
    else maxTail
  where
    maxTail = maximum3 xs

maximum4 :: Ord a => [a] -> a
maximum4 [] = error "maximum of empty list not defined"
maximum4 [x] = x
maximum4 (x:xs) = max x (maximum4 xs)

replicateM :: (Num n, Ord n) => n -> a -> [a]
replicateM n x
  | n <= 0 = []
  | otherwise = x : replicateM (n - 1) x

takeN :: (Num n, Ord n) => n -> [a] -> [a]
takeN n _
    | n <= 0 = []
takeN _ [] = []
takeN n (x : xs) = x : takeN (n-1) xs
