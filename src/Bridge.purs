module Bridge where

import Prelude

import DTS as DTS
import Data.Either (Either)
import Effect (Effect)
import Main as Main
import TsBridge as TSB
import TsBridge as TsBridge

myTsProgram :: Either TSB.AppError DTS.TsProgram
myTsProgram =
  TSB.tsProgram
    [ Main.tsModules
    ]

main :: Effect Unit
main = TsBridge.mkTypeGenCli myTsProgram