module Day01
    ( runSolution
    ) where

import qualified Data.ByteString as BS
import qualified Data.List as DL
import qualified Control.Applicative as CA

type Input = [Int]
type Result = Int

-- Solution: 1655
solver1 :: Input -> Result
solver1 hs = DL.foldl' (+) 0 $ zipWith zipper hs (tail hs)
	where
	zipper h g
		| g > h = 1
		| otherwise = 0

-- Solution: 1683
solver2 :: Input -> Result
solver2 hs = DL.foldl' (+) 0 $
	zipper <$> CA.ZipList hs <*> CA.ZipList (tail hs) <*> CA.ZipList (tail (tail hs)) <*> CA.ZipList (tail (tail (tail hs)))
	where
	zipper h1 h2 h3 h4
		| (h2+h3+h4) > (h1+h2+h3) = 1
		| otherwise = 0

simpleParser :: String -> Input
simpleParser = fmap read . lines

runSolution :: FilePath -> IO ()
runSolution inputPath = do
	contents <- readFile inputPath
	let input = simpleParser contents
	print $ solver2 input
