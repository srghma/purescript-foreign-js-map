module Foreign.JsMap
  ( module Foreign.JsMap
  , module Export
  )
  where

import Prelude

import Effect (Effect)
import Effect.Uncurried as EFn
import Data.Nullable as Nullable
import Foreign.JsMap.ArrayOfTwoValues (fst, snd)
import Foreign.JsMap.Iterator (_toArray)
import Foreign.JsMap.Types (JsMap)
import Foreign.JsMap.Api (_clear, _delete, _entries, _forEach, _get, _has, _keys, _set, _values)
import Foreign.JsMap.Api (empty) as Export
import Data.Function.Uncurried as Fn
import Data.Maybe (Maybe)

clear ∷ ∀ key value . JsMap key value -> Effect Unit
clear = EFn.runEffectFn1 _clear

delete ∷ ∀ key value . key -> JsMap key value -> Effect Boolean
delete = EFn.runEffectFn2 _delete

get ∷ ∀ key value . key -> JsMap key value -> Effect (Maybe value)
get key jsmap = map (Nullable.toMaybe) $ EFn.runEffectFn2 _get key jsmap

has ∷ ∀ key value . key -> JsMap key value -> Effect Boolean
has = EFn.runEffectFn2 _has

set ∷ ∀ key value . key -> value -> JsMap key value -> Effect Unit
set key value jsmap = void $ EFn.runEffectFn3 _set key value jsmap

keys ∷ ∀ key value . JsMap key value -> Effect (Array key)
keys jsmap = EFn.runEffectFn1 _keys jsmap >>= EFn.runEffectFn1 _toArray

values ∷ ∀ key value . JsMap key value -> Effect (Array value)
values jsmap = EFn.runEffectFn1 _values jsmap >>= EFn.runEffectFn1 _toArray

entries ∷ ∀ key value . JsMap key value -> Effect (Array { key :: key, value :: value })
entries jsmap = (EFn.runEffectFn1 _entries jsmap >>= EFn.runEffectFn1 _toArray) <#> map (\two -> { key: fst two, value: snd two })

forEach ∷ ∀ key value . (key -> value -> Effect Unit) -> JsMap key value -> Effect Unit
forEach callback = EFn.runEffectFn2 _forEach (EFn.mkEffectFn2 callback)

foreign import _mapWithKey ∷ ∀ key value output . EFn.EffectFn2 (Fn.Fn2 key value output) (JsMap key value) output

mapWithKey ∷ ∀ key value output . (key -> value -> output) -> JsMap key value -> Effect output
mapWithKey callback = EFn.runEffectFn2 _mapWithKey (Fn.mkFn2 callback)
