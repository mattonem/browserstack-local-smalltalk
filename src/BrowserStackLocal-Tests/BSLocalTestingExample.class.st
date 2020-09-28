Class {
	#name : #BSLocalTestingExample,
	#superclass : #TestCase,
	#instVars : [
		'driver'
	],
	#category : #'BrowserStackLocal-Tests'
}

{ #category : #running }
BSLocalTestingExample >> setUp [
	| option |
	super setUp.
	self timeLimit: 30 seconds.
	BSLocal start.
	BPRemoteWebDriver serverHost: 'hub-cloud.browserstack.com'.
	BPRemoteWebDriver username: BSLocal browserstackUsername.
	BPRemoteWebDriver password: BSLocal browserstackKey.
	BPRemoteWebDriver scheme: 'https'.
	BPRemoteWebDriver serverPort: 443.
	option := BPChromeOptions new.
	option setCapability: 'browserstack.local' to: true.
	driver := BPRemoteWebDriver new initWithCapabilities: option
]

{ #category : #running }
BSLocalTestingExample >> tearDown [ 
	super tearDown.
	driver quit.
	BSLocal stop
	
]

{ #category : #tests }
BSLocalTestingExample >> testBSLocal [
	driver get: 'http://localhost:8080'.
	self assert: driver getTitle equals: 'Welcome to Seaside 3.4.3'
]
