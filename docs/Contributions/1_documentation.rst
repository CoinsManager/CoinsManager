Guidance for Scribers
=====================


Requirements
------------

You will need to write the documentation is RestructuredText.
The best way is to read the project documentation files, and use them as
example to write your own documentation.

.. seealso:: `github rst cheatsheet <https://github.com/ralsina/rst-cheatsheet/blob/master/rst-cheatsheet.rst>`_


.. _git-doc:

Publish documentation to the `CoinsManager Online Documentation`__
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. _online-doc: http://coinsmanager.github.io/CoinsManager/

__ _online-doc

First, fork the repository in your own github account, then git clone your
repository and copy it:

.. code-block:: console

    $ git clone git@github.com:Fandekasp/CoinsManager.git
    $ cp CoinsManager CoinsManagerDoc
    $ cd CoinsManagerDoc && git checkout gh-pages
    $ cd ../CoinsManager && git checkout develop
    $ cd docs/

Then edit the documentation, and when you're finished commiting it, publish as
follow:

.. code-block:: console

    $ make html
    $ cd ../../CoinsManagerDoc/
    $ git commit -am "Rebuild html documentation"
    $ git push origin gh-pages


.. seealso:: `Publishing sphinx-generated docs on github <http://daler.github.io/sphinxdoc-test/includeme.html>`_
