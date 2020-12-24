Class {
	#name : #BSLocalTestResource,
	#superclass : #TestResource,
	#category : #BrowserStackLocal
}

{ #category : #running }
BSLocalTestResource >> setUp [
	super setUp.
	BSLocal start
]

{ #category : #running }
BSLocalTestResource >> tearDown [
	super tearDown.
	BSLocal stop
]
