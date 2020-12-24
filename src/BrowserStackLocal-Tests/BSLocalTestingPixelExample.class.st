Class {
	#name : #BSLocalTestingPixelExample,
	#superclass : #TestCase,
	#instVars : [
		'driver'
	],
	#category : #'BrowserStackLocal-Tests'
}

{ #category : #running }
BSLocalTestingPixelExample class >> resources [

	^ super resources , (Array with: BSLocalTestResource)
]

{ #category : #tests }
BSLocalTestingPixelExample >> defaultTimeLimit [ 
	^ 1 minute
]

{ #category : #running }
BSLocalTestingPixelExample >> setUp [
	| option |
	super setUp.
	BPRemoteWebDriver serverHost: 'hub-cloud.browserstack.com'.
	BPRemoteWebDriver username: BSLocal browserstackUsername.
	BPRemoteWebDriver password: BSLocal browserstackKey.
	BPRemoteWebDriver scheme: 'https'.
	BPRemoteWebDriver serverPort: 443.
	option := BPGenericOptions new.
	option setCapability: 'os_version' to: '11.0'.
	option setCapability: 'device' to: 'Google Pixel 4'.
	option setCapability: 'real_mobile' to: true.
	option setCapability: 'browserstack.local' to: true.
	option setCapability: 'project' to: 'ce-challenge'.
	option setCapability: 'name' to: 'smalltalk-test'.
	option setCapability: 'build' to: Time now asString. 
	driver := BPRemoteWebDriver new initWithCapabilities: option
]

{ #category : #running }
BSLocalTestingPixelExample >> tearDown [ 
	super tearDown.
	driver quit.
]

{ #category : #tests }
BSLocalTestingPixelExample >> testBSLocal [
	driver get: 'http://localhost:8080'.
	self assert: driver getTitle equals: 'Welcome to Seaside 3.4.3'
]
