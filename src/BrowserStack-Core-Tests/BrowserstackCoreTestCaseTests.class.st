Class {
	#name : #BrowserstackCoreTestCaseTests,
	#superclass : #BrowserstackTestCase,
	#instVars : [
		'executeFailure',
		'sessionId',
		'instAnnouncer'
	],
	#category : #'BrowserStack-Core-Tests'
}

{ #category : #tests }
BrowserstackCoreTestCaseTests >> executeFailure [
	^ executeFailure ifNil: [ false ]
]

{ #category : #'as yet unclassified' }
BrowserstackCoreTestCaseTests >> executeFailure: aBoolean [ 
	executeFailure := aBoolean
]

{ #category : #tests }
BrowserstackCoreTestCaseTests >> instAnnouncer [ 
	^ instAnnouncer ifNil: [ 	instAnnouncer := Announcer new. ]
]

{ #category : #'as yet unclassified' }
BrowserstackCoreTestCaseTests >> sessionId [
	^ sessionId
]

{ #category : #tests }
BrowserstackCoreTestCaseTests >> testFailure [

	self executeFailure ifFalse: [ self skip ].
	driver get: 'https://google.fr'.
	sessionId := (driver readSlot: (driver class slotNamed: #sessionID)).
	self instAnnouncer announce:Announcement new.
	self assert: false
]

{ #category : #tests }
BrowserstackCoreTestCaseTests >> testGoogle [

	driver get: 'https://google.fr'.
	sessionId := driver readSlot: (driver class slotNamed: #sessionID).
	self instAnnouncer announce: Announcement new.
	self assert: true
]
