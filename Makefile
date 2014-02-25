install:
	curl https://install.meteor.com | /bin/sh
	git submodule update --init --recursive
	npm i -g karma phantomjs istanbul grunt-cli selenium-webdriver coffee-script meteorite
	cd test/rtd && npm install --save-optional && npm i karma-mocha karma-chai karma-mocha-reporter --save-dev

test:
	cd test/rtd && grunt runOnce

.PHONY: test
