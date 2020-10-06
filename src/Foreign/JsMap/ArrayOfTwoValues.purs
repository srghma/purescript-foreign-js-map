module Foreign.JsMap.ArrayOfTwoValues where



data ArrayOfTwoValues a b

foreign import fst ∷ ∀ a b . ArrayOfTwoValues a b -> a

foreign import snd ∷ ∀ a b . ArrayOfTwoValues a b -> b
