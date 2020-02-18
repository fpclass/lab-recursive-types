--------------------------------------------------------------------------------
-- Functional Programming (CS141)                                             --
-- Lab: Recursive data types                                                  --
--------------------------------------------------------------------------------

{-# LANGUAGE ScopedTypeVariables #-}

module RedBlackSpec (redBlackTreeSpec) where 

--------------------------------------------------------------------------------

import Hedgehog
import qualified Hedgehog.Gen as Gen
import qualified Hedgehog.Range as Range

import Test.Tasty
import Test.Tasty.Hedgehog as H

import Data.List (nub, sort)

import qualified Lab as L

--------------------------------------------------------------------------------

prop_treeDepth :: Property 
prop_treeDepth = property $ do 
    xs <- forAll $ Gen.list (Range.linear 0 100) (Gen.int Range.constantBounded)
    diff (L.depth (foldl L.insert L.empty xs)) 
         (<=) 
         (2*floor (logBase 2 (fromIntegral $ length (nub xs)+1)))

prop_toListSorted :: Property 
prop_toListSorted = property $ do 
    xs <- forAll $ Gen.list (Range.linear 0 100) (Gen.int Range.constantBounded)
    L.toList (foldl L.insert L.empty xs) === sort (nub xs)

-- | The tests for red-black trees.
redBlackTreeSpec :: TestTree
redBlackTreeSpec = testGroup "Red-black trees"
    [ H.testProperty "The depth of the tree is at most 2*floor(log2(n+1))" prop_treeDepth
    , H.testProperty "toList returns a sorted list" prop_toListSorted
    ] 


--------------------------------------------------------------------------------
