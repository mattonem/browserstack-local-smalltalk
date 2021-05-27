Class {
	#name : #BSBuildName,
	#superclass : #TestResource,
	#instVars : [
		'startTime',
		'randomKey'
	],
	#category : #'BrowserStack-Core'
}

{ #category : #running }
BSBuildName >> key [
	^ randomKey
]

{ #category : #running }
BSBuildName >> setUp [
	super setUp.
	startTime := Time now asString.
	randomKey := UUIDGenerator new nextRandom16 
]

{ #category : #running }
BSBuildName >> startedAt [
	^ startTime
]

{ #category : #running }
BSBuildName >> tearDown [
	super tearDown.
	startTime := nil.
]
