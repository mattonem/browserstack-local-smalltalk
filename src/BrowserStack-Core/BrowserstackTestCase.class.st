"
A BrowserstackCredentialsTest is a test class for testing the behavior of BrowserstackCredentials
"
Class {
	#name : #BrowserstackTestCase,
	#superclass : #ParametrizedTestCase,
	#instVars : [
		'capabilities',
		'driver',
		'hasFailed'
	],
	#category : #'BrowserStack-Core'
}

{ #category : #tests }
BrowserstackTestCase class >> isAbstract [
	^ self name = #BrowserstackTestCase 
]

{ #category : #tests }
BrowserstackTestCase class >> resources [

	^{BSBuildInfo}
]

{ #category : #tests }
BrowserstackTestCase class >> testParameters [

	| matrix |
	matrix := ParametrizedTestMatrix new.
	(Pragma allNamed: #desiredCapability in: self class) do: [ :pragma | 
		matrix addCase:
			{ (#capabilities -> (self perform: pragma methodSelector)) } ].
	(Pragma allNamed: #desiredCapabilities in: self class) do: [ :pragma | 
		(self perform: pragma methodSelector) do: [ :aCap | 
			matrix addCase: { (#capabilities -> aCap) } ] ].

	^ matrix
]

{ #category : #tests }
BrowserstackTestCase >> assert: aBooleanOrBlock description: aStringOrBlock resumable: resumableBoolean [

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

{ #category : #tests }
BrowserstackTestCase >> buildName [

	^ 'smalltalk build ' , self buildRandomKey , ' started at: '
	  , self buildStartTime
]

{ #category : #tests }
BrowserstackTestCase >> buildRandomKey [
	^ BSBuildInfo current key 
]

{ #category : #tests }
BrowserstackTestCase >> buildStartTime [

	^ BSBuildInfo current startedAt 
]

{ #category : #'as yet unclassified' }
BrowserstackTestCase >> capabilities: aBPGenericOptions [ 
	capabilities := aBPGenericOptions
]

{ #category : #'as yet unclassified' }
BrowserstackTestCase >> defaultCapabilities: someCapabilities [

	someCapabilities setCapability: 'name' to: testSelector asString.
	someCapabilities setCapability: 'project' to: self projectName.
	someCapabilities setCapability: 'project' to: self buildName.
	^ someCapabilities
]

{ #category : #'as yet unclassified' }
BrowserstackTestCase >> defaultTimeLimit [
	^ 1 minute
]

{ #category : #tests }
BrowserstackTestCase >> projectName [
	^ 'smalltalk test suite'
]

{ #category : #'as yet unclassified' }
BrowserstackTestCase >> setUp [

	super setUp.
	hasFailed := false.
	BPRemoteWebDriver serverHost: 'hub-cloud.browserstack.com'.
	BPRemoteWebDriver username:
		BrowserstackCredentials browserstackUsername.
	BPRemoteWebDriver password: BrowserstackCredentials browserstackKey.
	BPRemoteWebDriver scheme: 'https'.
	BPRemoteWebDriver serverPort: 443.
	self defaultCapabilities: capabilities.
	driver := BPRemoteWebDriver new initWithCapabilities: capabilities
]

{ #category : #'as yet unclassified' }
BrowserstackTestCase >> tearDown [

	super tearDown.
	hasFailed ifFalse: [ 
		driver
			executeScript:
			'browserstack_executor: {"action": "setSessionStatus", "arguments": {"status":"passed"}}'
			with: #(  ) ].
	driver quit
]
