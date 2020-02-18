--------------------------------------------------------------------------------
-- Functional Programming (CS141)                                             --
-- Lab: Recursive data types                                                  --
--------------------------------------------------------------------------------

import Test.Tasty
import Test.Tasty.Ingredients
import Test.Tasty.Ingredients.Basic
import Test.Tasty.Runners.AntXML

import RedBlackSpec

--------------------------------------------------------------------------------

tests :: TestTree 
tests = testGroup "Recursive data types"
    [ redBlackTreeSpec

    ]

ingredients :: [Ingredient]
ingredients = [antXMLRunner, listingTests, consoleTestReporter]

-- | The main entry point to the test suite.
main :: IO ()
main = defaultMainWithIngredients ingredients tests


--------------------------------------------------------------------------------
