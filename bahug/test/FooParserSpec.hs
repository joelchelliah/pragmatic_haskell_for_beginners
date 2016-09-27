module FooParserSpec where

import Test.Hspec
import FooParser (parseWord, parseWords)
import Text.Megaparsec

spec :: Spec
spec =
  describe "parses stuff" $ do
    it "parses one word" $
      runParser parseWord "" "<foo>" `shouldBe` Right "foo"
    it "parses one word with dash" $
      runParser parseWord "" "<foo-bar>" `shouldBe` Right "foo-bar"
    it "parses multiple words" $
      runParser parseWords "" "<foo> <bar>" `shouldBe` Right ["foo", "bar"]
