{-# OPTIONS_GHC -F -pgmFderive -optF-F #-}
{-# LANGUAGE MultiParamTypeClasses #-}
module Main (main) where

import Lib
import Data.Generics.Uniplate.Direct

data Expr = Var Int | Pos Expr String | Neg Expr | Add Expr Expr
data Stmt = Seq [Stmt] | Sel [Expr] | Let String Expr
{-!
deriving instance UniplateDirect (Expr)
deriving instance UniplateDirect Stmt String
deriving instance UniplateDirect Expr String
!-}



main :: IO ()
main = someFunc


-- GENERATED START

instance Uniplate Expr where
        {-# INLINE uniplate #-}
        uniplate (Pos x1 x2) = plate Pos |* x1 |- x2
        uniplate (Neg x1) = plate Neg |* x1
        uniplate (Add x1 x2) = plate Add |* x1 |* x2
        uniplate x = plate x

instance Biplate String Stmt where
        {-# INLINE biplate #-}
        biplate (Seq x1) = plate Seq ||+ x1
        biplate (Sel x1) = plate Sel ||+ x1
        biplate (Let x1 x2) = plate Let |* x1 |+ x2

instance Biplate String Expr where
        {-# INLINE biplate #-}
        biplate (Pos x1 x2) = plate Pos |+ x1 |* x2
        biplate (Neg x1) = plate Neg |+ x1
        biplate (Add x1 x2) = plate Add |+ x1 |+ x2
        biplate x = plate x
-- GENERATED STOP
