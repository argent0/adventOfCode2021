module Day01
    ( runSolution
    ) where

import qualified Data.ByteString as BS
import qualified Data.List as DL

type Input = [Int]
type Result = Int

solver1 :: Input -> Result
solver1 (h:hs) = DL.foldl' (+) 0 $ rec h hs
	where
	rec h [] = []
	rec h (g:gs)
		| g > h = 1 : rec g gs
		| otherwise = 0 : rec g gs

solver2 :: Input -> Result
solver2 (a1:a2:a3:bs) = DL.foldl' (+) 0 $ rec (a1+a2+a3) (a2:a3:bs)
	where
	rec h (b1:b2:b3:cs)
		| (b1+b2+b3) > h = 1 : rec (b1+b2+b3) (b2:b3:cs)
		| otherwise = 0 : rec (b1+b2+b3) (b2:b3:cs)
	rec h _ = []

simpleParser :: String -> Input
simpleParser = fmap read . lines

runSolution :: FilePath -> IO ()
runSolution inputPath = do
	contents <- readFile inputPath
	let input = simpleParser contents
	print $ solver2 input
