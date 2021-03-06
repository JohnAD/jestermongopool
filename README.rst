Introduction to jestermongopool
==============================================================================
ver 1.0.1

.. image:: https://raw.githubusercontent.com/yglukhov/nimble-tag/master/nimble.png
   :height: 34
   :width: 131
   :alt: nimble
   :target: https://nimble.directory/pkg/jestermongopool

.. image:: https://repo.support/img/rst-banner.png
   :height: 34
   :width: 131
   :alt: repo.support
   :target: https://repo.support/gh/JohnAD/jestermongopool

This is a plugin for the nim web
framework `Jester <https://github.com/dom96/jester>`__. It supports the
`MongoPool <https://nimble.directory/pkg/mongopool>`__ library's use with Jester.

GETTING A MONGODB CONNECTION
============================

Include the plugin ``nextMongoConnection("<failureUrl>")`` at the top of your main ``routes``
or primary ``router``. This will enable the plugin for the whole web site.
The variable connected will be the resulting "next" connection.

If the driver is unable to pull a good connection from the pool of connections,
then web request will be redirected to the ``failureUrl`` provided (and the
page route will not run.)

For example:

.. code:: nim

    import jester
    import jestermongopool
    import mongopool
    import bson

    connectMongoPool("mongodb://someone:secret@mongo.domain.com:27017/abc")

    routes:
      plugin db <- nextMongoConnection("/dberror")
      get "/":
        var doc = db.find("webday").returnOne()
        resp "doc = " & $doc
      get "/dberror":
        resp "database error.<br /><pre>" & getMongoPoolStatus() & "</pre>"




Table Of Contents
=================

1. `Introduction to jestermongopool <https://github.com/JohnAD/jestermongopool>`__
2. Appendices

    A. `jestermongopool Reference <https://github.com/JohnAD/jestermongopool/blob/master/docs/jestermongopool-ref.rst>`__
