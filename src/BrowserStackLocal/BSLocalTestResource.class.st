Class {
	#name : #BSLocalTestResource,
	#superclass : #TestResource,
	#instVars : [
		'state'
	],
	#category : #BrowserStackLocal
}

{ #category : #testing }
BSLocalTestResource class >> isAvailable [

	"This is (and must be) a lazy method.  If my current has a value, an attempt to make me available has already been made:  trust its result.  If not, try to make me available."

	current
		ifNil: [ self makeAvailable ]
		ifNotNil: [ current isUnavailable ifTrue: [ self makeAvailable ] ].
	^ self isAlreadyAvailable
]

{ #category : #running }
BSLocalTestResource >> initialize [
	super initialize.
	state := false
]

{ #category : #running }
BSLocalTestResource >> isAvailable [ 
	^ BSLocal running
]

{ #category : #running }
BSLocalTestResource >> setUp [

	super setUp.
	BSLocal start.
	state := true
]

{ #category : #running }
BSLocalTestResource >> tearDown [
	super tearDown.
	BSLocal stop.
	state :=  false.
]
