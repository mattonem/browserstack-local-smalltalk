Class {
	#name : #BSLocalTesting,
	#superclass : #TestCase,
	#instVars : [
		'driver'
	],
	#category : #'BrowserStackLocal-Tests'
}

{ #category : #running }
BSLocalTesting >> setUp [
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
BSLocalTesting >> tearDown [ 
	super tearDown.
	driver quit.
	BSLocal stop
	
]

{ #category : #tests }
BSLocalTesting >> testBSLocal [
	driver get: 'https://www.browserstack.com/local-testing/automate'.
	self assert: true 
]
