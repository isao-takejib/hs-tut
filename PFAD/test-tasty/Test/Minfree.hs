module Test.Minfree where

import Minfree

import Test.Tasty
import Test.Tasty.HUnit
import Test.Tasty.QuickCheck

import Data.List (nub)

unit_case1 :: IO ()
unit_case1 = minfree [8,23,9,0,12,11,1,10,13,7,41,4,14,21,5,17,3,19,2,6] @?= 15

unit_case2 :: IO ()
unit_case2 = minfree' [8,23,9,0,12,11,1,10,13,7,41,4,14,21,5,17,3,19,2,6] @?= 15

prop_Minfree :: [Positive Int] -> Property
prop_Minfree xs = preCondition ==> minfree ns  == minfree' ns
  where
      ns = map getPositive xs
      preCondition = length (nub xs) == length xs