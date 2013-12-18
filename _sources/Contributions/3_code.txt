Guidance for Programmers
========================

We, at CoinsManager, are going to develop a product using the latest
technologies available, for the best user & developer experiences possible.

If you want to contribute, but feel a bit scared by all those frameworks (after
all, we aren't writing any css, javascript or html code), don't be ! See that as
a learning experience with free coaching to help you master all those awesome
technologies.


List of technologies used
-------------------------

CSS
~~~
Development tools:

* `Sass <http://sass-lang.com/>`_
* `Compass <http://compass-style.org/>`_
* `Susy <http://susy.oddbird.net/>`_

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
* `Meteor <http://www.meteor.com/>`_
* `CoffeeScript <http://coffeescript.org/>`_

.. note::

    Meteor is still in beta, and we might face a wall during our
    development. If we cannot resolve it or wait for the v1 to comes out, we'll
    migrate the code to `AngularJS <http://angularjs.org/>`_


Deploy code
~~~~~~~~~~~
Since we installed `GAnalytics <https://atmosphere.meteor.com/package/GAnalytics>`_,
we need to specify the settings (containing our Google Analytics code) when
deploying.

.. code-block:: console

    $ meteor deploy www.coinsmanager.com --settings settings.json

.. note:: You don't need to run meteor with settings in your local environment.
