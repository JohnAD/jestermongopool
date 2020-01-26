jestermongopool Reference
==============================================================================

The following are the references for jestermongopool.






Procs, Methods, Iterators
=========================


.. _nextMongoConnection.p:
nextMongoConnection
---------------------------------------------------------

    .. code:: nim

        proc nextMongoConnection*(request: Request, response: var ResponseData, failureUrl: string = "/dberror"): MongoConnection =

    source line: `41 <../src/jestermongopool.nim#L41>`__

    This is the psuedo-procedure to enable the library plugin.
    
    Once placed on the main router or ``routes``, the plugin is active on
    all page routes.
    
    The variable created is one single MongoDB connection and can be used
    by the routes to manipulate the database. After the route closes, the
    connection is returned to the pool of connections.
    
    The ``failureUrl`` parameter is used when no connections are found. Instead
    of running the page route code, the server returns a ``redirect`` to the
    ``failureUrl``.
    
    When the route is pointing to the ``failureUrl``, the plugin refrains
    from trying to connect to the MongoDB database.







Table Of Contents
=================

1. `Introduction to jestermongopool <https://github.com/JohnAD/jestermongopool>`__
2. Appendices

    A. `jestermongopool Reference <jestermongopool-ref.rst>`__
