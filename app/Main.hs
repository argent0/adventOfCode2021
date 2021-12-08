{-# LANGUAGE LambdaCase #-}
module Main where

import qualified Day01

import qualified System.Environment as SE

main :: IO ()
main = SE.getArgs >>= \case
	["01"] -> Day01.runSolution "input/day01"
	["01i"] -> Day01.runSolution "short-input/day01"
	args -> error $ "Args were: " ++ show args
