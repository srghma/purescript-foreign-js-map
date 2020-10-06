{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "foreign-js-map"
, dependencies = [ "console", "effect", "psci-support", "nullable", "functions" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
