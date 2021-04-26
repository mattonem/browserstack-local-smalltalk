Class {
	#name : #BSLocalTestResource,
	#superclass : #TestResource,
	#instVars : [
		'state'
	],
	#category : #BrowserStackLocal
}

{ #category : #running }
BSLocalTestResource >> initialize [
	super initialize.
	state := false
]

{ #category : #running }
BSLocalTestResource >> setUp [

	super setUp.
	state ifTrue: [ ^ self ].
	BSLocal start.
	state := true
]

{ #category : #running }
BSLocalTestResource >> tearDown [
	super tearDown.
	BSLocal stop.
	state :=  false.
]
