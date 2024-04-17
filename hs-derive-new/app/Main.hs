{-# LANGUAGE DeriveGeneric, DeriveAnyClass,StandaloneDeriving #-}

module Main (main) where

import Generics.Deriving.Uniplate
import GHC.Generics

data Expr = Var Int | Pos Expr String | Neg Expr | Add Expr Expr
  deriving (Generic, Uniplate)
data Stmt = Seq [Stmt] | Sel [Expr] | Let String Expr
  deriving (Generic, Uniplate)

main :: IO ()
main = putStrLn "hello, world" :: IO ()

