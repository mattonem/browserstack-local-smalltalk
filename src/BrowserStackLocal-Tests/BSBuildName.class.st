Class {
	#name : #BSBuildName,
	#superclass : #TestResource,
	#classVars : [
		'Value'
	],
	#category : #'BrowserStackLocal-Tests'
}

{ #category : #evaluating }
BSBuildName class >> value [ 
	^ Value
]

{ #category : #running }
BSBuildName >> setUp [
	super setUp.
	Value := Time now asString
]
