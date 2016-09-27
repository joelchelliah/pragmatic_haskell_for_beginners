module FooParser where

import Control.Monad (void)
import Text.Megaparsec
import Text.Megaparsec.String -- input stream is of type ‘String’
import qualified Text.Megaparsec.Lexer as L

sc :: Parser ()
sc = L.space (void spaceChar) lineCmnt blockCmnt
  where lineCmnt  = L.skipLineComment "//"
        blockCmnt = L.skipBlockComment "/*" "*/"

lexeme :: Parser a -> Parser a
lexeme = L.lexeme sc

parseWord :: Parser String
parseWord = lexeme $ do
  _ <- char '<'
  word <- some (alphaNumChar <|> char '-')
  _ <- char '>'
  return word

parseWords :: Parser [String]
parseWords = some parseWord
