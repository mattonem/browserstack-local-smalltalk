Class {
	#name : #BSZincServerTestResource,
	#superclass : #TestResource,
	#instVars : [
		'server'
	],
	#category : #'BrowserStackLocal-Tests'
}

{ #category : #initialization }
BSZincServerTestResource >> setUp [ 	
		super setUp.
		server := ZnServer startDefaultOn: 8080.

]

{ #category : #initialization }
BSZincServerTestResource >> tearDown [  	
		super tearDown.
		server stop
]
