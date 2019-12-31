--------------------------------------------------------------------------------
-- Functional Programming (CS141)                                             --
-- Lab: Recursive data types                                                  --
--------------------------------------------------------------------------------

{-# LANGUAGE ScopedTypeVariables #-}

import Test.Hspec
import Test.Hspec.QuickCheck
import Test.QuickCheck

import Data.List (nub, sort)

import qualified Lab as L

--------------------------------------------------------------------------------

-- | The main entry point to the test suite.
main :: IO ()
main = hspec $ do
    describe "Red-black trees" $ do
        prop "The depth of the tree is at most 2*floor(log2(n+1))" $
            \(xs :: [Int]) -> L.depth (foldl L.insert L.empty xs)
                <= 2*floor (logBase 2 (fromIntegral $ length (nub xs)+1))
        prop "toList returns a sorted list" $
            \(xs :: [Int]) -> L.toList (foldl L.insert L.empty xs)
                == sort (nub xs)


--------------------------------------------------------------------------------
