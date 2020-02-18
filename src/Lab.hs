--------------------------------------------------------------------------------
-- Functional Programming (CS141)                                             --
-- Lab: Recursive data types                                                  --
--------------------------------------------------------------------------------

module Lab where

--------------------------------------------------------------------------------
-- Red-black trees

data Colour = ???
    deriving Eq

instance Show Colour where
    show = undefined

data Tree a = Leaf | ???
    deriving (Eq, Show)

empty :: Tree a
empty = undefined

singleton :: a -> Tree a
singleton = undefined

makeBlack :: Tree a -> Tree a
makeBlack = undefined

depth :: Tree a -> Int
depth = undefined

toList :: Tree a -> [a]
toList = undefined

member :: Ord a => a -> Tree a -> Bool
member = undefined

balance :: Colour -> Tree a -> a -> Tree a -> Tree a
balance Black (Node Red (Node Red a x b) y c) z d =
    Node Red (Node Black a x b) y (Node Black c z d)
balance _ _ _ _ = undefined
balance _ _ _ _ = undefined
balance _ _ _ _ = undefined
balance c l x r = Node c l x r

insert :: Ord a => Tree a -> a -> Tree a
insert = undefined

--------------------------------------------------------------------------------
