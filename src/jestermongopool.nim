import
  jester,
  mongopool,
  bson

## This is a plugin for the nim web
## framework `Jester <https://github.com/dom96/jester>`__. It supports the
## `MongoPool <https://nimble.directory/pkg/mongopool>`__ library's use with Jester.
##
## GETTING A MONGODB CONNECTION
## ============================
##
## Include the plugin ``nextMongoConnection("<failureUrl>")`` at the top of your main ``routes``
## or primary ``router``. This will enable the plugin for the whole web site.
## The variable connected will be the resulting "next" connection.
##
## If the driver is unable to pull a good connection from the pool of connections,
## then web request will be redirected to the ``failureUrl`` provided (and the
## page route will not run.)
##
## For example:
##  
## .. code:: nim
##
##     import jester
##     import jestermongopool
##     import mongopool
##     import bson
##     
##     connectMongoPool("mongodb://someone:secret@mongo.domain.com:27017/abc")
##     
##     routes:
##       plugin db <- nextMongoConnection("/dberror")
##       get "/":
##         var doc = db.find("webday").returnOne()
##         resp "doc = " & $doc
##       get "/dberror":
##         resp "database error.<br /><pre>" & getMongoPoolStatus() & "</pre>"
##

proc nextMongoConnection_before*(request: Request, response: var ResponseData, failureUrl: string = "/dberror"): MongoConnection =  #SKIP!
  # This is the "before" portion of the plugin. Do not run
  # this procedure directly, it is used by the plugin itself.
  if request.pathInfo != failureUrl:
    try:
      result = getNextConnection()
    except:
      response.action = TCActionSend
      response.code = Http303
      setHeader(response.headers, "Location", failureUrl)
      response.content = ""
      response.matched = true
      response.completed = true


proc nextMongoConnection_after*(request: Request, response: var ResponseData, db: MongoConnection) = #SKIP!
  # This is the "after" portion of the plugin. Do not run
  # this procedure directly, it is used by the plugin itself.
  db.releaseConnection()


