Class {
	#name : #BSLocalTestingParametrizedParallel,
	#superclass : #ParametrizedTestCase,
	#instVars : [
		'driver',
		'capabilities'
	],
	#category : #BrowserStackParallel
}

{ #category : #tests }
BSLocalTestingParametrizedParallel class >> chromeCapabilities [
	| option |
	option := BPGenericOptions new.
	option setCapability: 'os' to: 'windows'.
	option setCapability: 'os_version' to: '10'.
	option setCapability: 'browser' to: 'Chrome'.
	option setCapability: 'browser_version' to: 'latest'.
	option setCapability: 'browserstack.local' to: true.
	option setCapability: 'project' to: 'ce-challenge'.
	option setCapability: 'name' to: 'smalltalk-test'.
	option setCapability: 'build' to: BSBuildName value. 
	^ option
]

{ #category : #tests }
BSLocalTestingParametrizedParallel class >> pixelCapabilities [
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
BSLocalTestingParametrizedParallel class >> suiteClass [
	^ ParallelTestSuite 
]

{ #category : #tests }
BSLocalTestingParametrizedParallel class >> testParameters [

	^ ParametrizedTestMatrix new
		addCase: { #capabilities -> self chromeCapabilities. };
		addCase: { #capabilities -> self pixelCapabilities. };			
		yourself.
]

{ #category : #running }
BSLocalTestingParametrizedParallel >> capabilities: someCapabilities [
	capabilities := someCapabilities
]

{ #category : #tests }
BSLocalTestingParametrizedParallel >> defaultTimeLimit [ 
	^ 2 minute
]

{ #category : #tests }
BSLocalTestingParametrizedParallel >> runCaseManaged [ 
	^ self runCase
]

{ #category : #running }
BSLocalTestingParametrizedParallel >> setUp [

	| option |
	super setUp.
	BPRemoteWebDriver serverHost: 'hub-cloud.browserstack.com'.
	BPRemoteWebDriver username: BSLocal browserstackUsername.
	BPRemoteWebDriver password: BSLocal browserstackKey.
	BPRemoteWebDriver scheme: 'https'.
	BPRemoteWebDriver serverPort: 443.
	option := capabilities.
	driver := BPRemoteWebDriver new initWithCapabilities: option
]

{ #category : #running }
BSLocalTestingParametrizedParallel >> tearDown [ 
	super tearDown.
	driver quit.
]

{ #category : #running }
BSLocalTestingParametrizedParallel >> testBSLocal [
	driver get: 'http://localhost:8080'.
	self assert: driver getTitle equals: 'Welcome to Seaside 3.4.4'
]
