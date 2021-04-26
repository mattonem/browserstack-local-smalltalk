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
