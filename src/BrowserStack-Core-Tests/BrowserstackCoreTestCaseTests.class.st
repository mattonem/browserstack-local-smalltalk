Class {
	#name : #BrowserstackCoreTestCaseTests,
	#superclass : #BrowserstackTestCase,
	#category : #'BrowserStack-Core-Tests'
}

{ #category : #tests }
BrowserstackCoreTestCaseTests >> testGoogle [

	driver get: 'https://google.fr'.
	self assert: true
]
