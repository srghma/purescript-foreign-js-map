module Foreign.JsMap.Api where

import Prelude

import Effect (Effect)
import Effect.Uncurried as EFn
import Data.Nullable (Nullable)
import Foreign.JsMap.ArrayOfTwoValues (ArrayOfTwoValues)
import Foreign.JsMap.Iterator (Iterator)
import Foreign.JsMap.Types (JsMap)

foreign import empty ∷ ∀ key value . Effect (JsMap key value)

foreign import _clear ∷ ∀ key value . EFn.EffectFn1 (JsMap key value) Unit

foreign import _delete ∷ ∀ key value . EFn.EffectFn2 key (JsMap key value) Boolean

foreign import _get ∷ ∀ key value . EFn.EffectFn2 key (JsMap key value) (Nullable value)

foreign import _has ∷ ∀ key value . EFn.EffectFn2 key (JsMap key value) Boolean

foreign import _set ∷ ∀ key value . EFn.EffectFn3 key value (JsMap key value) (JsMap key value)

foreign import _keys ∷ ∀ key value . EFn.EffectFn1 (JsMap key value) (Iterator key)

foreign import _values ∷ ∀ key value . EFn.EffectFn1 (JsMap key value) (Iterator value)

foreign import _entries ∷ ∀ key value . EFn.EffectFn1 (JsMap key value) (Iterator (ArrayOfTwoValues key value))

foreign import _forEach ∷ ∀ key value . EFn.EffectFn2 (EFn.EffectFn2 key value Unit) (JsMap key value) Unit
