Publishing sphinx-generated docs on github
==========================================

Requirements
------------

You will need to write the documentation is RestructuredText.
The best way is to read the project documentation files, and use them as
example to write your own documentation.

.. seealso:: `github rst cheatsheet <https://github.com/ralsina/rst-cheatsheet/blob/master/rst-cheatsheet.rst>`_



Publish documentation to the `CoinsManager Online Documentation`__
------------------------------------------------------------------

.. _online-doc: http://coinsmanager.github.io/CoinsManager/

__ _online-doc

First, git clone the repository, then copy the directory:

.. code-block:: console

    $ git clone git@github.com:CoinsManager/CoinsManager.git
    $ cp CoinsManager CoinsManagerDoc
    $ cd CoinsManagerDoc && git checkout gh-pages
    $ cd ../CoinsManager && git checkout develop
    $ cd docs/

Then edit the 


.. seealso:: `Publishing sphinx-generated docs on github <http://daler.github.io/sphinxdoc-test/includeme.html>`_
