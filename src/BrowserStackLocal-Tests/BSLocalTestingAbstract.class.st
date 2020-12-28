Class {
	#name : #BSLocalTestingAbstract,
	#superclass : #TestCase,
	#instVars : [
		'driver'
	],
	#category : #'BrowserStackLocal-Tests'
}

{ #category : #tests }
BSLocalTestingAbstract class >> isAbstract [ 
	^self name = #BSLocalTestingAbstract
]

{ #category : #tests }
BSLocalTestingAbstract class >> resources [

	^ super resources , (Array with: BSLocalTestResource with: BSBuildName)
]

{ #category : #tests }
BSLocalTestingAbstract >> defaultTimeLimit [ 
	^ 2 minute
]

{ #category : #running }
BSLocalTestingAbstract >> getCapabilities [
	^ self subclassResponsibility
]

{ #category : #running }
BSLocalTestingAbstract >> setUp [
	| option |
	super setUp.
	BPRemoteWebDriver serverHost: 'hub-cloud.browserstack.com'.
	BPRemoteWebDriver username: BSLocal browserstackUsername.
	BPRemoteWebDriver password: BSLocal browserstackKey.
	BPRemoteWebDriver scheme: 'https'.
	BPRemoteWebDriver serverPort: 443.
	
	option := self getCapabilities.
	driver := BPRemoteWebDriver new initWithCapabilities: option
]

{ #category : #running }
BSLocalTestingAbstract >> tearDown [ 
	super tearDown.
	driver quit.
]

{ #category : #running }
BSLocalTestingAbstract >> testBSLocal [
	driver get: 'http://localhost:8080'.
	self assert: driver getTitle equals: 'Welcome to Seaside 3.4.3'
]
