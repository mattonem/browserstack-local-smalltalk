Class {
	#name : #BSTestSessionStatus,
	#superclass : #TestCase,
	#category : #'BrowserStack-Core-Tests'
}

{ #category : #tests }
BSTestSessionStatus >> testFailureStatus [

	| testCase result id response|
	testCase := (BrowserstackCoreTestCaseTests selector: #testFailure)
		            executeFailure: true;
		            yourself.
	testCase instAnnouncer
		when: Announcement
		do: [ :symbol | id := testCase sessionId ].
	result := testCase run.
	response := NeoJSONReader fromString: (ZnEasy get:
		'https://' , BrowserstackCredentials browserstackUsername , ':'
		, BrowserstackCredentials browserstackKey
		, '@api.browserstack.com/automate/sessions/' , id , '.json') contents.
	self assert: ((response at: 'automation_session' ) at: 'status') equals: 'failed'
]

{ #category : #tests }
BSTestSessionStatus >> testPassedStatus [

	| testCase result id response|
	testCase := (BrowserstackCoreTestCaseTests selector: #testGoogle)
		            yourself.
	testCase instAnnouncer
		when: Announcement
		do: [ :symbol | id := testCase sessionId ].
	result := testCase run.
	response := NeoJSONReader fromString: (ZnEasy get:
		'https://' , BrowserstackCredentials browserstackUsername , ':'
		, BrowserstackCredentials browserstackKey
		, '@api.browserstack.com/automate/sessions/' , id , '.json') contents.
	self assert: ((response at: 'automation_session' ) at: 'status') equals: 'passed'
]
