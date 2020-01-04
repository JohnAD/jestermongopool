# Package

version      = "1.0.0"
author       = "John Dupuy"
description  = "Plugin(s) for Jester that supports the MongoPool MongoDb driver."
license      = "MIT"
srcDir       = "src"
skipExt      = @["rst"]

# Dependencies

requires "nim >= 1.0.0", "jester >= 0.4.3", "mongopool >= 1.0.0"
