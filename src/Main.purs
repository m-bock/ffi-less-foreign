module Main where

import Prelude

import DTS as DTS
import Data.Either (Either)
import Data.Function.Uncurried (Fn2, runFn2)
import Effect (Effect)
import Effect.Class.Console (logShow)
import Effect.Timer (setTimeout)
import Effect.Uncurried (EffectFn2, EffectFn3, mkEffectFn2, runEffectFn3)
import TsBridge as TSB

foreign import val1 :: Number

foreign import val2 :: { name :: String, hobbies :: Array String }

foreign import val3 :: String -> Boolean -> Number

foreign import val4 :: Fn2 String Boolean Number

foreign import val5
  :: EffectFn3
       { onTick :: EffectFn2 String Number Boolean }
       Boolean
       String
       { cancel :: Effect Unit }

main :: Effect Unit
main = do
  -- Some examples of using the values from the FFI imports
  -- Run `spago run` to see the output 

  logShow (val1 + 13.0)
  logShow val2.name
  logShow val2.hobbies
  logShow (val3 "abc" true)
  logShow (runFn2 val4 "abc" true)

  { cancel } <- runEffectFn3 val5
    { onTick: mkEffectFn2 \_ _ -> pure true }
    true
    "abc"
  _ <- setTimeout 10_000 cancel

  pure unit

--------------------------------------------------------------------------------

tsModules :: Either TSB.AppError (Array DTS.TsModuleFile)
tsModules =
  TSB.tsModuleFile "Main"
    [ TSB.tsTypeAliasesFromValues TSB.Tok
        { val1
        , val2
        , val3
        , val4
        , val5
        }
    ]