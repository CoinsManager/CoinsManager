install:
	curl https://install.meteor.com | /bin/sh
	git submodule update --init --recursive
	npm i -g karma@~0.10 phantomjs@1.9.0-6 istanbul@0.1.39 grunt-cli selenium-webdriver@2.33.0 coffee-script meteorite
	cd test/rtd && npm install --save-optional && npm i karma-mocha@^0.2.0 karma-chai@^0.1.0 karma-mocha-reporter@^1.0.2 --save-dev

test:
	cd test/rtd && grunt runOnce

.PHONY: test
