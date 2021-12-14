{-# LANGUAGE OverloadedStrings #-}
module Day02
    ( runSolution
    ) where

import qualified Data.ByteString as BS
import qualified Data.List as DL

import qualified Data.Attoparsec.ByteString as DAB
import qualified Data.Attoparsec.ByteString.Char8 as DABC8

import qualified Linear as L
import Control.Lens

data Command
	= Forward Int
	| Down Int
	| Up Int
	deriving Show

type Input = [Command]
type Result = Int

-- Solution: 2073315
solver1 :: Input -> Result
solver1 = (\(L.V2 x y) -> x * y) . DL.foldl' (+) (L.V2 0 0) . (mapper <$>)
	where
	mapper (Forward x) = L.V2 x 0
	mapper (Down x) = L.V2 0 x
	mapper (Up x) = L.V2 0 (-x)

-- Solution: 1840311528
solver2 :: Input -> Result
solver2 = (\(L.V2 x y) -> x * y) . fst . DL.foldl' folder (L.V2 0 0, 0)
	where
	folder :: (L.V2 Int, Int) -> Command -> (L.V2 Int, Int)
	folder (L.V2 px py, aim) (Forward x) = (L.V2 (px + x) (py + aim * x), aim)
	folder (pos, aim) (Down x) = (pos, aim + x)
	folder (pos, aim) (Up x) = (pos, aim - x)

simpleParser :: DAB.Parser Input
simpleParser = DAB.sepBy'
	( DAB.choice
		[ DAB.try $ DAB.string "forward " *> (Forward <$> DABC8.decimal)
		, DAB.try $ DAB.string "down " *> (Down <$> DABC8.decimal)
		, DAB.try $ DAB.string "up " *> (Up <$> DABC8.decimal) ]
	) (DABC8.char '\n')

-- Higher than 1005
runSolution :: FilePath -> IO ()
runSolution inputPath = do
	contents <- BS.readFile inputPath
	let parseResult = DAB.parseOnly simpleParser contents
	case parseResult of
		Left error -> putStrLn error
		Right input -> print $ solver2 input
