module Refined

import Data.List
import Props.Util
import Props.Char

%access public export
Refined : (a : Type) -> (P : a -> Type) -> Type
Refined = DPair

implicit 
toRefined : { a : Type } -> { P : a -> Type } -> (x:a) -> { auto property : P x } -> Refined a P
toRefined value {property} = (value ** property)

implicit 
fromRefined : Refined Char Digit -> Char
fromRefined (x ** prf) = x

x : Refined Char Digit
x = '0'

y : Refined Char Letter
y = 'A'

z : Refined Char LetterOrDigit
z = '0'

a : Refined Char LowerOrUpperOrDigit
a = '0'

test : Char -> IO ()
test c = print $ show c

main : IO ()
main = test Refined.x
