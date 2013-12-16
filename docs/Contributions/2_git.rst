Guidance about Git
==================
Below are described the steps to get started with Git & Github.


Installing the repo
-------------------

Fork
~~~~
First, go to the `CoinsManager Github <https://github.com/CoinsManager/CoinsManager/>`_
and click on the **Fork** button:

.. image:: ../_static/git_fork.png

This will create a clone of the main repository in your Github account.

Clone
~~~~~
In a shell, run:

.. code-block:: console

    $ git clone git@github.com:YourUsername/CoinsManager.git
    $ cd CoinsManager && git flow init

.. seealso:: :ref:`Copy repository for documentation <git-doc>`

Feature
~~~~~~~
So you cloned your repository and would like to work on some feature.
Because we are using the `Git Flow <http://nvie.com/posts/a-successful-git-branching-model/>`_,
you can create a new branch as follow:

.. code-block:: console

    $ git flow feature start my_new_feature
    $ git commit # as many times as needed
    $ git flow feature publish my_new_feature

Pull Request
~~~~~~~~~~~~
Great, you create your new code and it's available in your github repository.
But you would like to see it integrated in the main repository. How can you do
that ?


