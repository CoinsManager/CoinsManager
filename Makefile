install:
	curl https://install.meteor.com | /bin/sh
	npm i -g coffee-script meteorite karma phantomjs istanbul grunt-cli selenium-webdriver karma-mocha-reporter
	cd test/rtd && npm install
	npm i karma-mocha karma-chai --save-dev

test:
	cd test/rtd && grunt runOnce

.PHONY: test
