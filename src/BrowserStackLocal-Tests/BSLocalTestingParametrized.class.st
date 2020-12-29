Class {
	#name : #BSLocalTestingParametrized,
	#superclass : #ParametrizedTestCase,
	#instVars : [
		'driver',
		'capabilities'
	],
	#category : #'BrowserStackLocal-Tests'
}

{ #category : #tests }
BSLocalTestingParametrized class >> chromeCapabilities [
	| option |
	option := BPChromeOptions new.
	option setCapability: 'browserstack.local' to: true.
	option setCapability: 'project' to: 'ce-challenge'.
	option setCapability: 'name' to: 'smalltalk-test'.
	option setCapability: 'build' to: BSBuildName value. 
	^ option
]

{ #category : #tests }
BSLocalTestingParametrized class >> pixelCapabilities [
	| option |
	option := BPGenericOptions new.
	option setCapability: 'os_version' to: '11.0'.
	option setCapability: 'device' to: 'Google Pixel 4'.
	option setCapability: 'real_mobile' to: true.
	option setCapability: 'browserstack.local' to: true.
	option setCapability: 'project' to: 'ce-challenge'.
	option setCapability: 'name' to: 'smalltalk-test'.
	option setCapability: 'build' to: BSBuildName value.
	^ option
]

{ #category : #tests }
BSLocalTestingParametrized class >> resources [

	^ super resources , (Array with: BSLocalTestResource with: BSBuildName)
]

{ #category : #running }
BSLocalTestingParametrized >> capabilities: someCapabilities [
	capabilities := someCapabilities
]

{ #category : #tests }
BSLocalTestingParametrized >> defaultTimeLimit [ 
	^ 2 minute
]

{ #category : #running }
BSLocalTestingParametrized >> setUp [
	| option |
	super setUp.
	BPRemoteWebDriver serverHost: 'hub-cloud.browserstack.com'.
	BPRemoteWebDriver username: BSLocal browserstackUsername.
	BPRemoteWebDriver password: BSLocal browserstackKey.
	BPRemoteWebDriver scheme: 'https'.
	BPRemoteWebDriver serverPort: 443.
	Transcript show: self className, 'start';cr.
	option := capabilities.
	driver := BPRemoteWebDriver new initWithCapabilities: option
]

{ #category : #running }
BSLocalTestingParametrized >> tearDown [ 
	super tearDown.
	Transcript show: self className, 'stop';cr.
	driver quit.
]

{ #category : #running }
BSLocalTestingParametrized >> testBSLocal [
	driver get: 'http://localhost:8080'.
	self assert: driver getTitle equals: 'Welcome to Seaside 3.4.3'
]