plugin Reference
==============================================================================

The following are the references for JesterMongoPool plugin.

Plugins
=======

.. _nextMongoConnection.plugin:
nextMongoConnection
---------------------------------------------------------

    .. code:: nim

        nextMongoConnection(failureUrl: string = "/dberror"): MongoConnection =

    This is the psuedo-procedure to invoke to enable the library plugin.

    Once placed on the main router or ``routes``, the plugin is active on
    all page routes.

    The variable created is one single MongoDB connection and can be used
    by the routes to manipulate the database.

    The ``failureUrl`` parameter is used when no connections are found. Instead
    of running the page route code, the server returns a ``redirect`` to the
    ``failureUrl``.

    When the route is pointing to the ``failureUrl``, the plugin refrains
    from trying to connect to the MongoDB database.


Table Of Contents
=================

1. `Introduction to jestermongopool <https://github.com/JohnAD/jestermongopool>`__
2. `plugin Reference <plugin-ref.rst>`__
