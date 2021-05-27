"
A BrowserstackCredentialsTest is a test class for testing the behavior of BrowserstackCredentials
"
Class {
	#name : #BrowserstackCoreTest,
	#superclass : #ParametrizedTestCase,
	#instVars : [
		'capabilities',
		'driver',
		'hasFailed'
	],
	#category : #'BrowserStack-Core-Tests'
}

{ #category : #tests }
BrowserstackCoreTest class >> buildName [
	^ BSBuildName current key
]

{ #category : #tests }
BrowserstackCoreTest class >> chromeCapabilities: capabilities [

	<desiredCapability>
	^ capabilities
		  setCapability: 'os' to: 'windows';
		  setCapability: 'os_version' to: '10';
		  setCapability: 'browser' to: 'Chrome';
		  setCapability: 'browser_version' to: 'latest';
		  yourself
]

{ #category : #tests }
BrowserstackCoreTest class >> pixelCapabilities: capabilities [

	<desiredCapability>
	^ capabilities
		setCapability: 'os_version' to: '11.0';
		setCapability: 'device' to: 'Google Pixel 4';
		setCapability: 'real_mobile' to: true;
		yourself.
]

{ #category : #tests }
BrowserstackCoreTest class >> projectName [
	^ 'smalltalk test suite'
]

{ #category : #tests }
BrowserstackCoreTest class >> resources [

	^{BSBuildName}
]

{ #category : #tests }
BrowserstackCoreTest class >> testParameters [

	| matrix capabilities |
	matrix := ParametrizedTestMatrix new.
	(Pragma allNamed: #desiredCapability in: self class) do: [ :pragma | 
		capabilities := BPGenericOptions new.
		capabilities setCapability: 'project' to: self projectName.
		capabilities setCapability: 'build' to: self buildName.
		matrix addCase: { (#capabilities
			 -> (self perform: pragma methodSelector with: capabilities)) } ].

	^ matrix
]

{ #category : #tests }
BrowserstackCoreTest >> assert: aBooleanOrBlock description: aStringOrBlock resumable: resumableBoolean [

	| val |
	val := aBooleanOrBlock value.
	val ifFalse: [ 
		hasFailed := true.
		driver executeScript: 'browserstack_executor: {"action": "setSessionStatus", "arguments": {"status":"failed","reason": "',aStringOrBlock value,'"}}' with: #() ].
	^ super
		  assert: [val]
		  description: aStringOrBlock
		  resumable: resumableBoolean
]

{ #category : #'as yet unclassified' }
BrowserstackCoreTest >> capabilities: aBPGenericOptions [ 
	capabilities := aBPGenericOptions
]

{ #category : #'as yet unclassified' }
BrowserstackCoreTest >> defaultTimeLimit [
	^ 1 minute
]

{ #category : #'as yet unclassified' }
BrowserstackCoreTest >> setUp [ 
	super setUp.
	hasFailed := false.
	BPRemoteWebDriver serverHost: 'hub-cloud.browserstack.com'.
	BPRemoteWebDriver username: BrowserstackCredentials browserstackUsername.
	BPRemoteWebDriver password: BrowserstackCredentials browserstackKey.
	BPRemoteWebDriver scheme: 'https'.
	BPRemoteWebDriver serverPort: 443.
	capabilities  setCapability: 'name' to: testSelector asString.
	driver := BPRemoteWebDriver new initWithCapabilities: capabilities
]

{ #category : #'as yet unclassified' }
BrowserstackCoreTest >> tearDown [

	super tearDown.
	hasFailed ifFalse: [ 
		driver
			executeScript:
			'browserstack_executor: {"action": "setSessionStatus", "arguments": {"status":"passed"}}'
			with: #(  ) ].
	driver quit
]

{ #category : #tests }
BrowserstackCoreTest >> testOne [

	driver get: 'https://google.fr'.
	self assert: true
]
