module MinfreeSpec (spec) where

import Test.Hspec
import Minfree
import Test.Hspec.QuickCheck (prop)
import Test.QuickCheck


spec :: Spec
spec = do
  describe "minfree" $
    it "書籍の実行例" $
      minfree [8,23,9,0,12,11,1,10,13,7,41,4,14,21,5,17,3,19,2,6] `shouldBe` 15

  describe "minfree'" $
    it "書籍の実行例" $
      minfree' [8,23,9,0,12,11,1,10,13,7,41,4,14,21,5,17,3,19,2,6] `shouldBe` 15

  describe "minfree == minfree'" $
    prop "minfree == minfree'" prop_Minfree

prop_Minfree :: [Int] -> Bool
prop_Minfree xs = minfree xs == minfree' xs