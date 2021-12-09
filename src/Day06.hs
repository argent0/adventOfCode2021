module Day06
    ( runSolution
    ) where

import qualified Data.ByteString as BS
import qualified Data.List as DL
import qualified Control.Applicative as CA

type Input = [Int]
type Result = Int

-- Solution: 1655
solver1 :: Input -> Result
solver1 = undefined

-- Solution: 1683
solver2 :: Input -> Result
solver2 = undefined

simpleParser :: String -> Input
simpleParser = undefined

runSolution :: FilePath -> IO ()
runSolution inputPath = do
	contents <- readFile inputPath
	let input = simpleParser contents
	print $ solver1 input
