Class {
	#name : #BSLocalTestingChromeExample,
	#superclass : #TestCase,
	#instVars : [
		'driver'
	],
	#category : #'BrowserStackLocal-Tests'
}

{ #category : #running }
BSLocalTestingChromeExample >> setUp [
	| option |
	super setUp.
	self timeLimit: 1 minute.
	BSLocal start.
	BPRemoteWebDriver serverHost: 'hub-cloud.browserstack.com'.
	BPRemoteWebDriver username: BSLocal browserstackUsername.
	BPRemoteWebDriver password: BSLocal browserstackKey.
	BPRemoteWebDriver scheme: 'https'.
	BPRemoteWebDriver serverPort: 443.
	option := BPChromeOptions new.
	option setCapability: 'browserstack.local' to: true.
	option setCapability: 'project' to: 'ce-challenge'.
	option setCapability: 'name' to: 'smalltalk-test'.
	option setCapability: 'build' to: Time now asString. 
	driver := BPRemoteWebDriver new initWithCapabilities: option
]

{ #category : #running }
BSLocalTestingChromeExample >> tearDown [ 
	super tearDown.
	driver quit.
	BSLocal stop.
]

{ #category : #tests }
BSLocalTestingChromeExample >> testBSLocal [
	driver get: 'http://localhost:8080'.
	self assert: driver getTitle equals: 'Welcome to Seaside 3.4.3'
]
