Class {
	#name : #BSBuildName,
	#superclass : #Object,
	#classVars : [
		'Value'
	],
	#category : #'BrowserStackLocal-Tests'
}

{ #category : #evaluating }
BSBuildName class >> value [ 
	^ Value ifNil: [ Value := Time now asString ]
]

{ #category : #running }
BSBuildName >> setUp [
	super setUp.
	Value := Time now asString
]
