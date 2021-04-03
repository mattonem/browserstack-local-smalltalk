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

	^ super resources , (Array with: BSBuildName)
]

{ #category : #tests }
BSLocalTestingParametrized class >> testParameters [

	^ ParametrizedTestMatrix new
		addCase: { #capabilities -> self chromeCapabilities. };
		addCase: { #capabilities -> self pixelCapabilities. };			
		yourself.
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
	BSLocal start.
	ZnZincServerAdaptor startOn: 8080.
	BPRemoteWebDriver serverHost: 'hub-cloud.browserstack.com'.
	BPRemoteWebDriver username: BSLocal browserstackUsername.
	BPRemoteWebDriver password: BSLocal browserstackKey.
	BPRemoteWebDriver scheme: 'https'.
	BPRemoteWebDriver serverPort: 443.
	option := capabilities.
	driver := BPRemoteWebDriver new initWithCapabilities: option
]

{ #category : #running }
BSLocalTestingParametrized >> tearDown [ 
	super tearDown.
	driver quit.
	BSLocal stop.
]

{ #category : #running }
BSLocalTestingParametrized >> testBSLocal [
	driver get: 'http://localhost:8080'.
	self assert: driver getTitle equals: 'Welcome to Seaside 3.4.4'
]
