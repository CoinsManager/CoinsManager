Guidance for Scribers
=====================


Requirements
------------
Make sure that you have
`Python 2.6+ and Sphinx <http://sphinx-doc.org/latest/install.html>`_
installed.

You will need to write the documentation in RestructuredText.
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

    $ git clone git@github.com:CoinsManager/CoinsManager.git CoinsManagerDoc
    $ cd CoinsManagerDoc && git checkout gh-pages && cd ..
    $ git clone git@github.com:Fandekasp/CoinsManager.git
    $ cd CoinsManager && git checkout develop && cd docs/

Then edit the documentation, and browse it locally:

.. code-block:: console

    (CoinsManager/docs/)$ make html
    (CoinsManager/docs/)$ cd ../../CoinsManagerDoc/
    (CoinsManagerDocs/)$ xdg-open index.html

.. tip::

    If you do not have :program:`xdg-open`, try with your browser (eg
    ``chromium index.html``, or open your browser and access the file via its
    full path.

when you're finished writing your rst documentation and commited it on the repo
**CoinsManager**, do a pull request to **upstream/CoinsManager** (on github)


If you are part of the Github contributors team, then you can also directly
update the upstream gh-pages branch (it's recommended to wait for the pull
request to be merged first).

.. code-block:: console

    $ cd CoinsManagerDoc/
    $ git commit -am "Rebuild html documentation"
    $ git push


.. seealso:: `Publishing sphinx-generated docs on github <http://daler.github.io/sphinxdoc-test/includeme.html>`_
