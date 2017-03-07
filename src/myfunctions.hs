triangles :: [(Int, Int, Int)]
triangles = [(a, b, c) | c <- [1 .. 10], b <- [1 .. c], a <- [1 .. b], a * a + b * b == c * c]

bmiBerator :: Double -> Double -> String
bmiBerator weight height
  | weight / (height * height) <= 18.5 = "You're underweight, you emo, you!"
  | weight / (height * height) <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"
  | weight / (height * height) <= 30 = "You're fat! Lose some weight, fatty!"
  | otherwise = "You're a whale, congratulations!"

bmiBerator2 :: Double -> Double -> String
bmiBerator2 weight height
  | bmi <= skinny = "You're underweight, you emo, you!"
  | bmi <= normal = "You're supposedly normal. Pffft, I bet you're ugly!"
  | bmi <= fat = "You're fat! Lose some weight, fatty!"
  | otherwise = "You're a whale, congratulations!"
  where
    bmi = weight / (height * height)
    skinny = 18.5
    normal = 25
    fat = 30

max'
  :: Ord t
  => t -> t -> t
max' a b
  | a <= b = b
  | otherwise = a

compare1
  :: Ord a
  => a -> a -> Ordering
compare1 a b
  | a == b = EQ
  | a < b = LT
  | otherwise = GT

compare2
  :: Ord a
  => a -> a -> Ordering
a `compare2` b
  | a == b = EQ
  | a < b = LT
  | otherwise = GT

cylinder
  :: (RealFloat a)
  => a -> a -> a
cylinder r h =
  let sideArea = 2 * pi * r * h
      topArea = pi * r * r
  in sideArea + 2 * topArea

calcBMIs
  :: (RealFloat a)
  => [(a, a)] -> [a]
calcBMIs xs = [bmi | (w, h) <- xs, let bmi = w / (h * h), bmi >= 25.0]

head1 :: [a] -> a
head1 [] = error "head of empty list"
head1 (x:_) = x

head2 :: [a] -> a
head2 xs =
  case xs of
    [] -> error "head of empty list"
    (x:_) -> x

toString :: [a] -> String
toString xs = "The list is " ++ what xs
  where
    what [] = "empty."
    what [_] = "a singleton list."
    what _ = "a longer list."
