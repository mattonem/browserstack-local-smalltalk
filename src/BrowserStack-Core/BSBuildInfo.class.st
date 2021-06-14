Class {
	#name : #BSBuildInfo,
	#superclass : #TestResource,
	#instVars : [
		'startTime',
		'randomKey'
	],
	#category : #'BrowserStack-Core'
}

{ #category : #running }
BSBuildInfo >> key [
	^ randomKey
]

{ #category : #running }
BSBuildInfo >> setUp [

	super setUp.
	startTime ifNil: [ startTime := Time now asString ].
	randomKey ifNil: [ 
		randomKey := UUIDGenerator new nextRandom16 asString ]
]

{ #category : #running }
BSBuildInfo >> startedAt [
	^ startTime
]

{ #category : #running }
BSBuildInfo >> tearDown [
	super tearDown.
	startTime := nil.
	randomKey := nil.
]
