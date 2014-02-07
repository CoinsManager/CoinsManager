install:
	curl https://install.meteor.com | /bin/sh
	git submodule update --init --recursive
	npm i -g karma phantomjs istanbul grunt-cli selenium-webdriver coffee-script meteorite
	cd test/rtd && npm install && npm i karma-mocha karma-chai --save-dev
	cd test/rtd && npm install karma-mocha-reporter

test:
	cd test/rtd && grunt runOnce

.PHONY: test
