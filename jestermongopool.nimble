# Package

version      = "1.0.1"
author       = "John Dupuy"
description  = "Jester plugin(s) that support the MongoPool MongoDb driver."
license      = "MIT"
srcDir       = "src"
skipExt      = @["rst"]

# Dependencies

requires "nim >= 1.2.0", "jesterwithplugins >= 0.5.0", "mongopool >= 1.0.1"
