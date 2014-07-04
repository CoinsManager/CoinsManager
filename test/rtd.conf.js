// *********************************************************************************************************************
// IF YOU WANT TO CUSTOMIZE ANYTHING HERE, COPY THIS FILE TO YOUR /test DIRECTORY AND RTD WILL USE THAT FILE INSTEAD
// *********************************************************************************************************************

module.exports = {
    // RTD reduces the noise by swallowing most outputs. Here you can control this
    output: {
        debug: false,           // enables all outputs. This is also switched on if you run grunt --debug
        appOutput: false,       // this shows the output from the 'meteor run' command
        mirrorOutput: false,    // this shows the output from the 'meteor run' command on the mirror app
        karma: true            // shows Karma's output
    },
    options: {
        useCucumberJs: true, // EXPERIMENTAL FEATURE: DISABLES THE RUNNING OF SPEC FILES AND CODE COVERAGE FOR NOW
        cucumberjs: { // See here for more details: https://github.com/s9tpepper/grunt-cucumber-js
            src: '<%= basePath %>/test/features',
            options: {
                steps: "<%= basePath %>/test/features/step_definitions",
                format: 'pretty'
            }
        },
        runTestsOnStart: true,
        coverage: {
            // Coverage checks run after all unit and acceptance tests run. You can disable here or set the thresholds
            enabled: false,
            includeUnitCoverage: true,
            thresholds: {
                'statements': 100,
                'branches': 100,
                'functions': 100,
                'lines': 100
            },
            exclude: '**/do_not_cover/**'
        },
        jshint: {
            enabled: false,
            // if you want to customize jslint options for app and/or test code, you can do that here
            appOptions: {
            },
            testOptions: {
                'ignores': [
                    'mocha.js'
                ]
            }
        },
	    coffeelint: {
		    enabled: true,
		    // if you want to customize coffeelint options for app and/or test code, you can do that here
			appOptions: {},
	        testOptions: {}
	    },
        // if you have client libraries, you'll want to exclude them from test coverage
        instrumentationExcludes: ['**/packages/**', '**/3rd/**', 'fixture.js', 'fixture.coffee'],
        // If your dev environment has a stand-alone mongo service, you should disabled this
        killMongo: false
    },
    selenium: {
        // You can set specific versions of selenium-server / chromedriver to use here
        darwin: {
            chromeDriverName: 'chromedriver',
            chromeDriverOs: 'mac32',
            chromeDriverVersion: '2.6',
            chromeDriverSha: '4643652d403961dd9a9a1980eb1a06bf8b6e9bad'
        },
        linux: {
            chromeDriverName: 'chromedriver',
            chromeDriverOs: 'linux64',
            chromeDriverVersion: '2.0',
            chromeDriverSha: 'd6c78f1bd48ab74d3c66e779ee2a5b70fc2937fb'
        },
        seleniumServeVersion: '2.32.0',
        seleniumServeSha: 'c94e6d5392b687d3a141a35f5a489f50f01bef6a'
    }
};
