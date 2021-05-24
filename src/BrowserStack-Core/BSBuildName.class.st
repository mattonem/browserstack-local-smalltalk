Class {
	#name : #BSBuildName,
	#superclass : #TestResource,
	#instVars : [
		'value'
	],
	#category : #'BrowserStack-Core'
}

{ #category : #running }
BSBuildName >> setUp [
	super setUp.
	value := Time now asString
]

{ #category : #running }
BSBuildName >> startedAt [
	^ value
]

{ #category : #running }
BSBuildName >> tearDown [
	super tearDown.
	value := nil.
]
