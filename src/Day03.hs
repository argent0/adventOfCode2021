{-# LANGUAGE ScopedTypeVariables #-}
module Day03
    ( runSolution
    ) where

import qualified Data.ByteString as BS
import qualified Data.List as DL
import qualified Control.Applicative as CA
import Data.Functor (($>))
import qualified Data.Bits as DB

import qualified Data.Attoparsec.ByteString as DAB
import qualified Data.Attoparsec.ByteString.Char8 as DABC8

data Bit = Zero | One deriving (Show, Eq, Ord, Enum)
type Bits = [Bit]
type Input = [Bits]
type Result = Int

gammaRate :: Int -> Input -> Int
gammaRate size = snd . DL.foldl' folder' (0 :: Int, DB.zeroBits :: Int) . reverse . fmap mapper . DL.foldl' folder (replicate size (0, 0))
	where
	folder' :: (Int, Int) -> Bit -> (Int, Int)
	folder' (l, g) Zero = (l + 1, DB.clearBit g l)
	folder' (l, g) One = (l + 1, DB.setBit g l)
	mapper :: (Int, Int) -> Bit
	mapper (zeros, ones)
		| zeros > ones = Zero
		| otherwise = One
	folder :: [(Int, Int)] -> Bits -> [(Int, Int)]
	folder acc bits = zipWith zipper acc bits
	zipper :: (Int, Int) -> Bit -> (Int, Int)
	zipper (zeros, ones) Zero = (zeros + 1, ones)
	zipper (zeros, ones) One = (zeros, ones + 1)

-- Solution: 
solver1 :: Input -> Result
solver1 hs = undefined

-- Solution: 
solver2 :: Input -> Result
solver2 hs = undefined

simpleParser :: DAB.Parser Input
simpleParser = DAB.sepBy'
	(DAB.many1' $ DAB.choice
		[ DAB.try $ DABC8.char '0' $> Zero
		, DAB.try $ DABC8.char '1' $> One ] )
	(DABC8.char '\n')

runSolution :: FilePath -> IO ()
runSolution inputPath = do
	contents <- BS.readFile inputPath
	let parseResult = DAB.parseOnly simpleParser contents
	case parseResult of
		Left error -> putStrLn error
		Right (h:t) -> do
			let gr = gammaRate (length h) (h:t)
			let er = DB.complement gr `DB.xor` DB.shiftL (DB.complement (DB.zeroBits :: Int)) (length h)
			print (gr, er)
			print $ gr * er
		Right _ -> putStrLn "Error"
