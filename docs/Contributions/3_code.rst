.. |date| date::


Guidance for Programmers
========================

.. contents::
    :depth: 1
    :local:

At CoinsManager, we are going to develop a product using the latest
technologies available, for the best user & developer experiences possible.

If you want to contribute, but feel a bit scared by all those frameworks (after
all, we aren't writing any css, javascript or html code), don't be! See that as
a learning experience with free coaching to help you master all those awesome
technologies.


List of technologies used
-------------------------

CSS
~~~
Development tools:

* `Sass <http://sass-lang.com/>`_
* `Compass <http://compass-style.org/>`_
* `Susy Next <http://susy.oddbird.net/>`_
* `Breakpoint <http://breakpoint-sass.com/>`_

The design workflow looks like this:

.. image:: ../_static/design_parts.png

.. seealso:: `SMACSS <http://smacss.com/book/>`_

Testing tools:

* `Hardy <http://hardy.io/>`_
* `PhantomCSS <https://github.com/Huddle/PhantomCSS>`_
* `Wraith <https://github.com/BBC-News/wraith>`_

HTML
~~~~
* `Jade <http://jade-lang.com/>`_
* `Handlebars <http://handlebarsjs.com/>`_

Javascript
~~~~~~~~~~
Development tools:

* `Meteor <http://www.meteor.com/>`_
* `CoffeeScript <http://coffeescript.org/>`_

Testing tools:

* `RTD <http://rtd.xolv.io/>`_
* `Mocha <http://visionmedia.github.io/mocha/>`_
* `Chai <http://chaijs.com/>`_
* `Sinon <http://sinonjs.org/>`_

.. note::

    Meteor is still in beta, and we might face a wall during our
    development. If we cannot resolve it or wait for the v1 to comes out, we'll
    migrate the code to `AngularJS <http://angularjs.org/>`_

All technologies can be represented as below:

.. image:: ../_static/dev_tools.png


Infrastructure
--------------

Here is the current state of the infrastructure (as per |date|)

.. image:: ../_static/infrastructure.png


Test code
---------
First, install `npm <https://www.npmjs.org/>`_ (Node.js package manager).

.. tip::

    To run npm install commands as your normal user, do the following:

    .. code-block:: console

        $ echo "prefix = /usr/local" >> ~/.npmrc
        $ chown -R youruser /usr/local

Then, run the following steps to execute your tests

.. code-block:: console

    $ cd CoinsManager/
    $ make install && make test

If all goes well, then you should see something like that:

.. image:: ../_static/test_success.png

`make install` needs to be executed only once.

If you want to use RTD as a Continuous Integration tool in your local
environment, do this instead of `make test`:

.. code-block:: console

    $ cd test/rtd
    $ ./rtd --debug


Running code
------------
.. code-block:: console

    $ cd app/
    $ mrt run --settings settings.json


Wait, I'm not seeing any design!
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Make sure you have `RubyGems <http://rubygems.org/>`_ installed in your system,
then install the design requirements:

.. code-block:: console

    $ gem update --system
    $ gem install compass breakpoint
    $ gem install susy --pre

When you're done, go generate the css files for the project:

.. code-block:: console

    $ cd app/client/compass
    $ compass compile


Deploy code
-----------
we need to specify the settings (containing our
`Google Analytics <https://atmosphere.meteor.com/package/GAnalytics>`_ code
among other things) when deploying (note that you need to be a privileged user
with access to the deployment password).

Meteor hosting
~~~~~~~~~~~~~~
Used to deploy the old **Coming Soon Page**

.. code-block:: console

    $ meteor deploy www.coinsmanager.com --password --settings settings.json

Heroku
~~~~~~
First, install the toolbelt.

.. code-block:: console

    $ wget -qO- https://toolbelt.heroku.com/install.sh | sh
    $ echo 'PATH="/usr/local/heroku/bin:$PATH"' >> ~/.profile

Then login with your authorized Heroku account

.. code-block:: console

    $ heroku login

Edit your :file:`.git/config` to add the new heroku remote, for example::

    [remote "heroku-beta"]
        url = git@heroku.com:coinsmanager-beta.git
        fetch = +refs/heads/*:refs/remotes/heroku/*

Now you can push on **heroku-beta** (Heroku git repository) like you would doesn
with **origin** (your Github fork) or **upstream** (CoinsManager Github
repository).
Confer :ref:`Git Remotes <git-remotes>` if needed.

Because heroku doesn't know yet how to compile our `.sass` files into css
(missing feature in the buildpack, or missing **meteor-compass** package to
handle it), we need to compile it ourselves and commit it in git before pushing
it to Heroku.

In the following example, we will deploy the **develop** branch on Heroku beta:

.. code-block:: console

    $ git co develop
    $ heroku config:add --app coinsmanager-beta METEOR_SETTINGS="`cat app/settings.json`"
    $ cd app/client/compass && compass compile && cd -
    $ for file in `find . -name '*css'`; do git add -f $file; done; git commit -am "heroku style"
    $ for file in `find . -name 'sprites-*.png'`; do git add -f $file; done; git commit -am "heroku sprites"
    $ git push heroku-beta `git subtree split --prefix app develop`:master --force
    $ git reset --soft HEAD~2 && git reset HEAD .

.. note::

    * the for loop searches for all css files and commit them (by default css
      files are ignored by the repo).
    * the git subtree command is a trick to push only the content from the
      :file:`app/` directory to heroku, which expects the code to be at the root
      directory.

Now, let's say we got a donation for a non-implemented coin, and we want to
quickly update it without redeploying.
First, install the **heroku-mongo-sync** application:

.. code-block:: console

    $ heroku plugins:install http://github.com/marcofognog/heroku-mongo-sync
    $ sudo gem install mongo
    $ gem install bson_ext

In this example, we will add 500XRP to the Ripple donation address
rDY3Nh9dYxxoYqsmBwG2cRU2FDteft9Xox in the beta.

.. code-block:: console

    $ heroku mongo:pull --app coinsmanager-beta
    $ mongo coinsmanager-beta
    > db.addresses.update({address: "rDY3Nh9dYxxoYqsmBwG2cRU2FDteft9Xox"}, {$set: {"balance": db.addresses.findOne({address: "rDY3Nh9dYxxoYqsmBwG2cRU2FDteft9Xox"}).balance + 500}})
    bye
    $ heroku mongo:push --app coinsmanager-beta
