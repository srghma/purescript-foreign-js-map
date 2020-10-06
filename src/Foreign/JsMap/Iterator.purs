module Foreign.JsMap.Iterator where


import Effect.Uncurried as EFn

data Iterator a

foreign import _toArray ∷ ∀ a . EFn.EffectFn1 (Iterator a) (Array a)
