{-# LANGUAGE LambdaCase #-}
module Main where

import qualified Day01
import qualified Day02
import qualified Day03
import qualified Day04
import qualified Day05
import qualified Day06
import qualified Day07
import qualified Day08
import qualified Day09
import qualified Day10
import qualified Day11
import qualified Day12
import qualified Day13
import qualified Day14
import qualified Day15
import qualified Day16
import qualified Day17
import qualified Day18
import qualified Day19
import qualified Day20
import qualified Day21
import qualified Day22
import qualified Day23
import qualified Day24
import qualified Day25

import qualified System.Environment as SE

main :: IO ()
main = SE.getArgs >>= \case
	["01"] -> Day01.runSolution "input/day01"
	["01i"] -> Day01.runSolution "short-input/day01"
	["02"] -> Day02.runSolution "input/day02"
	["02i"] -> Day02.runSolution "short-input/day02"
	["03"] -> Day03.runSolution "input/day03"
	["03i"] -> Day03.runSolution "short-input/day03"
	["04"] -> Day04.runSolution "input/day04"
	["04i"] -> Day04.runSolution "short-input/day04"
	["05"] -> Day05.runSolution "input/day05"
	["05i"] -> Day05.runSolution "short-input/day05"
	["06"] -> Day06.runSolution "input/day06"
	["06i"] -> Day06.runSolution "short-input/day06"
	["07"] -> Day07.runSolution "input/day07"
	["07i"] -> Day07.runSolution "short-input/day07"
	["08"] -> Day08.runSolution "input/day08"
	["08i"] -> Day08.runSolution "short-input/day08"
	["09"] -> Day09.runSolution "input/day09"
	["09i"] -> Day09.runSolution "short-input/day09"
	["10"] -> Day10.runSolution "input/day10"
	["10i"] -> Day10.runSolution "short-input/day10"
	["11"] -> Day11.runSolution "input/day11"
	["11i"] -> Day11.runSolution "short-input/day11"
	["12"] -> Day12.runSolution "input/day12"
	["12i"] -> Day12.runSolution "short-input/day12"
	["13"] -> Day13.runSolution "input/day13"
	["13i"] -> Day13.runSolution "short-input/day13"
	["14"] -> Day14.runSolution "input/day14"
	["14i"] -> Day14.runSolution "short-input/day14"
	["15"] -> Day15.runSolution "input/day15"
	["15i"] -> Day15.runSolution "short-input/day15"
	["16"] -> Day16.runSolution "input/day16"
	["16i"] -> Day16.runSolution "short-input/day16"
	["17"] -> Day17.runSolution "input/day17"
	["17i"] -> Day17.runSolution "short-input/day17"
	["18"] -> Day18.runSolution "input/day18"
	["18i"] -> Day18.runSolution "short-input/day18"
	["19"] -> Day19.runSolution "input/day19"
	["19i"] -> Day19.runSolution "short-input/day19"
	["20"] -> Day20.runSolution "input/day20"
	["20i"] -> Day20.runSolution "short-input/day20"
	["21"] -> Day21.runSolution "input/day21"
	["21i"] -> Day21.runSolution "short-input/day21"
	["22"] -> Day22.runSolution "input/day22"
	["22i"] -> Day22.runSolution "short-input/day22"
	["23"] -> Day23.runSolution "input/day23"
	["23i"] -> Day23.runSolution "short-input/day23"
	["24"] -> Day24.runSolution "input/day24"
	["24i"] -> Day24.runSolution "short-input/day24"
	["25"] -> Day25.runSolution "input/day25"
	["25i"] -> Day25.runSolution "short-input/day25"
	args -> error $ "Args were: " ++ show args
