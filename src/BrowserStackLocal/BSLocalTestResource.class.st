Class {
	#name : #BSLocalTestResource,
	#superclass : #TestResource,
	#instVars : [
		'state'
	],
	#category : #BrowserStackLocal
}

{ #category : #running }
BSLocalTestResource >> initialze [
	super initialize.
	state := false
]

{ #category : #running }
BSLocalTestResource >> setUp [
	super setUp.
	Transcript show: 'start'; cr.
	BSLocal start.
	state := true
]

{ #category : #running }
BSLocalTestResource >> tearDown [
	super tearDown.
	Transcript show: 'stop'; cr.
	"BSLocal stop."
	state :=  false.
]
